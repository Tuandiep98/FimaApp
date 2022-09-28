import 'package:fima/core/view_models/interfaces/ihome_screen_viewmodel.dart';
import 'package:fima/core/view_models/interfaces/itransaction_viewmodel.dart';
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
    return Consumer2<IHomeScreenViewModel, ITransactionViewModel>(
      builder: (_, __, _transViewModel, ____) {
        return DataBuilder(
          arguments: DataBuilderArguments(
            dataFetchedSuccessfullyWidget: Material(
              elevation: 10,
              borderRadius: BorderRadius.circular(8),
              color: Color(0xFFFFFFFF),
              child: Container(
                width: MediaQuery.of(context).size.width / 2 - 15,
                height: 285,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Material(
                          elevation: 2,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            bottomRight: Radius.circular(8),
                          ),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              color: Color(0xFFf0932b),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                bottomRight: Radius.circular(8),
                              ),
                            ),
                            child: Text(
                              'Categories for month',
                              style: TextStyleUtils.bold(25)
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                    Container(
                      height: 250,
                      child: SingleChildScrollView(
                        child: Consumer<IHomeScreenViewModel>(
                            builder: (_, __, ___) {
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
            state: _viewModel.getScreenState(),
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
