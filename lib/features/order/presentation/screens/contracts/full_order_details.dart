import 'package:flutter/material.dart';


///This defines the contract that the view should implement
abstract class FullOrderDetailsViewContract {
  Widget build(BuildContext context);
  void showErrorMessage(String message);
  void showSuccessMessage(BuildContext context, String message);
}

///This defines the contract that Controller should implement
abstract class FullOrderDetailsControllerContract {
  late bool visible;
  onTap();
  // late List<CryptoResponse>? assets;
  List<double> data=[];
  //late List<AssetIconResponse>? icons;
}
