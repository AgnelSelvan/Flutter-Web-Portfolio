import 'package:my_portfolio/models/link.dart';
import 'package:my_portfolio/models/technology.dart';
import 'package:my_portfolio/utils/constants.dart';

class ProjectModel {
  final String project;
  final String title;
  final String description;
  final String appPhotos;
  final String projectLink;
  final List<TechnologyModel> techUsed;
  List<LinkModel>? links = [];
  final String? buttonText;

  ProjectModel({
    required this.project,
    required this.title,
    required this.description,
    required this.appPhotos,
    required this.projectLink,
    required this.techUsed,
    this.buttonText,
    this.links,
  });

  static List<ProjectModel> projects = [
    ProjectModel(
      project: "Flutter App",
      title: "Smart Store App",
      description:
          "The Idea came during the pandemics to solve the issue of social distancing in supermarkets.",
      appPhotos: AppConstants.smartStoreImage,
      projectLink: "https://github.com/AgnelSelvan/Smart-Store-Mobile-App",
      techUsed: [
        TechnologyConstants.flutter,
        TechnologyConstants.firebase,
        TechnologyConstants.flask,
        TechnologyConstants.python,
        TechnologyConstants.razorPay
      ],
      buttonText: "Github Link",
    ),
    ProjectModel(
      project: "Swift App",
      title: "Cross The Road Game",
      description: "Cross the Road game developed using Swift and SceneKit",
      appPhotos: AppConstants.crossTheRoadImage,
      projectLink: "https://github.com/AgnelSelvan/Cross-the-road",
      techUsed: [
        TechnologyConstants.swift,
        TechnologyConstants.sceneKit,
      ],
      buttonText: "Github Link",
    ),
    ProjectModel(
      project: "Flutter App",
      title: "News Up App",
      description:
          "This application is used basically for viewing different news. Launched the app in Amazon AppStore",
      appPhotos: AppConstants.newsUpImage,
      projectLink: "https://www.amazon.com/gp/product/B08669JDX7",
      techUsed: [
        TechnologyConstants.flutter,
      ],
    ),
    ProjectModel(
      project: "Flutter App",
      title: "Music Lab",
      description:
          "A Simple Music Player App. Launched the app in Amazon AppStore",
      appPhotos: AppConstants.musicLabImage,
      projectLink: "https://www.amazon.com/gp/product/B08WL2XFGW",
      techUsed: [
        TechnologyConstants.flutter,
      ],
    ),
    ProjectModel(
      project: "PHP Website",
      title: "Computer Store",
      description:
          "This is a complete online e-commerce website of selling computer and seperate admin panel is built for handling the order request and only payement is added.",
      appPhotos: AppConstants.computerStoreImage,
      projectLink: "https://github.com/AgnelSelvan/computer-store.git",
      techUsed: [
        TechnologyConstants.php,
        TechnologyConstants.razorPay,
      ],
    ),
    ProjectModel(
      project: "Python",
      title: "Personal Face and Emotion Recognition",
      description:
          "The model will recognize each face and identify their name based on the trained model. CNN is used for training the dataset.",
      appPhotos: AppConstants.personalFaceImage,
      projectLink: "https://github.com/AgnelSelvan/Emotion-Recognition.git",
      techUsed: [
        TechnologyConstants.python,
      ],
    ),
  ];

  static List<ProjectModel> demos = [
    ProjectModel(
      project: "Flutter App",
      title: "Flutter Web Portfolio",
      description: "",
      appPhotos: AppConstants.portfolioGif,
      projectLink: "https://github.com/AgnelSelvan/Flutter-Web-Portfolio",
      techUsed: [],
      buttonText: "Github Link",
    ),
  ];
}
