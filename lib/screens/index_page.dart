import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

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
                      child: Image.asset('images/app-screen-1.jpg',
                        width: 256,
                        height: 512,
                      ),
                    ),
                  ),
                  Column(
                    children: const [
                      Text('Jumpr, Title.',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 64
                        ),
                      ),
                      Text('Jumpr, Description',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40
                        ),
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 24,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 48,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                const Text('Jumpr, Title.',
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
            ),
            const SizedBox(
              width: 256,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(512.0),
              child: Image.asset('images/logo_512.png'),
            )
          ],
        )
      ],
    );
  }

}