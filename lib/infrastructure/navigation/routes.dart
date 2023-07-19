// ignore_for_file: constant_identifier_names

class Routes {
  static Future<String> get initialRoute async {
    return WELCOME;
  }

  static const CALENDER = '/calender';
  static const DASHBOARD = '/dashboard';
  static const FORM_KAMAR = '/form-kamar';
  static const FORM_PEMASUKAN = '/form-pemasukan';
  static const FORM_PENGELUARAN = '/form-pengeluaran';
  static const HOME = '/home';
  static const LIST_PEMASUKAN = '/list-pemasukan';
  static const LIST_PENGELUARAN = '/list-pengeluaran';
  static const LIST_PENGHUNI = '/list-penghuni';
  static const LOGIN = '/login';
  static const PENGHUNI = '/penghuni';
  static const PROFIL = '/profil';
  static const PROFILE_UPDATE = '/profile-update';
  static const TENTANG_APP = '/tentang-app';
  static const VERIFIKASI = '/verifikasi';
  static const WELCOME = '/welcome';
  static const PEMBERITAHUAN = '/pemberitahuan';
}
