import 'package:ably_flutter/ably_flutter.dart' as ably;
import 'package:another_stepper/another_stepper.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:uuid/uuid.dart';

import '../../../../../core/data/models/order.dart';
import '../../../../../core/storage/istorage.dart';
import '../contracts/order.dart';
import '../views/order.dart';

class OrderScreen extends StatefulWidget {
  static const String route = '/Order';
  final Orders order;
  const OrderScreen({Key? key, required this.order}) : super(key: key);

  @override
  OrderScreenController createState() => OrderScreenController();
}

class OrderScreenController extends State<OrderScreen>
    implements OrderScreenControllerContract {
  late OrderScreenViewContract view;

  @override
  void initState() {
    view = OrderScreenView(this);
    order = widget.order;
    createStepperData();
    createAblyRealtimeInstance();

    super.initState();
  }

  var storage = GetIt.I.get<CacheStorage>();

  @override
  Widget build(BuildContext context) {
    return view.build(context);
  }

  @override
  List<StepperData> stepperData = [];
  void createStepperData() {
    stepperData = [
      StepperData(
        title: StepperText(
          "Ordered",
          textStyle: const TextStyle(color: Colors.grey),
        ),
        subtitle: StepperText("Your order has been placed"),
        iconWidget: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: currentStepIndex >= 0 ? Colors.green : Colors.yellow,
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
      StepperData(
        title: StepperText("Preparing"),
        subtitle: StepperText("Your order is being prepared"),
        iconWidget: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: currentStepIndex >= 1 ? Colors.green : Colors.yellow,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Icon(Icons.looks_two,
              color: currentStepIndex >= 1 ? Colors.green : Colors.white),
        ),
      ),
      StepperData(
        title: StepperText("On the way"),
        subtitle: StepperText(
            "Our delivery executive is on the way to deliver your item"),
        iconWidget: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: currentStepIndex >= 2 ? Colors.green : Colors.yellow,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Icon(Icons.looks_3,
              color: currentStepIndex >= 2 ? Colors.green : Colors.white),
        ),
      ),
      StepperData(
        title: StepperText(
          "Delivered",
          textStyle: TextStyle(
              color: currentStepIndex >= 3 ? Colors.green : Colors.grey),
        ),
        iconWidget: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: currentStepIndex >= 3 ? Colors.green : Colors.red,
            borderRadius: BorderRadius.circular(30),
          ),
          //  child: Icon(Icons.done),
        ),
      ),
    ];
  }

  void createAblyRealtimeInstance() async {
    var uuid = const Uuid();
    myRandomClientId = uuid.v4();
    // Create an instance of ClientOptions with Ably token and authCallback
    ably.ClientOptions clientOptions = ably.ClientOptions(
      key: 'dXvBlw.MHXX7w:aGwzwqpfjuSTCra09M1i1WVOwqVm3-Zm7sC5oRj9kns',
      clientId: myRandomClientId, // Optional
    );
    clientOptions.clientId = myRandomClientId;
    try {
      realtimeInstance = ably.Realtime(options: clientOptions);
      chatChannel = realtimeInstance!.channels.get('flowtrack');
      await chatChannel!.attach();
      chatChannel!.subscribe().listen((event) {
        setState(() {
          if (event.data.toString().isNotEmpty) {
            int index = stepperData.indexWhere(
                (step) => step.title!.text == event.data.toString());
            if (index >= 0 && index <= 3) {
              currentStepIndex = index;
            }

            createStepperData();
          }
        });
      });
      realtimeInstance!.connection
          .on(ably.ConnectionEvent.connected)
          .listen((ably.ConnectionStateChange stateChange) async {
      });
      listen();
    } catch (error) {
      rethrow;
    }
  }

  @override
  void dispose() {
    // Dispose of the channel here
    chatChannel?.detach();
    super.dispose();
  }

  listen() {
    // StreamSubscription<ably.Message> subscription =
    //     chatChannel!.subscribe().listen((ably.Message message) {
    //   setState(() {
    //     currentStepIndex = stepperData
    //         .indexWhere((step) => step.title!.text == message.data.toString());
    //   });
    // });
  }
  @override
  publish() async {
    await chatChannel!.publish(
      message:
          ably.Message(name: widget.order.item, data: messageController.text),
    );
  }

  ably.Realtime? realtimeInstance;
  var newMsgFromAbly;
  ably.RealtimeChannel? chatChannel;
  @override
  var messageController = TextEditingController();
  @override
  var nameController = TextEditingController();
  var myRandomClientId = '';
  @override
  List<String> deliverySteps = [
    "Ordered",
    "Packed",
    "Shipped",
    "Out for delivery",
    "Delivered"
  ];

  @override
  int currentStepIndex = 0;

  @override
  Orders? order;
}
