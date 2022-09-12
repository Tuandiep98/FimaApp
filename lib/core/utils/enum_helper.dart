part of 'enum.dart';

/// Workaround to achieve enum with value (like in `C#`)
class EnumHelper {
  static int getValue<T>(Map<T, MyEnum> enumMap, T myEnum) {
    if (myEnum == null) {
      return -2;
    }

    return enumMap[myEnum].value;
  }

  static String getDescription<T>(Map<T, MyEnum> enumMap, T myEnum) {
    if (myEnum == null) {
      return '';
    }

    return enumMap[myEnum].description;
  }

  static T getEnum<T>(Map<T, MyEnum> enumMap, int value) {
    return enumMap.keys.firstWhere(
      (key) => enumMap[key].value == value,
      orElse: () => null,
    );
  }

  static T getEnumFromDescription<T>(
      Map<T, MyEnum> enumMap, String description) {
    return enumMap.keys.firstWhere(
      (key) => enumMap[key].description == description,
      orElse: () => null,
    );
  }
}

class MyEnum {
  int value;
  String description;

  MyEnum({this.value, this.description});
}

class EnumMap {
  static Map<SystemStatus, MyEnum> systemStatus = {
    SystemStatus.Loading: MyEnum(description: 'Loading...'),
    SystemStatus.Online: MyEnum(description: 'Online'),
    SystemStatus.Offline: MyEnum(description: 'Offline'),
  };

  static Map<DataState, MyEnum> dataState = {
    DataState.FetchingData: MyEnum(description: 'Fetching data'),
    DataState.DataFetchedSuccessfully:
        MyEnum(description: 'Data Fetched Successfully'),
    DataState.NoDataToDisplay: MyEnum(description: 'No Data To Display'),
  };
}
