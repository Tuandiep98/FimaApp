import 'dart:core';

import 'package:json_annotation/json_annotation.dart';

part 'enum_helper.dart';

enum SystemStatus {
  Loading,
  Online,
  Offline,
}

enum OrderReceiveType {
  @JsonValue(0)
  all,
  @JsonValue(1)
  scanQr,
  @JsonValue(2)
  collectFromBar,
}

enum DataState {
  FetchingData,
  DataFetchedSuccessfully,
  NoDataToDisplay,
}
