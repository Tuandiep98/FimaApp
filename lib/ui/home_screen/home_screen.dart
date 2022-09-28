import 'package:calendar_view/calendar_view.dart';
import 'package:fima/core/utils/dialog_utils.dart';
import 'package:fima/core/utils/text_style_utils.dart';
import 'package:fima/core/view_models/interfaces/itransaction_viewmodel.dart';
import 'package:fima/ui/common_widgets/dot.dart';
import 'package:fima/ui/common_widgets/title_txt.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
                height: 285,
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
                        padding: const EdgeInsets.all(3),
                        color: isInMonth
                            ? Color(_viewModel.getColorActivitiesOfTheDay(date))
                            : Colors.grey[200],
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${date.day}',
                              style: TextStyleUtils.thin(18).copyWith(
                                  color: isInMonth
                                      ? Colors.black
                                      : Colors.grey[200]),
                            ),
                            isToday
                                ? Dot(color: Colors.red)
                                : const SizedBox.shrink(),
                          ],
                        ),
                      );
                    },
                    onPageChange: (date, pageIndex) =>
                        print("$date, $pageIndex"),
                    onCellTap: (events, date) async {
                      // Implement callback when user taps on a cell.
                      if (_viewModel.hasTransaction(date)) {
                        _viewModel.initTransactionsByDate(date);
                        await DialogUtils.showActivityOfDateDialog(date);
                      }
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
                  TodayActivityWidget(),
                  Spacer(),
                  CategoriesTrackerWidget(),
                ],
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
