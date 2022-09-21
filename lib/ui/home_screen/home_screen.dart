import 'package:calendar_view/calendar_view.dart';
import 'package:fima/core/utils/text_style_utils.dart';
import 'package:fima/core/view_models/interfaces/itransaction_viewmodel.dart';
import 'package:fima/ui/common_widgets/title_txt.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../global/mock_data.dart';
import 'widgets/categories_tracker_widget.dart';
import 'widgets/today_activity_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ITransactionViewModel _viewModel;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await MockData.initMockData();
    });
    _viewModel = context.read<ITransactionViewModel>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _viewModel.initTransactions();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                height: 320,
                child: Consumer<ITransactionViewModel>(
                    builder: (_, _viewModel, __) {
                  return MonthView(
                    cellAspectRatio: 2,
                    showBorder: false,
                    controller: EventController(),
                    // to provide custom UI for month cells.
                    cellBuilder: (date, events, isToday, isInMonth) {
                      // Return your widget to display as month cell.
                      return Container(
                        color: isInMonth
                            ? Color(_viewModel.getColorActivitiesOfTheDay(date))
                            : Colors.grey[200],
                        child: Stack(
                          children: [
                            Positioned.fill(
                              top: 5,
                              left: 5,
                              child: Text(
                                '${date.day}',
                                style: TextStyleUtils.thin(18).copyWith(
                                    color: isInMonth
                                        ? Colors.black
                                        : Colors.grey[200]),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    onPageChange: (date, pageIndex) =>
                        print("$date, $pageIndex"),
                    onCellTap: (events, date) {
                      // Implement callback when user taps on a cell.
                      print(events);
                    },
                    startDay:
                        WeekDays.sunday, // To change the first day of the week.
                    // This callback will only work if cellBuilder is null.
                    onEventTap: (event, date) => print(event),
                    onDateLongPress: (date) => print(date),
                  );
                }),
              ),
            ),
            TitleText(title: 'Activity'),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Consumer<ITransactionViewModel>(
                      builder: (_, _viewModel, ___) {
                    return _viewModel.transactionForDisplays != null &&
                            _viewModel.transactionForDisplays?.length > 0
                        ? TodayActivityWidget(
                            transactions: _viewModel.transactionForDisplays
                                .where((x) =>
                                    x.createdAt.day == DateTime.now().day &&
                                    x.createdAt.month == DateTime.now().month &&
                                    x.createdAt.year == DateTime.now().year)
                                .toList())
                        : TodayActivityWidgetShimmer();
                  }),
                  Spacer(),
                  CategoriesTrackerWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
