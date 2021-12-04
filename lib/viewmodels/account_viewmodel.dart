import 'package:flutter/widgets.dart';
import 'package:online_shop_app/models/LoginRequest.dart';
import 'package:online_shop_app/services/account_service.dart';

class AccountViewModel extends ChangeNotifier {
  Future<int> Login(LoginRequest loginRequest) async {
    int statusCode = await AccountService().Login(loginRequest);
    notifyListeners();
    return statusCode;
  }
}
