import 'dart:ui';
import 'package:get/route_manager.dart';
import 'package:get/utils.dart';
import 'package:weather_app/translate/st_en_us.dart';
import 'package:weather_app/translate/st_vi_vn.dart';

class LocalizationService extends Translations {
// locale sẽ được get mỗi khi mới mở app (phụ thuộc vào locale hệ thống hoặc bạn có thể cache lại locale mà người dùng đã setting và set nó ở đây)
  static final locale = _getLocaleFromLanguage('vi');

// fallbackLocale là locale default nếu locale được set không nằm trong những Locale support
  static const fallbackLocale = Locale('vi', 'VN');

// language code của những locale được support
  static final langCodes = [
    'en',
    'vi',
  ];

// các locale được support
  static final locales = [
    const Locale('en', 'US'),
    const Locale('vi', 'VN'),
  ];

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': en,
        'vi_VN': vi,
      };

  static Locale _getLocaleFromLanguage(String? langCode) {
    return langCode == null
        ? Get.locale!
        : locales.firstWhere((locale) => locale.languageCode == langCode);
  }
}
