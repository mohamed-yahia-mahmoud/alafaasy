import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

final Account account = Account._private();

class Account {
  Account._private();

  SharedPreferences _prefs;
  Future<SharedPreferences> prefsFuture;



  String get apiToken => _prefs.getString('apiToken');
  set apiToken(field) => _prefs?.setString('apiToken', field);

  String get account => _prefs.getString('account');
  set account(field) => _prefs.setString('account', field);

  set language(field) => _prefs?.setString("language", field);
  String get language => _prefs?.getString("language") ?? "ar";

  Future<void> getPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }
}
