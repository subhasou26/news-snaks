import 'package:flutter/material.dart';


class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RichText(

        text: TextSpan(
          children:[
           TextSpan(
             text: "News",
             style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w600),
             children: [   TextSpan(
                 text: " Snaks",
                 style: TextStyle(color: Colors.orangeAccent,fontSize: 20,fontWeight: FontWeight.w600)
             ),]
           ),

          ]
        ),
      )
    );
  }
}
