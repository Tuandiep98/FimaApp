import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/screenutil_init.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'core/utils/native_utils.dart';
import 'global/background_sync_manager.dart';
import 'global/connection_checking.dart';
import 'global/global_data.dart';
import 'global/locator.dart';
import 'package:permission_handler/permission_handler.dart';

import 'global/my_router_observer.dart';
import 'global/navigation_utils.dart';
import 'global/providers.dart';
import 'global/router.dart';

void main() {
  mainDelegate();
}

Future<void> mainDelegate() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ensureFilePermission();
  await setupLocator();

  runApp(const MyApp());
}

Future<void> ensureFilePermission() async {
  if (Platform.isIOS) {
    await Permission.storage.request();
  } else {
    if (await NativeUtils.isAndroidSDK30OrAbove()) {
      var filePermissionMethodChannel =
          const MethodChannel('file_permission_channel');
      if (await filePermissionMethodChannel
              .invokeMethod('checFilePermission') ==
          false) {
        await filePermissionMethodChannel.invokeMethod('request');
      }
    } else {
      await Permission.storage.request();
    }
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [...viewModelProviders],
      child: ScreenUtilInit(
        designSize: const Size(720, 1280),
        builder: () => GetMaterialApp(
          title: 'Fima app',
          navigatorKey: NavigationUtils.navigatorKey,
          onGenerateRoute: (settings) => MyRouter.generateRoute(settings),
          navigatorObservers: [MyRouteObserver()],
          initialRoute: MyRouter.splash,
          theme: ThemeData(
            primarySwatch: Colors.yellow,
            scaffoldBackgroundColor: Colors.white,
            textTheme: GoogleFonts.latoTextTheme(
              Theme.of(context).textTheme,
            ),
          ),
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _backgroundSyncTimer?.cancel();
    super.dispose();
  }
}

Timer _backgroundSyncTimer;

void initBackgroundSync() {
  _backgroundSyncTimer?.cancel();
  var backgroundSyncFrequency = 600;

  //get time to sync
  _backgroundSyncTimer = Timer.periodic(
      Duration(seconds: backgroundSyncFrequency), (Timer t) async {
    if (!(await ConnectionChecking.check())) return;
    if (!locator<GlobalData>().isSynchronizing) {
      await BackgroundSyncManager.backgroundSyncs();
    }
  });
}
