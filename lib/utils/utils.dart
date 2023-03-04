import 'package:url_launcher/url_launcher.dart';

class Utilty {
  static Future<void> openUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  static Future<void> openMail() => openUrl("mailto:ibrahim.moe121@gmail.com");

  static Future<void> openMyLocation() =>
      openUrl("https://goo.gl/maps/FigfwCv6pFGBXBGm9");
  static Future<void> openMyPhoneNo() => openUrl("tel:+20-1022614423");
  static Future<void> openWhatsapp() => openUrl("https://wa.link/xy45pn");
}
