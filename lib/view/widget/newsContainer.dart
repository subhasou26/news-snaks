import 'package:flutter/material.dart';
import 'package:news_snack/view/detail_view.dart';
import 'package:intl/intl.dart';

class NewsContainer extends StatelessWidget {
  String imgUrl;
  String newsHead;
  String newsDes;
  String newsUrl;
  String newsCnt;
  String newsTime;
   NewsContainer({super.key,
      required this.imgUrl,
     required this.newsDes,
     required this.newsHead,
     required this.newsUrl,
     required this.newsCnt,
     required this.newsTime,
   });

  @override
  Widget build(BuildContext context) {
    DateTime parsedDate = DateTime.parse(newsTime);
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          FadeInImage.assetNetwork(
              height:300,
              width: MediaQuery.of(context).size.width,
              fit:BoxFit.cover,
              placeholder: "assets/img/placeholderimg.png",
              image: imgUrl),

          SizedBox(height: 15,),
          Container(

            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  newsHead.length>90?
                  "${newsHead.substring(0,90)}...":newsHead,
                  style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Text(newsDes,style: TextStyle(fontSize: 10,color: Colors.grey),),
                SizedBox(height: 10,),
                Text(
                  newsCnt!="--"?
                  newsCnt.length>255? newsCnt.substring(0,260):
                  "${newsCnt.toString().substring(0,newsCnt.length-15)}...":newsCnt,
                  style: TextStyle(fontSize: 16),),
                SizedBox(height: 5,),
                Text("Publish at:${DateFormat('yMMMMd').format(parsedDate)}",style: TextStyle(fontWeight: FontWeight.w300),),
              ],
            ),
          ),

          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(onPressed:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DetailViewScreen(newsUrl:newsUrl),));
                },
                    child:Text("Read More")),
              ),
            ],
          ),
          SizedBox(height: 20,),
        ],
      ),
    );
  }
}
