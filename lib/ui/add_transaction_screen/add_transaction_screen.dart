import 'package:fima/core/utils/text_style_utils.dart';
import 'package:fima/global/global_data.dart';
import 'package:fima/global/locator.dart';
import 'package:fima/global/router.dart';
import 'package:fima/ui/common_widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:get/get.dart';

class AddTransactionScreen extends StatefulWidget {
  const AddTransactionScreen({Key key}) : super(key: key);

  @override
  State<AddTransactionScreen> createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {
  MoneyMaskedTextController amountController;
  TextEditingController noteController;
  bool isShowNote = false;
  FocusNode noteFocus;

  @override
  void initState() {
    amountController = MoneyMaskedTextController(
        decimalSeparator: ',',
        thousandSeparator: ',',
        initialValue: 0,
        precision: 3,
        rightSymbol: 'đ');
    noteController = TextEditingController(text: '');
    noteFocus = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    amountController.dispose();
    noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 60, 0, 5),
      child: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.offAllNamed(MyRouter.base);
                  },
                  child: Text(
                    'Cancel',
                    style: TextStyleUtils.bold(30)
                        .copyWith(color: Colors.grey[400].withOpacity(0.7)),
                  ),
                ),
                Text(
                  locator<GlobalData>().transactionModeLabel ?? 'Expense',
                  style: TextStyleUtils.bold(30),
                ),
                const SizedBox(width: 50),
              ],
            ),
            const SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width - 20,
                  child: TextFormField(
                    controller: amountController,
                    // inputFormatters: [
                    //   CurrencyInputFormatter(),
                    // ],
                    keyboardType: TextInputType.number,
                    style: TextStyleUtils.bold(75).copyWith(color: Colors.grey),
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: '0,000',
                      hintStyle: TextStyle(fontSize: 50, color: Colors.grey),
                    ),
                  ),
                ),
              ],
            ),
            isShowNote
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width - 20,
                        child: TextFormField(
                          controller: noteController,
                          focusNode: noteFocus,
                          // inputFormatters: [
                          //   CurrencyInputFormatter(),
                          // ],
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyleUtils.bold(55)
                              .copyWith(color: Colors.grey),
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Add note',
                            hintStyle:
                                TextStyle(fontSize: 30, color: Colors.grey),
                          ),
                        ),
                      ),
                    ],
                  )
                : const SizedBox.shrink(),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Today at ' +
                        '${DateTime.now().hour}' +
                        ':' +
                        '${DateTime.now().minute}',
                    style: TextStyleUtils.light(30)
                        .copyWith(color: Colors.grey[400]),
                  ),
                  const SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isShowNote = !isShowNote;
                        if (isShowNote) {
                          noteFocus.requestFocus();
                        }
                      });
                    },
                    child: Text(
                      'Add note',
                      style: TextStyleUtils.light(30)
                          .copyWith(color: Colors.grey[400]),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/currency_img.PNG',
                    width: 40,
                    height: 40,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Cash',
                    style: TextStyleUtils.light(30)
                        .copyWith(color: Colors.grey[500]),
                  ),
                  const SizedBox(width: 10),
                  Icon(
                    Icons.arrow_forward_rounded,
                    size: 25,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(width: 10),
                  Image.asset(
                    'assets/images/shopping_icon.png',
                    width: 40,
                    height: 40,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Shopping',
                    style: TextStyleUtils.light(30)
                        .copyWith(color: Colors.grey[500]),
                  ),
                  Spacer(),
                  CustomButton(
                    minWidth: 80,
                    onPressed: () {
                      Get.offAllNamed(MyRouter.base);
                    },
                    btnColor: Colors.black,
                    btnRadius: 30,
                    child: Text('Save',
                        style: TextStyleUtils.light(30)
                            .copyWith(color: Colors.white)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
