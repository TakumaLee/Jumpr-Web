import 'package:flutter/material.dart';
import 'package:jumpr_web/widgets/carousel.dart';
import 'package:jumpr_web/widgets/destination_heading.dart';
import 'package:jumpr_web/widgets/featured_heading.dart';
import 'package:jumpr_web/widgets/featured_tiles.dart';
import 'package:jumpr_web/widgets/floating_quick_access_bar.dart';

import '../routes.dart';

class MainPage extends StatefulWidget {

  MainPage();

  @override
  State<StatefulWidget> createState() {
    return _MainPageState();
  }

}

class _MainPageState extends State<MainPage> {


  _MainPageState();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        Stack(
          children: [
            Container(
              child: SizedBox(
                height: screenSize.height * 0.45,
                width: screenSize.width,
                child: Image.asset(
                  'assets/images/cover.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              children: [
                FloatingQuickAccessBar(screenSize: screenSize),
                Container(
                  child: Column(
                    children: [
                      FeaturedHeading(
                        screenSize: screenSize,
                      ),
                      FeaturedTiles(screenSize: screenSize)
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
        DestinationHeading(screenSize: screenSize),
        DestinationCarousel(),
      ],
    );
  }
}