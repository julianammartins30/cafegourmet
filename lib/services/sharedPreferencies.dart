import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  Future<void> saveTokenUserSharedPreference(String token) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString("tokenUser", token);
  }

  Future<void> saveTokenEstabelecimentoSharedPreference(String token) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString("tokenEstabelecimento", token);
  }

  Future<String> getTokenUser() async {
    var prefs = await SharedPreferences.getInstance();
    var sessionResult = prefs.getString("tokenUser");

    return sessionResult!;
  }

  Future<String> getTokenEstabelecimento() async {
    var prefs = await SharedPreferences.getInstance();
    var sessionResult = prefs.getString("tokenEstabelecimento");

    return sessionResult!;
  }

  Future<void> saveObjectIdUserSharedPreference(String token) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString("objectIdUser", token);
  }

  Future<void> saveObjectIdEstabelecimentoSharedPreference(
      String objectId) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString("objectIdEstabelecimento", objectId);
  }

  Future<String> getObjectIdUser() async {
    var prefs = await SharedPreferences.getInstance();
    var objectIdResult = prefs.getString("objectIdUser");

    return objectIdResult!;
  }

  Future<String> getObjectIdEstabelecimento() async {
    var prefs = await SharedPreferences.getInstance();
    var objectIdResult = prefs.getString("objectIdEstabelecimento");

    return objectIdResult!;
  }

  Future<void> logout() async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.remove("objectIdUser");
    await prefs.remove("objectIdEstabelecimento");
    await prefs.remove("tokenEstabelecimento");
    await prefs.remove("tokenUser");
  }
}
