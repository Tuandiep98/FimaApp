import 'package:dio/dio.dart';
import 'package:fima/core/hive_database/hive_database.dart';
import 'package:get_it/get_it.dart';

import 'global_data.dart';
import 'locator_dao.dart';
import 'locator_service.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerLazySingleton(() => HiveDatabase());
  locator.registerLazySingleton(() => GlobalData());
  await locator<HiveDatabase>().init();

  setupRestClient();
  registerDaoSingletons(locator);
  registerServiceSingletons(locator);
}

void setupRestClient({String bearerAuthToken}) {
  var dio = Dio();
  dio.options = BaseOptions(
    connectTimeout: 100000,
    receiveTimeout: 240000,
  );

  if (locator.isRegistered(instanceName: "RestClient")) {
    locator.unregister(instanceName: "RestClient");
  }
  if (locator.isRegistered(instanceName: "TicketingRestClient")) {
    locator.unregister(instanceName: "TicketingRestClient");
  }

  if (locator.isRegistered(instanceName: "Go2HardwareRestClient")) {
    locator.unregister(instanceName: "Go2HardwareRestClient");
  }
  try {
    // locator.registerLazySingleton(
    //   () => RestClient(dio, baseUrl: EnvironmentUtil.apiURL),
    //   instanceName: "RestClient",
    // );
    // locator.registerLazySingleton(
    //   () => Go2HardwareRestClient(dio,
    //       baseUrl: EnvironmentUtil.handheldHardwareApiUrl),
    //   instanceName: "Go2HardwareRestClient",
    // );
    // locator.registerLazySingleton(
    //   () => TicketingRestClient(dio, baseUrl: EnvironmentUtil.apiURL),
    //   instanceName: "TicketingRestClient",
    // );
  } catch (e) {
    print(e);
  }
}

// RestClient getRestClient() {
//   return locator.get<RestClient>(instanceName: 'RestClient');
// }

// TicketingRestClient getTicketingRestClient() {
//   return locator.get<TicketingRestClient>(instanceName: 'TicketingRestClient');
// }

// Go2HardwareRestClient getGo2HardwareRestClient() {
//   return locator.get<Go2HardwareRestClient>(
//       instanceName: 'Go2HardwareRestClient');
// }

// Future<void> setDeviceSerial() async {
//   String serial;
//   if (EnvironmentUtil.currentEnv == Environment.prod) {
//     serial = await HardwarePlugin.getSerialNumber;
//     if (serial == 'unknown') {
//       serial = '123456';
//     }
//   } else {
//     serial = EnvironmentUtil.deviceSerial;
//   }

//   locator<GlobalData>().deviceInfo.deviceSerial = serial;
//   locator<TicketingGlobalData>().deviceInfo.deviceSerial = serial;
// }

// Future<void> _removeOldHive() async {
//   var permanentFolder = await StorageUtils.getApplicationPermanentDirectory();
//   var hiveFolder = Directory(permanentFolder.path + '/hive');
//   if (hiveFolder.existsSync()) hiveFolder.deleteSync(recursive: true);
// }

// Future<bool> _checkIsNewVersion() async {
//   var permanentFolder = await StorageUtils.getApplicationPermanentDirectory();
//   var currentVersion = (await PackageInfo.fromPlatform()).version;
//   bool needToUpdateDB = false;
//   try {
//     var versionFile = File(permanentFolder.path + '/version.txt');
//     if (versionFile.existsSync()) {
//       var contents = await versionFile.readAsString();
//       if (contents != currentVersion) {
//         await versionFile.writeAsString(currentVersion); // write new version
//       }
//       return needToUpdateDB = contents != currentVersion;
//     } else {
//       await versionFile.writeAsString(currentVersion);
//       return needToUpdateDB = false;
//     }
//   } catch (e) {
//     await LoggerUtils.logException(e);
//   }
//   return needToUpdateDB;
// }
