import 'package:fima/core/utils/enum.dart';
import 'package:flutter/material.dart';

class DataBuilderArguments {
  DataState state;
  Widget fetchingDataWidget;
  Widget noDataToDisplayWidget;
  Widget dataFetchedSuccessfullyWidget;

  DataBuilderArguments({
    this.state,
    this.fetchingDataWidget,
    this.noDataToDisplayWidget,
    this.dataFetchedSuccessfullyWidget,
  });
}

class DataBuilder extends StatefulWidget {
  final DataBuilderArguments arguments;
  const DataBuilder({Key key, this.arguments}) : super(key: key);

  @override
  State<DataBuilder> createState() => _DataBuilderState();
}

class _DataBuilderState extends State<DataBuilder> {
  @override
  Widget build(BuildContext context) {
    switch (widget.arguments.state) {
      case DataState.FetchingData:
        return widget.arguments.fetchingDataWidget;
        break;
      case DataState.NoDataToDisplay:
        return widget.arguments.dataFetchedSuccessfullyWidget;
        break;
      case DataState.DataFetchedSuccessfully:
        return widget.arguments.dataFetchedSuccessfullyWidget;
        break;
      default:
        return const SizedBox();
        break;
    }
  }
}
