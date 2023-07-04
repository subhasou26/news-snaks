class NewsArt{
  String imgUrl;
  String newdHead;
  String newdDes;
  String newsCnt;
  String newsUrl;
  String newsTime;
  NewsArt({
    required this.imgUrl,
    required this.newdHead,
    required this.newdDes,
    required this.newsCnt,
    required this.newsUrl,
    required this.newsTime
});

  static NewsArt fromAPItoApp(Map<String,dynamic> article) {
    return  NewsArt(
        imgUrl: article["urlToImage"]??"https://img.freepik.com/premium-vector/blue-breaking-news-dark-blue-background-illustration-vector-news-concept_194782-1404.jpg?w=2000",
        newdHead: article["title"]??"--",
        newdDes: article["description"]??"--",
        newsCnt: article["content"]??"The content is nor avalable",
        newsUrl: article["url"]??"https://news.google.com/home?hl=en-IN&gl=IN&ceid=IN:en",
        newsTime:article["publishedAt"]??"Unknown" );


  }

}