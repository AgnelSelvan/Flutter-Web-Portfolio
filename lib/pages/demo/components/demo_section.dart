import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/models/project.dart';
import 'package:my_portfolio/provider/theme.dart';
import 'package:my_portfolio/utils/constants.dart';
import 'package:my_portfolio/utils/screen_helper.dart';
import 'package:my_portfolio/utils/utils.dart';

class DemoSection extends StatelessWidget {
  final List<ProjectModel> projects;
  const DemoSection({Key? key, required this.projects}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ScreenHelper(
        desktop: _buildUi(context),
        tablet: _buildUi(context),
        mobile: _buildUi(context),
      ),
    );
  }

  Widget _buildUi(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: Wrap(
        children: projects
            .map((e) => Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 15,
                ),
                child: _buildProject(e)))
            .toList(),
      ),
    );
  }

  Center _buildProject(ProjectModel projectModel) {
    return Center(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SizedBox(
            width: 400,
            child: Consumer(builder: (context, ref, _) {
              return Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: ref.watch(themeProvider).isDarkMode
                        ? const Color.fromARGB(75, 12, 12, 7)
                        : Colors.grey[100],
                    borderRadius: BorderRadius.circular(5)),
                child: Flex(
                  direction: Axis.vertical,
                  children: [
                    Image.asset(
                      projectModel.appPhotos,
                      width: constraints.maxWidth > 720.0 ? null : 350.0,
                      height: 250,
                    ),
                    const SizedBox(
                      width: 20,
                      height: 20,
                    ),
                    SizedBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            projectModel.project,
                            style: GoogleFonts.josefinSans(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.w900,
                              fontSize: 16.0,
                            ),
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          Text(
                            projectModel.title,
                            style: GoogleFonts.josefinSans(
                              fontWeight: FontWeight.w900,
                              height: 1.3,
                              fontSize: 28.0,
                            ),
                          ),
                          const SizedBox(
                            height: 25.0,
                          ),
                          Row(
                            children: [
                              MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: kPrimaryColor,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  height: 48.0,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 28.0,
                                  ),
                                  child: TextButton(
                                    onPressed: () {
                                      Utilty.openUrl(projectModel.projectLink);
                                    },
                                    child: Center(
                                      child: Text(
                                        (projectModel.buttonText ??
                                                "Explore MORE")
                                            .toUpperCase(),
                                        style: const TextStyle(
                                          fontSize: 13.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                    // Expanded(
                    //   flex: constraints.maxWidth > 720.0 ? 1 : 0,
                    //   child: ,
                    // )
                  ],
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
