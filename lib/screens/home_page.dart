import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:jumpr_web/screens/download_page.dart';
import 'package:jumpr_web/screens/index_page.dart';
import 'package:jumpr_web/screens/main_page.dart';

import '/widgets/bottom_bar.dart';
import '/widgets/responsive.dart';
import '/widgets/top_bar_contents.dart';
import '/widgets/web_scrollbar.dart';

class HomePage extends StatefulWidget {
  static const String route = '/';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController _scrollController;
  toDownloadPage() {
    setState(() {
      container = DownloadPage();
    });
  }

  double _scrollPosition = 0;
  double _opacity = 0;
  Widget container = IndexPage(null);

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (container is IndexPage) {
      (container as IndexPage).toDownloadPage = toDownloadPage;
    }

    var screenSize = MediaQuery.of(context).size;
    _opacity = _scrollPosition < screenSize.height * 0.40
        ? _scrollPosition / (screenSize.height * 0.40)
        : 1;

    return WillPopScope(
        onWillPop: () async => true,
        child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          extendBodyBehindAppBar: true,
          appBar: ResponsiveWidget.isSmallScreen(context)
              ? AppBar(
                  backgroundColor:
                      Theme.of(context).bottomAppBarColor.withOpacity(_opacity),
                  elevation: 0,
                  centerTitle: true,
                  actions: [
                    // IconButton(
                    //   icon: Icon(Icons.brightness_6),
                    //   splashColor: Colors.transparent,
                    //   highlightColor: Colors.transparent,
                    //   onPressed: () {
                    //     EasyDynamicTheme.of(context).changeTheme();
                    //   },
                    // ),
                  ],
                  title: const Text(
                    'Jumpr',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 20,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w400,
                      letterSpacing: 3,
                    ),
                  ),
                )
              : PreferredSize(
                  preferredSize: Size(screenSize.width, 1000),
                  child: TopBarContents(_opacity, () {
                    setState(() {
                      container = IndexPage(toDownloadPage);
                    });
                  }, () {
                    setState(() {
                      container = DownloadPage();
                    });
                  }),
                ),
          // drawer: ExploreDrawer(),
          body: WebScrollbar(
            color: Colors.blueGrey,
            backgroundColor: Colors.blueGrey.withOpacity(0.3),
            width: 10,
            heightFraction: 0.3,
            controller: _scrollController,
            child: SingleChildScrollView(
              controller: _scrollController,
              physics: ClampingScrollPhysics(),
              child: Column(
                children: [
                  container,
                  BottomBar(),
                ],
              ),
            ),
          ),
        ));
  }
}
