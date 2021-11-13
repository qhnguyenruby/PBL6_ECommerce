import 'package:online_shop_app/local_storage/shared_preferences.dart';

Future<String> getTokenStorage() async {
  LocalStorage accountService = LocalStorage();
  var currentToken = await accountService.getTokenStorage();
  return currentToken;
}

// bool checkExpiredToken(String token){
//   Map<String, dynamic> payload = Jwt.parseJwt(token);
//   if (DateTime.now() >= payload['exp'] * 1000){

//   }
// }
