import 'package:fima/core/view_models/interfaces/ihome_screen_viewmodel.dart';
import 'package:fima/ui/common_widgets/no_data_to_display.dart';
import 'package:fima/ui/data_screen.dart';
import 'package:fima/ui/home_screen/widgets/category_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
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
    return Consumer<IHomeScreenViewModel>(
      builder: (_, __, ___) {
        return DataBuilder(
          arguments: DataBuilderArguments(
            dataFetchedSuccessfullyWidget: Container(
              width: MediaQuery.of(context).size.width / 2 - 15,
              height: 285,
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
                          style: TextStyleUtils.bold(30)
                              .copyWith(color: Colors.white),
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
                      child:
                          Consumer<IHomeScreenViewModel>(builder: (_, __, ___) {
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
            ),
            fetchingDataWidget: CategoriesTrackerWidgetShimmer(),
            noDataToDisplayWidget: Container(
              width: MediaQuery.of(context).size.width / 2 - 15,
              height: 285,
              decoration: BoxDecoration(
                color: Color(0xffe67e22),
                borderRadius: BorderRadius.circular(5),
              ),
              child: NoDataToDisplay(),
            ),
            state: _viewModel.state,
          ),
        );
      },
    );
  }
}

class CategoriesTrackerWidgetShimmer extends StatelessWidget {
  const CategoriesTrackerWidgetShimmer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2 - 15,
      height: 285,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(5),
      ),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[100],
        highlightColor: Colors.grey[300],
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  Text(
                    'Categories',
                    style:
                        TextStyleUtils.bold(30).copyWith(color: Colors.white),
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
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (_, __) {
                  return CategoryCardShimmer();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
