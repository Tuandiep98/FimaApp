import 'package:fima/core/hive_database/entities/account_entity/account_entity.dart';
import 'package:fima/core/services/interfaces/iaccount_service.dart';
import 'package:fima/core/utils/list_extension.dart';
import 'package:fima/core/view_models/interfaces/isplash_screen_view_model.dart';
import 'package:fima/global/global_data.dart';
import 'package:fima/global/locator.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class SplashScreenViewModel extends ChangeNotifier
    implements ISplashScreenViewModel {
  var accountService = locator<IAccountService>();
  var _globalData = locator<GlobalData>();

  @override
  Future<void> continueAsGuest({bool asBackgroundCheck = false}) async {
    var guest = accountService.getAccounts().firstOrDefault((x) => x.isGuest);
    if (guest == null && !asBackgroundCheck) {
      AccountEntity newGuest = AccountEntity(
        id: Uuid().v4(),
        username: 'guest',
        password: 'guest',
        isGuest: true,
        currencyId: _globalData.currentCurrency?.id,
        currencySymbol: _globalData.currentCurrency?.symbol,
        bio: 'This is my bio.',
      );
      await accountService.insertAll([newGuest]);
      _globalData.currentUser = newGuest;
    } else {
      if (asBackgroundCheck) _globalData.currentUser = guest;
    }
  }
}
