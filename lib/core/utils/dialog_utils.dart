import 'package:fima/core/utils/text_style_utils.dart';
import 'package:fima/core/view_models/interfaces/itransaction_viewmodel.dart';
import 'package:fima/global/app_text.dart';
import 'package:fima/global/global_data.dart';
import 'package:fima/global/locator.dart';
import 'package:fima/ui/common_widgets/currency_money_display.dart';
import 'package:fima/ui/common_widgets/custom_dialog.dart';
import 'package:fima/ui/common_widgets/no_data_to_display.dart';
import 'package:fima/ui/data_screen.dart';
import 'package:fima/ui/home_screen/widgets/today_activity_widget.dart';
import 'package:fima/ui/home_screen/widgets/transaction_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'localization_utils.dart';

class DialogUtils {
  static Future<void> showYesNoDialog({
    String title,
    String body,
    Function onYes,
    Function onNo,
    bool barrierDismissible = false,
  }) async {
    if (onYes == null) onYes = () => {Get.back()};
    if (onNo == null) onNo = () => {Get.back()};

    await Get.dialog(
      CustomDialogSimple(
        titleText: title,
        bodyText: body,
        actionButtons: [
          CustomDialogActionButton(
            btnColor: Colors.grey[700],
            textColor: Colors.white,
            text: translations.textStatic('No'),
            onPressed: onNo,
          ),
          CustomDialogActionButton(
            btnColor: Colors.green,
            textColor: Colors.white,
            text: translations.textStatic('Yes'),
            onPressed: onYes,
          ),
        ],
      ),
      barrierDismissible: barrierDismissible,
    );
  }

  static Future<void> showOkCancelDialog({
    String title,
    String body,
    Function onOK,
    Function onCancel,
    bool barrierDismissible = false,
  }) async {
    if (onOK == null) onOK = () => {Get.back()};
    if (onCancel == null) onCancel = () => {Get.back()};

    await Get.dialog(
      CustomDialogSimple(
        titleText: title,
        bodyText: body,
        actionButtons: [
          CustomDialogActionButton(
            btnColor: Colors.grey[700],
            textColor: Colors.white,
            text: translations.textStatic(AppText.lblCancel),
            onPressed: onCancel,
          ),
          CustomDialogActionButton(
            btnColor: Colors.green,
            textColor: Colors.white,
            text: translations.textStatic(AppText.lblOK),
            onPressed: onOK,
          ),
        ],
      ),
      barrierDismissible: barrierDismissible,
    );
  }

  static Future<void> showOkDialog({
    String title,
    String body,
    Function onOK,
    bool barrierDismissible = false,
  }) async {
    if (onOK == null) onOK = () => {Get.back()};

    await Get.dialog(
      CustomDialogSimple(
        titleText: title,
        bodyText: body,
        actionButtons: [
          CustomDialogActionButton(
            btnColor: Colors.green,
            textColor: Colors.white,
            text: translations.textStatic(AppText.lblOK),
            onPressed: onOK,
          ),
        ],
      ),
      barrierDismissible: barrierDismissible,
    );
  }

  static Future<void> showRetryDialog({
    String title,
    String body,
    Function onRetry,
    bool barrierDismissible = false,
  }) async {
    if (onRetry == null) onRetry = () => {Get.back()};

    await Get.dialog(
      CustomDialogSimple(
        titleText: title,
        bodyText: body,
        actionButtons: [
          CustomDialogActionButton(
            btnColor: Colors.green,
            textColor: Colors.white,
            text: translations.textStatic('Retry'),
            onPressed: onRetry,
          ),
        ],
      ),
      barrierDismissible: barrierDismissible,
    );
  }

  static Future<void> showContinueDialog({
    String title,
    String body,
    Function onOK,
    bool barrierDismissible = false,
  }) async {
    if (onOK == null) onOK = () => {Get.back()};

    await Get.dialog(
      CustomDialogSimple(
        titleText: title,
        bodyText: body,
        actionButtons: [
          CustomDialogActionButton(
            btnColor: Colors.green,
            textColor: Colors.white,
            text: translations.textStatic(AppText.lblContinue),
            onPressed: onOK,
          ),
        ],
      ),
      barrierDismissible: barrierDismissible,
    );
  }

  static Future<void> showContinueGoBackDialog({
    String title,
    String body,
    Function onOK,
    Function onCancel,
    bool barrierDismissible = false,
  }) async {
    if (onOK == null) onOK = () => {Get.back()};
    if (onCancel == null) onCancel = () => {Get.back()};

    await Get.dialog(
      CustomDialogSimple(
        titleText: title,
        bodyText: body,
        actionButtons: [
          CustomDialogActionButton(
            isContinue: true,
            btnColor: Colors.grey[700],
            textColor: Colors.white,
            text: translations.textStatic(AppText.lblGoBack),
            onPressed: onCancel,
          ),
          CustomDialogActionButton(
            isContinue: true,
            btnColor: Colors.green,
            textColor: Colors.white,
            text: translations.textStatic(AppText.lblContinueAnyway),
            onPressed: onOK,
          ),
        ],
      ),
      barrierDismissible: barrierDismissible,
    );
  }

  static Future<void> showYesNoBottomDialog(
    BuildContext context, {
    Widget body,
    Function onNo,
    Function onYes,
  }) async {
    if (onNo == null) onNo = () => {Get.back()};
    if (onYes == null) onYes = () => {Get.back()};

    await showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return IntrinsicHeight(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(40),
                topLeft: Radius.circular(40),
              ),
              color: Colors.white,
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      left: 40,
                      right: 40,
                    ),
                    child: Icon(
                      Icons.horizontal_rule_rounded,
                      size: 30,
                      color: Colors.grey[300],
                    ),
                  ),
                  body ?? const SizedBox.shrink(),
                  SizedBox(
                    height: 40,
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static Future<void> showActivityOfDateDialog(DateTime date) async {
    DateTime now = DateTime.now();
    var formatDate = DateFormat('dd-MM-yyyy');
    await Get.dialog(AlertDialog(
      contentPadding: const EdgeInsets.all(0),
      content: Consumer<ITransactionViewModel>(
        builder: (_, _viewModel, ___) {
          return DataBuilder(
            arguments: DataBuilderArguments(
              dataFetchedSuccessfullyWidget: Container(
                width: MediaQuery.of(Get.context).size.width / 2 - 15,
                decoration: BoxDecoration(
                  color: Color(0xff1abc9c),
                  // borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Text(
                            (date.day == now.day &&
                                    date.month == now.month &&
                                    date.year == now.year)
                                ? 'Today'
                                : formatDate.format(date) ?? '[date-format]',
                            style: TextStyleUtils.bold(35)
                                .copyWith(color: Colors.white),
                          ),
                          Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                _viewModel.transactionByDateForDisplays.length >
                                        0
                                    ? '(${_viewModel.transactionByDateForDisplays?.length ?? 0})'
                                    : '',
                                style: TextStyleUtils.regular(30)
                                    .copyWith(color: Colors.white),
                              ),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 22,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: Colors.white.withOpacity(0.15),
                        ),
                        child: Container(
                          height: 28,
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.arrow_drop_up_rounded,
                                size: 25,
                                color: Colors.green,
                              ),
                              Container(
                                width:
                                    MediaQuery.of(Get.context).size.width / 5,
                                child: MoneyDisplay(
                                  amount: _viewModel.expenseForDate ?? 0,
                                  currencySymbol: locator<GlobalData>()
                                          .currentCurrency
                                          ?.symbol ??
                                      'đ',
                                  color: Colors.white60,
                                ),
                              ),
                              Spacer(),
                              Icon(
                                Icons.arrow_drop_down_rounded,
                                size: 25,
                                color: Colors.red,
                              ),
                              Container(
                                width:
                                    MediaQuery.of(Get.context).size.width / 5,
                                child: MoneyDisplay(
                                  amount: _viewModel.incomeForDate ?? 0,
                                  currencySymbol: locator<GlobalData>()
                                          .currentCurrency
                                          ?.symbol ??
                                      'đ',
                                  color: Colors.white60,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    _viewModel.transactionByDateForDisplays != null &&
                            _viewModel.transactionByDateForDisplays.length > 0
                        ? SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: _viewModel.transactionByDateForDisplays
                                  .map((e) => TransactionCard(transaction: e))
                                  .toList(),
                            ),
                          )
                        : NoDataToDisplay(hideImg: true),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              fetchingDataWidget: TodayActivityWidgetShimmer(),
              noDataToDisplayWidget: Container(
                width: MediaQuery.of(Get.context).size.width / 2 - 15,
                height: 285,
                decoration: BoxDecoration(
                  color: Color(0xffe67e22),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: NoDataToDisplay(hideImg: true),
              ),
              state: _viewModel.getScreenState(),
            ),
          );
        },
      ),
    ));
  }
}
