import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'tr_TR': {
          'loading': 'Yükleniyor...',
          'sign_in': 'Giriş',
          'login': 'GİRİŞ',
          'username': 'Kullanıcı Adı',
          'password': 'Parola',
          'enter_password': 'Parolanız',
          'enter_username': 'Kullanıcı adınız',
          'error': 'Hata',
          'warning': 'Uyarı',
          'info': 'Bilgi',
          'ok': 'Tamam',
          'yes': 'Evet',
          'no': 'Hayır',
          'cancel': 'Vazgeç',
          'generic_error':
              'Bir şeyler ters gitti. Lütfen daha sonra tekrar deneyiniz.',
          'posts': 'Yazılar',
          'post_detail': 'Yazı Detayı'
        },
        'en_US': {
          'loading': 'Loading...',
          'sign_in': "Sign In",
          'login': 'LOGIN',
          'username': 'Username',
          'password': 'Password',
          'enter_password': 'Enter your password',
          'enter_username': 'Enter your username',
          'error': 'Error',
          'warning': 'Warning',
          'info': 'Information',
          'ok': 'Ok',
          'yes': 'Yes',
          'no': 'No',
          'cancel': 'Cancel',
          'generic_error': 'Something went wrong. Please try again later.',
          'posts': 'Posts',
          'post_detail': 'Post Detail'
        },
      };
}
