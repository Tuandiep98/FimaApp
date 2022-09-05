import 'package:dio/dio.dart';
import 'package:fima/core/utils/rlog.dart';
import 'package:fima/core/utils/storage_utils.dart';
import 'package:fima/global/global_data.dart';
import 'package:fima/global/locator.dart';

class LoggerUtils {
  static final _globalData = locator<GlobalData>();
  static Future initLogger() async {
    //path: '/storage/emulated/0/Android/data/com.ecr.ecr_stock_ticketing_pax_app_v2/files/Log.txt'
    var storage = await StorageUtils.getApplicationPermanentDirectory();
    RLogger.initLogger(
      tag: 'Warning',
      isWriteFile: true,
      filePath: storage.path.toString() + "/logs/",
    );
  }

  static Future logException(dynamic e) async {
    if (RLogger.instance == null) await initLogger();
    if (e is Exception) {
      String url = '';
      String error = '';
      try {
        if (e is DioError) {
          url = '\n URL: ' + e.request.baseUrl + e.request.path;
          error = '\n Details: ' + e.response.data['errors'].toString();
        }
      } catch (_) {}
      await RLogger.instance
          ?.e(url + error, e, StackTrace.current, isWriteFile: true);
    } else {
      await RLogger.instance?.e('', e, StackTrace.current, isWriteFile: true);
    }
  }

  static Future logError(String msg) async {
    if (RLogger.instance == null) await initLogger();
    await RLogger.instance?.i('\n' + msg, tag: 'Error', isWriteFile: true);
  }

  static Future logWarning(String msg) async {
    if (_globalData.logLevel != 'Error') {
      if (RLogger.instance == null) await initLogger();
      await RLogger.instance?.i('\n' + msg, tag: 'Warning', isWriteFile: true);
    }
  }

  static Future logInfo(String msg) async {
    if (_globalData.logLevel == 'Info') {
      if (RLogger.instance == null) await initLogger();
      await RLogger.instance?.i('\n' + msg, tag: 'Info', isWriteFile: true);
    }
  }
}
