import 'package:fima/core/view_models/interfaces/ihome_screen_viewmodel.dart';
import 'package:fima/ui/common_widgets/no_data_to_display.dart';
import 'package:fima/ui/home_screen/widgets/category_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/utils/text_style_utils.dart';

class CategoriesTrackerWidget extends StatefulWidget {
  const CategoriesTrackerWidget({Key key}) : super(key: key);

  @override
  _CategoriesTrackerWidgetState createState() =>
      _CategoriesTrackerWidgetState();
}

class _CategoriesTrackerWidgetState extends State<CategoriesTrackerWidget> {
  IHomeScreenViewModel _viewModel;
  @override
  void initState() {
    _viewModel = context.read<IHomeScreenViewModel>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _viewModel.getCategories();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2 - 15,
      height: 280,
      decoration: BoxDecoration(
        color: Color(0xffe67e22),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                Text(
                  'Categories',
                  style: TextStyleUtils.bold(30).copyWith(color: Colors.white),
                ),
                Spacer(),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 16,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: 195,
            child: SingleChildScrollView(
              child: Consumer<IHomeScreenViewModel>(builder: (_, __, ___) {
                return _viewModel.categoriesForDisplay != null
                    ? Column(
                        children: _viewModel.categoriesForDisplay
                            .map((e) => CategoryCard(category: e))
                            .toList(),
                      )
                    : NoDataToDisplay(hideImg: true);
              }),
            ),
          ),
        ],
      ),
    );
  }
}
