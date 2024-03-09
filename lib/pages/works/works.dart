import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/models/project.dart';
import 'package:my_portfolio/pages/home/components/footer.dart';
import 'package:my_portfolio/pages/works/components/work_section.dart';
import 'package:my_portfolio/core/utils/screen_helper.dart';
import 'package:my_portfolio/widgets/header.dart';

class MyWorksScreen extends ConsumerStatefulWidget {
  const MyWorksScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<MyWorksScreen> createState() => _DemoScreenState();
}

class _DemoScreenState extends ConsumerState<MyWorksScreen> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  Widget _buildPage() {
    return Stack(
      children: [
        ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: ScreenHelper.isDesktop(context) ? 30 : 20,
                ),
                Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 80,
                    ),
                    Text(
                      "My Works",
                      style: GoogleFonts.josefinSans(
                        fontWeight: FontWeight.w900,
                        fontSize: 36,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Here are My Works",
                      style: GoogleFonts.josefinSans(
                        color: Colors.grey[400],
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    )
                  ],
                )),
                WorkSection(
                  projects: ProjectModel.projects,
                ),
                const Footer()
              ],
            ),
          ),
        ),
        const CommonHeader(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildPage(),
    );
  }
}
