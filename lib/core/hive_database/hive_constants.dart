import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'entities/account_entity/account_entity.dart';
import 'entities/category_entity/category_entity.dart';
import 'entities/currency_entity/currency_entity.dart';
import 'entities/payment_method_entity/payment_method_entity.dart';
import 'entities/transaction_entity/transaction_entity.dart';

class HiveBoxName {
  static const String transactions = 'transactions'; // 1
  static const String currencies = 'currencies'; // 2
  static const String categories = 'categories'; // 3
  static const String paymentMethods = 'paymentMethods'; // 4
  static const String accounts = 'accounts'; // 5
}

class HiveTypes {
  static const transactions = 1;
  static const currencies = 2;
  static const categories = 3;
  static const paymentMethods = 4;
  static const accounts = 5;
}

class HiveBoxMap {
  static Map<Type, MyHive> hiveBoxMap = {
    TransactionEntity: MyHive<TransactionEntity>(
      boxName: HiveBoxName.transactions,
      registerAdapterFunction: () {
        Hive.registerAdapter(TransactionEntityAdapter());
      },
    ),
    CurrencyEntity: MyHive<CurrencyEntity>(
      boxName: HiveBoxName.currencies,
      registerAdapterFunction: () {
        Hive.registerAdapter(CurrencyEntityAdapter());
      },
    ),
    CategoryEntity: MyHive<CategoryEntity>(
      boxName: HiveBoxName.categories,
      registerAdapterFunction: () {
        Hive.registerAdapter(CategoryEntityAdapter());
      },
    ),
    PaymentMethodEntity: MyHive<PaymentMethodEntity>(
      boxName: HiveBoxName.paymentMethods,
      registerAdapterFunction: () {
        Hive.registerAdapter(PaymentMethodEntityAdapter());
      },
    ),
    Account2Entity: MyHive<Account2Entity>(
      boxName: HiveBoxName.accounts,
      registerAdapterFunction: () {
        Hive.registerAdapter(Account2EntityAdapter());
      },
    ),
  };
}

class MyHive<EntityT> {
  String boxName;
  Future<void> Function() openBoxFunction;
  void Function() registerAdapterFunction;

  MyHive({@required this.boxName, @required this.registerAdapterFunction}) {
    this.openBoxFunction = () async {
      await Hive.openBox<EntityT>(boxName);
    };
  }
}
