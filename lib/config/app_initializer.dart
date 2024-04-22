
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

import '../core/storage/istorage.dart';
import '../core/storage/shared_pref.dart';

class AppInitializer {
  static late GetIt instanceLocator;

  AppInitializer._();

  static void close() {
    instanceLocator.reset();
  }

  static Future create() async {
    if (kDebugMode) {
      // Bloc.observer = AppBlocObserver();
    }
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    await ScreenUtil.ensureScreenSize();

    initializeDi();
  }

  static dynamic initGetIt() async {
    instanceLocator = GetIt.I;
    await create();
  }

  static dynamic logout() async {
    try {
      await instanceLocator.reset();
      await initGetIt();
    } catch (e) {
      // logger.d(e);
    }
  }



  static initBlocs() {
    //   instanceLocator.registerLazySingleton<DownloadBloc>(
    //   () => DownloadBloc(downloadRepo: instanceLocator()),
    // );

  }

  static initUseCases() {
    //usecase
    // instanceLocator.registerLazySingleton(() => LoginUseCase(repository: instanceLocator()));
  }

  static initRepos() {
    //repository
    // instanceLocator.registerLazySingleton<IDownload>(
    //       () => DownloadRepository(
    //     remoteDataSource: instanceLocator(),
    //     localDataSource: instanceLocator()
    //   //  localDataSource: instanceLocator(),
    //   ),
    // );

  }

   static initRemoteDataSources() {
    //remote data sources
    // instanceLocator
    //     .registerLazySingleton<NetworkInfo>(() => NetworkInfoImplementation());


    // instanceLocator
    //     .registerLazySingleton<ApiClient>(() => DioClient(Dio()));

    // instanceLocator.registerLazySingleton<ApiServices>(
    //   () => ApiServicesImpl(
    //     apiClient: instanceLocator(),
    //   ),
    // );
  }

  static initLocalDataSources() {
    //data sources
    instanceLocator.registerLazySingleton<CacheStorage>(() => SharedPreferenceImpl(),);
    // instanceLocator.registerLazySingleton<DatabaseStorage>(() => IsarImpl(),);
    // instanceLocator.registerLazySingleton<LocalStorage>(() => LocalStorageImpl(cacheStorage: instanceLocator(), databaseStorage: instanceLocator()),);
  }

  // initServices() {}

  static initializeDi() {
  //  initSecurity();
    //initHelper();
    initLocalDataSources();
    initUseCases();
   initRemoteDataSources();
    initRepos();
    initBlocs();
    // initServices();
  }

  static void disposeInstance<T extends Bloc>(T blocInstance) {
    instanceLocator.unregister(instance: blocInstance);
  }
}