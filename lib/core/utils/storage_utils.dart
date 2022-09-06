import 'dart:io';
import 'package:path_provider/path_provider.dart';

import 'native_utils.dart';

class StorageUtils {
  /// directory especially for this app
  static Future<Directory> getApplicationPermanentDirectory() async {
    var storage;
    if (Platform.isAndroid) {
      storage = await getExternalStorageDirectory();
    } else if (Platform.isIOS) {
      storage = await getApplicationDocumentsDirectory();
    } else {
      storage = await getApplicationDocumentsDirectory();
    }

    /// Determine [rootDataFolder] based on android api version
    /// due to file restriction on api version >= 30 (android 11)
    var rootDataFolder = storage;
    if (Platform.isAndroid) {
      rootDataFolder = (await NativeUtils.isAndroidSDK30OrAbove())
          ? storage.parent.parent
              .parent // = '.../Android' ('../Android/Data' is restricted on api version >= 30)
          : storage.parent.parent; // = '.../Android/Data'
    }

    var permanentFolder = Directory(rootDataFolder.path + '/fima_app');
    if (!permanentFolder.existsSync()) permanentFolder.createSync();
    return permanentFolder;
  }
}
