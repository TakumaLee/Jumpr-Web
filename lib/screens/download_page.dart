import 'package:flutter/material.dart';
import 'package:jumpr_web/utils/utils.dart';

import 'package:launch_review/launch_review.dart';
import 'dart:js' as js;

class DownloadPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 56,
            width: screenSize.width,
          ),
          SizedBox(
            height: screenSize.height,
            width: screenSize.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: screenSize.width / 3,
                  height: screenSize.width / 3,
                  child: Image(image: AssetImage(path('images/app-desc.png'))),
                ),
                SizedBox(
                  width: screenSize.width / 3,
                  height: screenSize.width / 3,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text('Download the latest version',
                          style: TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: screenSize.width / 6,
                              child: InkWell(
                                onTap: () {
                                  js.context.callMethod('open', ['https://play.google.com/store/apps/details?id=idv.kuma.app.jumpr']);
                                },
                                child: Image(image: AssetImage(path('images/google-play-badge.png'))),
                              ),
                            ),
                            SizedBox(
                              width: screenSize.width / 6,
                              child: InkWell(
                                onTap: () {
                                  js.context.callMethod('open', ['https://apps.apple.com/tw/app/jumpr-virtual-jump-rope/id1543650065']);
                                  LaunchReview.launch(writeReview: false,iOSAppId: "1543650065");
                                },
                                child: Image(image: AssetImage(path('images/apple-store-badge.png'))),
                              )
                            ),
                          ],
                        ),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text('・iOS version: 1.18\n・Android version: 1.0.49',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      )
    );
  }

}