import 'dart:convert';

class Utils {
  String getBasicAuth(String login, String password) {
    return 'Basic ' + base64Encode(utf8.encode('$login:$password'));
  }
}