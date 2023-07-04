


import 'package:flutter/material.dart';
import 'package:news_snack/model/newsArt.dart';
import 'package:news_snack/view/widget/newsContainer.dart';
import 'package:news_snack/controller/fetchNews.dart';
import 'package:news_snack/view/customAppbar.dart';
import 'package:news_snack/view/widget/searchBar.dart';
class HomeScreen extends StatefulWidget {
  String quarry;
   HomeScreen({super.key,required this.quarry});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

DropdownMenuItem<String>buildMenuItem(String item)=>
    DropdownMenuItem(value: item,
      child: Text(item,
        style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20),
      ),
    );


class _HomeScreenState extends State<HomeScreen> {
  final  items=['business','entertainment','general','health','science','sports','technology'];
String? listvalue;
  bool isLoading=true;
  late NewsArt newsArt;
  GetNews() async{
   newsArt= await apiOparation.fetchnews();
   setState(() {
     isLoading=false;
   });
  }
  GetNewscat(String quarry)async{
    newsArt=await apiOparation.fetchnewscat(quarry);
    setState(() {
      isLoading=false;
    });
  }
  @override
  void initState() {
    GetNews();
    GetNewscat(widget.quarry);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:Text("News Snaks"),
          elevation: 0.0,
          centerTitle: true,

          actions: [
         DropdownButtonHideUnderline(
           child: DropdownButton<String>(
             value:listvalue,
                  hint:Text("Select"),
             items: items.map(buildMenuItem).toList(),
             onChanged: (value)=>setState(() {
               this.listvalue=value;
               GetNewscat(listvalue!);

               print(listvalue);
             }),
           ),
         )
          ],

        ),
       body: PageView.builder(
         onPageChanged: (value){
           setState(() {
             isLoading=true;
           });
           if(listvalue==null){
             GetNews();
           }
           else {
             GetNewscat(listvalue!);
           }
         },
         scrollDirection: Axis.vertical,
         controller: PageController(initialPage:2 ),

         itemBuilder: (context, index) {

          return isLoading?Center(child: CircularProgressIndicator(color: Colors.red),): NewsContainer(
            imgUrl: newsArt.imgUrl,
              newsCnt: newsArt.newsCnt,
              newsHead: newsArt.newdHead,
              newsUrl: newsArt.newsUrl,
              newsDes:newsArt.newdDes,
              newsTime: newsArt.newsTime,
          );

       },
         ),
    );


  }
}
