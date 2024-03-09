import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/core/utils/utils.dart';
import 'package:my_portfolio/models/header_item.dart';

const Color kPrimaryColor = Color(0xFFFFD800);
const Color kBackgroundColor = Color.fromRGBO(7, 17, 26, 1);
const Color kDangerColor = Color.fromARGB(255, 243, 22, 22);
const Color kCaptionColor = Color.fromRGBO(166, 177, 187, 1);

// Lets replace all static sizes
const double kDesktopMaxWidth = 1000.0;
const double kTabletMaxWidth = 760.0;
double getMobileMaxWidth(BuildContext context) =>
    MediaQuery.of(context).size.width * .8;

class AppConstants {
  static const linkedInUrl =
      "https://www.linkedin.com/in/agnel-selvan-328421192/";
  static const instagramUrl = "https://www.instagram.com/_agnel.selvan_/";
  static const githubUrl = "https://github.com/AgnelSelvan";
  static const mediumUrl = "https://medium.com/@agnelselvan";

  static const _assets = "assets/";
  static const _outputs = "outputs/";

  static const _svg = _assets + "svg/";
  static const guySvg = _svg + "guy.svg";
  static const personSvg = _svg + "person.svg";

  static const _images = _assets + "images/";

//   static const _socialImages = _images + "social/";
  // static const emailImage = _socialImages + "email.png";
  // static const linkedInImage = _socialImages + "linkedin-logo.png";
  // static const instaImage = _socialImages + "instagram.png";
  // static const githubImage = _socialImages + "github.png";
  // static const mediumImage = _socialImages + "medium.png";

  static const _techImages = _images + "technology/";
  static const flutterImage = _techImages + "flutter.png";
  static const pythonImage = _techImages + "python.png";
  static const phpImage = _techImages + "php.png";
  static const flaskImage = _techImages + "flask.png";
  static const firebaseImage = _techImages + "firebase.png";
  static const razorPayImage = _techImages + "razorpay.png";
  static const cPlusImage = _techImages + "c++.png";
  static const swiftImage = _techImages + "swift.png";
  static const sceneKitImage = _techImages + "scenekit.jpeg";
  static const javascriptImage = _techImages + "javascript.png";

  static const _projectsImages = _images + "projects/";
  static const smartStoreImage = _projectsImages + "1.jpeg";
  static const crossTheRoadImage = _projectsImages + "2.jpeg";
  static const newsUpImage = _projectsImages + "3.jpeg";
  static const musicLabImage = _projectsImages + "4.jpeg";
  static const personalFaceImage = _projectsImages + "5.jpeg";
  static const computerStoreImage = _projectsImages + "6.jpeg";
  static const jsonToDartImage = _projectsImages + "7.png";
  static const simulationImage = _projectsImages + "8.png";

  static const _gifs = _outputs + "gif/";
  static const portfolioGif = _gifs + "mobile.gif";

  static List<NameOnTap> socialLoginDatas = [
    NameOnTap(
        title: "Email",
        iconData: Icons.mail_outline_rounded,
        onTap: () {
          Utilty.openMail();
        }),
    NameOnTap(
        title: "LinkedIN",
        iconData: FontAwesomeIcons.linkedinIn,
        onTap: () {
          Utilty.openUrl(linkedInUrl);
        }),
    NameOnTap(
        title: "Instagram",
        iconData: FontAwesomeIcons.instagram,
        onTap: () {
          Utilty.openUrl(instagramUrl);
        }),
    NameOnTap(
        title: "Github",
        iconData: FontAwesomeIcons.github,
        onTap: () {
          Utilty.openUrl(githubUrl);
        }),
    NameOnTap(
        title: "Medium",
        iconData: FontAwesomeIcons.medium,
        onTap: () {
          Utilty.openUrl(mediumUrl);
        }),
  ];
}
