import 'package:fima/core/hive_database/entities/currency_entity/currency_entity.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'entities/transaction_entity/transaction_entity.dart';

class HiveBoxName {
  static const String transactions = 'transactions'; // 1
  static const String currencies = 'currencies'; // 2
}

class HiveTypes {
  static const transactions = 1;
  static const currencies = 2;
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
