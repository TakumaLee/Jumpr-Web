import 'package:flutter/material.dart';

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
                  child: Image.asset('images/app-desc.png'),
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
                              child: Image.asset('images/google-play-badge.png'),
                            ),
                            SizedBox(
                              width: screenSize.width / 6,
                              child: Image.asset('images/apple-store-badge.png'),
                            ),
                          ],
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