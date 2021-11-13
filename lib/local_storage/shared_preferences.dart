import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  Future<bool> saveToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
    return prefs.commit();
  }

  // Future<String?> getTokenStorage() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? token = prefs.getString("token");
  //   return token;
  // }

  Future<String> getTokenStorage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");

    return (token != null) ? token.toString() : "";
  }

  void removeToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
  }
}
