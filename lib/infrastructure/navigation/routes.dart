// ignore_for_file: constant_identifier_names

class Routes {
  static Future<String> get initialRoute async {
    return WELCOME;
  }

  static const HOME = '/home';
  static const WELCOME = '/welcome';
  static const LOGIN = '/login';
}
