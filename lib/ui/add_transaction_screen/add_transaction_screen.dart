import 'dart:io';

import 'package:fima/core/ui_model/category_ui_model.dart';
import 'package:fima/core/ui_model/payment_method_ui_model.dart';
import 'package:fima/core/utils/dialog_utils.dart';
import 'package:fima/core/utils/text_style_utils.dart';
import 'package:fima/core/view_models/interfaces/ihome_screen_viewmodel.dart';
import 'package:fima/core/view_models/interfaces/itransaction_viewmodel.dart';
import 'package:fima/global/global_data.dart';
import 'package:fima/global/locator.dart';
import 'package:fima/global/router.dart';
import 'package:fima/ui/common_widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class AddTransactionScreen extends StatefulWidget {
  const AddTransactionScreen({Key key}) : super(key: key);

  @override
  State<AddTransactionScreen> createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {
  MoneyMaskedTextController amountController;
  TextEditingController noteController;
  TextEditingController newCategoryController;
  bool isShowNote = false;
  FocusNode noteFocus;
  ITransactionViewModel _viewModel;

  List<PaymentMethodUIModel> paymentMethods = [];
  String selectedValue;

  var slider;
  double initValueOfSlider = 0;

  @override
  void initState() {
    _viewModel = context.read<ITransactionViewModel>();

    newCategoryController = TextEditingController();
    amountController = MoneyMaskedTextController(
        decimalSeparator: ',',
        thousandSeparator: ',',
        initialValue: 0,
        precision: 3,
        rightSymbol: 'đ');
    noteController = TextEditingController(text: '');
    noteFocus = FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      paymentMethods = _viewModel.getPaymentMethods();
    });

    slider = SleekCircularSlider(
      min: 0,
      max: 1000,
      initialValue: initValueOfSlider,
      appearance: CircularSliderAppearance(
        counterClockwise: true,
        size: 280,
        customColors: CustomSliderColors(
          trackColor: Colors.grey[300],
          progressBarColors: [
            Colors.black,
            Colors.grey,
          ],
          shadowColor: Colors.grey[200],
        ),
      ),
      onChange: (double value) {
        // callback providing a value while its being changed (with a pan gesture)
      },
      onChangeStart: (double startValue) {
        // callback providing a starting value (when a pan gesture starts)
      },
      onChangeEnd: (double endValue) {
        // ucallback providing an ending value (when a pan gesture ends)
      },
      innerWidget: (double value) {
        // use your custom widget inside the slider (gets a slider value from the callback)
        // return Center(child: Text(value.toStringAsFixed(2)));
        value = value.roundToDouble();
        amountController.updateValue(value.toInt().toDouble());
        return Center(
          // width: MediaQuery.of(context).size.width - 100,
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
            onChanged: (value) {
              setState(() {
                initValueOfSlider = amountController.numberValue;
              });
            },
          ),
        );
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    amountController.dispose();
    noteController.dispose();
    newCategoryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
      child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height - 100,
          child: Column(
            children: [
              const SizedBox(height: 40),
              Container(
                height: 60,
                child: Row(
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
                    Consumer<ITransactionViewModel>(builder: (_, __, ___) {
                      return Text(
                        _viewModel.transactionModeLabel ?? 'Expense',
                        style: TextStyleUtils.bold(30),
                      );
                    }),
                    const SizedBox(width: 50),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  slider,
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
              Consumer<IHomeScreenViewModel>(builder: (_, __, ___) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          await _showSelectMethodDialog();
                        },
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/currency_img.PNG',
                              width: 40,
                              height: 40,
                            ),
                            const SizedBox(width: 5),
                            Container(
                              child: Text(
                                locator<GlobalData>()
                                        .paymentMethodSelected
                                        ?.name ??
                                    '[payment]',
                                style: TextStyleUtils.light(30)
                                    .copyWith(color: Colors.grey[500]),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 5),
                      Icon(
                        Icons.arrow_forward_rounded,
                        size: 25,
                        color: Colors.grey[400],
                      ),
                      const SizedBox(width: 5),
                      GestureDetector(
                        onTap: () async {
                          await _showSelectCategoryDialog();
                        },
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/edit_icon.png',
                              width: 40,
                              height: 40,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              locator<GlobalData>().categorySelected?.name ??
                                  '[category]',
                              style: TextStyleUtils.light(30)
                                  .copyWith(color: Colors.grey[500]),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      CustomButton(
                        minWidth: 80,
                        onPressed: () async {
                          if (amountController.numberValue > 0) {
                            await _viewModel.createTransaction(
                                amountController.numberValue,
                                noteController.text);

                            context
                                .read<ITransactionViewModel>()
                                .initTransactions();
                            context
                                .read<IHomeScreenViewModel>()
                                .getCategories();
                            Get.offAllNamed(MyRouter.base);
                          }
                        },
                        btnColor: Colors.black,
                        btnRadius: 30,
                        child: Text(
                          'Save',
                          style: TextStyleUtils.light(30)
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showSelectMethodDialog() async {
    await DialogUtils.showYesNoBottomDialog(
      context,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: paymentMethods
              .map(
                (e) => GestureDetector(
                  onTap: () {
                    locator<GlobalData>().paymentMethodSelected = e;
                    Get.back();
                    setState(() {});
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/currency_img.PNG',
                        width: 40,
                        height: 40,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        e.name ?? '[payment-method]',
                        style: TextStyleUtils.light(32)
                            .copyWith(color: Colors.grey[500]),
                      ),
                      Spacer(),
                      e.name ==
                              locator<GlobalData>().paymentMethodSelected?.name
                          ? Icon(
                              Icons.done_rounded,
                              size: 30,
                              color: Colors.green,
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  Future<void> _showSelectCategoryDialog() async {
    await DialogUtils.showYesNoBottomDialog(
      context,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Consumer<IHomeScreenViewModel>(builder: (_, _viewModel, __) {
          return Wrap(
            alignment: WrapAlignment.center,
            children: _viewModel.categoriesForDisplay
                .map((e) => InkWell(
                      onTap: () {
                        locator<GlobalData>().categorySelected = e;
                        Get.back();
                        setState(() {});
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(3),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            color: e.name ==
                                    locator<GlobalData>().categorySelected?.name
                                ? Colors.blue[100]
                                : Colors.grey[100],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                'assets/images/edit_icon.png',
                                width: 40,
                                height: 40,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                e.name ?? '[category]',
                                style: TextStyleUtils.light(32).copyWith(
                                    color: e.name ==
                                            locator<GlobalData>()
                                                .categorySelected
                                                ?.name
                                        ? Colors.white
                                        : Colors.grey[500]),
                              ),
                              const SizedBox(width: 8),
                            ],
                          ),
                        ),
                      ),
                    ))
                .toList()
                  ..add(
                    InkWell(
                      onTap: () async {
                        Get.back();
                        setState(() {});
                        await _showAddCategoryDialog();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(3),
                        child: Container(
                          width: 60,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Icon(
                            Icons.add,
                            size: 30,
                            color: Colors.grey[500],
                          ),
                        ),
                      ),
                    ),
                  ),
          );
        }),
      ),
    );
  }

  Future<void> _showAddCategoryDialog() async {
    Icon _icon = Icon(
      Icons.category_rounded,
      size: 30,
      color: Colors.grey[200],
    );

    await DialogUtils.showYesNoBottomDialog(
      context,
      body: StatefulBuilder(
        builder: (context, setState) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              height: 400,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.grey[100],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            IconData icon =
                                await FlutterIconPicker.showIconPicker(
                              context,
                              iconPackMode: Platform.isIOS
                                  ? IconPack.cupertino
                                  : IconPack.material,
                              title: const SizedBox.shrink(),
                              closeChild: Text(
                                'close',
                                style: TextStyleUtils.light(40).copyWith(
                                  color: Colors.grey[300],
                                ),
                              ),
                            );

                            if (icon != null) {
                              setState(() {
                                _icon = Icon(
                                  icon,
                                  size: 30,
                                  color: Colors.black,
                                );
                              });
                            }
                          },
                          child: Container(
                            width: 45,
                            height: 45,
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: _icon,
                          ),
                        ),
                        const SizedBox(width: 15),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.9,
                          child: TextFormField(
                            controller: newCategoryController,
                            keyboardType: TextInputType.text,
                            style: TextStyleUtils.bold(60)
                                .copyWith(color: Colors.grey),
                            textAlign: TextAlign.start,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Category name',
                              hintStyle:
                                  TextStyle(fontSize: 30, color: Colors.grey),
                            ),
                            onChanged: (value) {},
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  InkWell(
                    onTap: () async {
                      var categoryName = newCategoryController.text;
                      await context.read<IHomeScreenViewModel>().createCategory(
                          categoryName,
                          _icon.icon.codePoint,
                          _icon.icon.fontFamily);
                      newCategoryController.clear();
                      Get.back();
                      context.read<IHomeScreenViewModel>().getCategories();
                    },
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey[100],
                      ),
                      child: Icon(
                        Icons.done_rounded,
                        size: 30,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
