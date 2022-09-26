import 'package:fima/global/app_text.dart';
import 'package:fima/ui/common_widgets/custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
}
