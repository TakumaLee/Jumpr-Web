import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:jumpr_web/utils/utils.dart';
import 'package:jumpr_web/widgets/responsive.dart';

class IndexPage extends StatelessWidget {

  Function? toDownloadPage;

  IndexPage(this.toDownloadPage);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    final ButtonStyle flatButtonStyle = ElevatedButton.styleFrom(
      primary: Colors.green,
      minimumSize: Size(88, 36),
      maximumSize: Size(256, 128),
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(96.0)),
      ),
    );

    var title = ResponsiveWidget.isSmallScreen(context) ? 'AR jump rope' : 'Jumpr is the world’s first AR jump rope!';
    var desc = ResponsiveWidget.isSmallScreen(context) ? 'AI-powered body tracking detection' : 'You don\'t need a jumping rope, simply place your mobile upright on the floor, Jumpr uses AI-powered body tracking to detect your movement and creates a virtual jumping rope on the screen that you can hold to skipping mimics the real jump rope. During the workout,  Jumpr will tell you the exact number of jumps and the total calories you\'ve burnt. Jumpr also launched the world challenge, where you can pit your stats against jumprs from all over the world and represent your country!';
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 72,
        ),
        Container(
          color: const Color.fromARGB(255, 200, 200, 200),
          child: Column(
            children: [
              const SizedBox(
                height: 24,
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: screenSize.width / 2,
                    child: Center(
                      child: Image(image: AssetImage(path('images/app-screen-1.jpg')),
                        width: 256,
                        height: 512,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(title,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: ResponsiveWidget.isSmallScreen(context) ? 24 : 48
                            ),
                          ),
                        ),
                        const SizedBox(height: 24,),
                        Text(desc,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: ResponsiveWidget.isSmallScreen(context) ? 16: 24
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 24,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 48,
        ),
        ResponsiveWidget.isSmallScreen(context) ? downloadItem(flatButtonStyle) : Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            downloadItem(flatButtonStyle),
            const SizedBox(
              width: 256,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(512.0),
              child: Image(image: AssetImage(path('images/logo_512.png'))),
            )
          ],
        ),
        const SizedBox(
          height: 24,
        ),
        Container(
          color: const Color.fromARGB(255, 200, 200, 200),
          child: Column(
            children: [
              const SizedBox(height: 24,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: screenSize.width / 2,
                    child: Center(
                      child: Image(image: AssetImage(path('images/app-screen-data.jpg')),
                        width: 256,
                        height: 512,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Your data privacy',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: ResponsiveWidget.isSmallScreen(context) ? 24 : 48
                            ),
                          ),
                        ),
                        SizedBox(height: 24,),
                        Text('Jumpr uses AI powered body tracking to recognize your movement through frontal camera. We value your privacy, APP doesn\'t store data or record video. All AI calculations are made directly on your phone. We do not store or use or sell your data.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: ResponsiveWidget.isSmallScreen(context) ? 16 : 32,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 24,),
            ],
          )
        )
      ],
    );
  }

  Widget downloadItem(ButtonStyle flatButtonStyle) {
    return Column(
      children: [
        const Text('Let\'s jump!',
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 64
          ),
        ),
        const SizedBox(height: 50,),
        ConstrainedBox(
          constraints: BoxConstraints.tightFor(width: 300, height: 96),
          child: ElevatedButton(
            style: flatButtonStyle,
            onPressed: () {
              toDownloadPage?.call();
            },
            child: const Text('Download',
              style: TextStyle(
                  fontSize: 36,
                  color: Colors.white
              ),
            ),
          ),
        ),
      ],
    );
  }

}