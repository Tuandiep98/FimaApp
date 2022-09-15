import 'package:fima/core/ui_model/category_ui_model.dart';
import 'package:fima/core/utils/text_style_utils.dart';
import 'package:fima/global/global_data.dart';
import 'package:fima/global/locator.dart';
import 'package:flutter/material.dart';

class DropdownList extends StatefulWidget {
  final List<CategoryUIModel> dropdownList;
  const DropdownList({Key key, this.dropdownList}) : super(key: key);

  @override
  State<DropdownList> createState() => _DropdownListState();
}

class _DropdownListState extends State<DropdownList> {
  CategoryUIModel dropdownValue;
  @override
  void initState() {
    dropdownValue = widget.dropdownList.first;
    locator<GlobalData>().categorySelected = dropdownValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<CategoryUIModel>(
      value: dropdownValue,
      // icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.transparent,
      ),
      onChanged: (CategoryUIModel value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value;
          locator<GlobalData>().categorySelected = value;
        });
      },
      items: widget.dropdownList
          .map<DropdownMenuItem<CategoryUIModel>>((CategoryUIModel value) {
        return DropdownMenuItem<CategoryUIModel>(
          value: value,
          child: Text(
            value.name,
            maxLines: 1,
            overflow: TextOverflow.fade,
            style: TextStyleUtils.light(30).copyWith(color: Colors.grey[500]),
          ),
        );
      }).toList(),
    );
  }
}
