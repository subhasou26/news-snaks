import 'package:flutter/material.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 150,
                    width: 150,
                    child: Image.asset("assets/img/logo-color.png")),

              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("News Snaks",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 50,),)
              ],
            )
          ],
        ),
      )
    );
  }
}
