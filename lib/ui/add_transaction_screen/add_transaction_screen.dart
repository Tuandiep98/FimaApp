import 'dart:io';

import 'package:emoji_picker_2/emoji_picker_2.dart';
import 'package:fima/core/utils/dialog_utils.dart';
import 'package:fima/core/utils/enum.dart';
import 'package:fima/core/utils/string_extension.dart';
import 'package:fima/core/utils/text_style_utils.dart';
import 'package:fima/core/view_models/interfaces/ihome_screen_viewmodel.dart';
import 'package:fima/core/view_models/interfaces/itransaction_viewmodel.dart';
import 'package:fima/global/global_data.dart';
import 'package:fima/global/locator.dart';
import 'package:fima/global/router.dart';
import 'package:fima/ui/common_widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:r_dotted_line_border/r_dotted_line_border.dart';
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
  TextEditingController newPaymentMethodController;

  bool isShowNote = false;
  FocusNode noteFocus;

  ITransactionViewModel _viewModel;
  IHomeScreenViewModel _homeViewModel;

  String selectedValue;

  var slider;
  double initValueOfSlider = 0;

  @override
  void initState() {
    _viewModel = context.read<ITransactionViewModel>();
    _homeViewModel = context.read<IHomeScreenViewModel>();

    newCategoryController = TextEditingController();
    newPaymentMethodController = TextEditingController();

    amountController = MoneyMaskedTextController(
        decimalSeparator: ',',
        thousandSeparator: ',',
        initialValue: 0,
        precision: 3,
        rightSymbol: 'đ');
    noteController = TextEditingController(text: '');
    noteFocus = FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _homeViewModel.initPaymentMethods();
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
    newPaymentMethodController.dispose();
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
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          await _showSelectMethodDialog();
                        },
                        child: Row(
                          children: [
                            locator<GlobalData>()
                                    .paymentMethodSelected
                                    .emoji
                                    .isNullOrEmpty()
                                ? Image.asset(
                                    'assets/images/currency_img.PNG',
                                    width: 40,
                                    height: 40,
                                  )
                                : Text(
                                    locator<GlobalData>()
                                        .paymentMethodSelected
                                        ?.emoji,
                                    style: TextStyleUtils.regular(40),
                                  ),
                            const SizedBox(width: 5),
                            Container(
                              // width: 60,
                              child: Text(
                                locator<GlobalData>()
                                        .paymentMethodSelected
                                        ?.name ??
                                    '[payment]',
                                style: TextStyleUtils.light(30)
                                    .copyWith(color: Colors.grey[500]),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
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
                            locator<GlobalData>()
                                    .categorySelected
                                    .emoji
                                    .isNullOrEmpty()
                                ? Image.asset(
                                    'assets/images/edit_icon.png',
                                    width: 40,
                                    height: 40,
                                  )
                                : Text(
                                    locator<GlobalData>()
                                        .categorySelected
                                        ?.emoji,
                                    style: TextStyleUtils.regular(40),
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
                        minWidth: 40,
                        onPressed: () async {
                          if (amountController.numberValue > 0 &&
                              locator<GlobalData>().categorySelected != null &&
                              locator<GlobalData>().paymentMethodSelected !=
                                  null) {
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
                        child: Icon(
                          Icons.done_rounded,
                          size: 40,
                          color: Colors.white,
                        ),
                        // Text(
                        //   'Save',
                        //   style: TextStyleUtils.light(30)
                        //       .copyWith(color: Colors.white),
                        // ),
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
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Consumer<IHomeScreenViewModel>(
          builder: (_, _viewModel, ___) {
            return Wrap(
              alignment: WrapAlignment.center,
              children: _viewModel.paymentMethodsForDisplay
                  .map(
                    (e) => GestureDetector(
                      onLongPress: () async {
                        await DialogUtils.showOkCancelDialog(
                            title: 'Confirm',
                            body: 'Are you sure to delete ' + e.name + ' !',
                            onOK: () async {
                              Get.back();
                              await _viewModel.deletePaymentMethods([e.id]);
                              setState(() {});
                            });
                      },
                      onTap: () {
                        locator<GlobalData>().paymentMethodSelected = e;
                        Get.back();
                        setState(() {});
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(3),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          height: 40,
                          decoration: BoxDecoration(
                            color: e.name ==
                                    locator<GlobalData>()
                                        .paymentMethodSelected
                                        ?.name
                                ? Colors.black
                                : Colors.grey[100],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              e.emoji.isNullOrEmpty()
                                  ? Image.asset(
                                      'assets/images/currency_img.PNG',
                                      width: 40,
                                      height: 40,
                                    )
                                  : Text(
                                      e.emoji,
                                      style: TextStyleUtils.regular(40),
                                    ),
                              const SizedBox(width: 10),
                              Text(
                                e.name ?? '[payment-method]',
                                style: TextStyleUtils.light(32).copyWith(
                                    color: e.name ==
                                            locator<GlobalData>()
                                                .paymentMethodSelected
                                                ?.name
                                        ? Colors.white
                                        : Colors.grey[500]),
                              ),
                              const SizedBox(width: 10),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList()
                    ..add(
                      GestureDetector(
                        onTap: () async {
                          Get.back();
                          setState(() {});
                          await _showAddPaymentMethodDialog();
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
          },
        ),
      ),
    );
  }

  Future<void> _showSelectCategoryDialog() async {
    await DialogUtils.showYesNoBottomDialog(
      context,
      body: StatefulBuilder(builder: (context, setState) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Consumer<IHomeScreenViewModel>(builder: (_, _viewModel, __) {
            return Wrap(
              alignment: WrapAlignment.center,
              children: _viewModel.categoriesForDisplay
                  .map((e) => InkWell(
                        onLongPress: () async {
                          await DialogUtils.showOkCancelDialog(
                              title: 'Confirm',
                              body: 'Are you sure to delete ' + e.name + ' !',
                              onOK: () async {
                                Get.back();
                                await _viewModel.deleteCategories([e.id]);
                                setState(() {});
                              });
                        },
                        onTap: () {
                          locator<GlobalData>().categorySelected = e;
                          _viewModel
                              .changeState(DataState.DataFetchedSuccessfully);
                          Get.back();
                          setState(() {});
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(3),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            height: 40,
                            decoration: BoxDecoration(
                              color: e.name ==
                                      locator<GlobalData>()
                                          .categorySelected
                                          ?.name
                                  ? Colors.black
                                  : Colors.grey[100],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                e.emoji.isNullOrEmpty()
                                    ? Image.asset(
                                        'assets/images/edit_icon.png',
                                        width: 40,
                                        height: 40,
                                      )
                                    : Text(
                                        e.emoji,
                                        style: TextStyleUtils.regular(40),
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
        );
      }),
    );
  }

  Future<void> _showAddCategoryDialog() async {
    Icon _icon = Icon(
      Icons.category_rounded,
      size: 60,
      color: Colors.grey[200],
    );

    bool isEmoji = false;
    Emoji emojiSelected;

    await DialogUtils.showYesNoBottomDialog(
      context,
      body: StatefulBuilder(
        builder: (context, setState) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Container(
                      width: 90,
                      height: 90,
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        border: RDottedLineBorder.all(
                          width: 1,
                          color: Colors.grey[300],
                        ),
                      ),
                      child: Center(
                        child: !isEmoji
                            ? _icon
                            : Text(
                                emojiSelected.emoji,
                                style: TextStyleUtils.regular(70),
                              ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(width: 1),
                        Spacer(),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.5,
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
                        InkWell(
                          onTap: () async {
                            var categoryName = newCategoryController.text;
                            if (!categoryName.isNullOrEmpty()) {
                              await context
                                  .read<IHomeScreenViewModel>()
                                  .createCategory(categoryName, emojiSelected);
                              newCategoryController.clear();
                              Get.back();
                              context
                                  .read<IHomeScreenViewModel>()
                                  .getCategories();
                            }
                          },
                          child: Container(
                            width: 68,
                            height: 68,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
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
                  ],
                ),
              ),
              const SizedBox(height: 10),
              EmojiPicker2(
                rows: 4,
                columns: 5,
                recommendKeywords: ["fruit", "smile"],
                numRecommended: 10,
                bgColor: Colors.white,
                buttonMode:
                    Platform.isIOS ? ButtonMode.CUPERTINO : ButtonMode.MATERIAL,
                indicatorColor: Colors.grey[500],
                onEmojiSelected: (emoji, category) {
                  setState(() {
                    emojiSelected = emoji;
                    isEmoji = true;
                  });
                },
              ),
            ],
          );
        },
      ),
    );
  }

  Future<void> _showAddPaymentMethodDialog() async {
    Icon _icon = Icon(
      Icons.category_rounded,
      size: 60,
      color: Colors.grey[200],
    );

    bool isEmoji = false;
    Emoji emojiSelected;

    await DialogUtils.showYesNoBottomDialog(
      context,
      body: StatefulBuilder(
        builder: (context, setState) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Container(
                      width: 90,
                      height: 90,
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        border: RDottedLineBorder.all(
                          width: 1,
                          color: Colors.grey[300],
                        ),
                      ),
                      child: Center(
                        child: !isEmoji
                            ? _icon
                            : Text(
                                emojiSelected.emoji,
                                style: TextStyleUtils.regular(70),
                              ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(width: 1),
                        Spacer(),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.5,
                          child: TextFormField(
                            controller: newPaymentMethodController,
                            keyboardType: TextInputType.text,
                            style: TextStyleUtils.bold(60)
                                .copyWith(color: Colors.grey),
                            textAlign: TextAlign.start,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Account name',
                              hintStyle:
                                  TextStyle(fontSize: 30, color: Colors.grey),
                            ),
                            onChanged: (value) {},
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            var paymentMethodName =
                                newPaymentMethodController.text;
                            if (!paymentMethodName.isNullOrEmpty()) {
                              await context
                                  .read<IHomeScreenViewModel>()
                                  .createPaymentMethod(
                                      paymentMethodName, emojiSelected);
                              newPaymentMethodController.clear();
                              Get.back();
                              context
                                  .read<IHomeScreenViewModel>()
                                  .initPaymentMethods();
                            }
                          },
                          child: Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
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
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              EmojiPicker2(
                rows: 4,
                columns: 5,
                recommendKeywords: ["fruit", "smile"],
                numRecommended: 10,
                bgColor: Colors.white,
                buttonMode:
                    Platform.isIOS ? ButtonMode.CUPERTINO : ButtonMode.MATERIAL,
                indicatorColor: Colors.grey[500],
                onEmojiSelected: (emoji, category) {
                  setState(() {
                    emojiSelected = emoji;
                    isEmoji = true;
                  });
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
