
/*
class Person {
  String name = "宫崎骏";
  String avatarURL = "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2F511%2F101611154647%2F111016154647-10-1200.jpg&refer=http%3A%2F%2Fimg.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1645359142&t=aad47bd7531128d918605dbbbe64e1ab";

  Person.fromMap(Map<String, dynamic> json) {
    this.name = json["name"];
    this.avatarURL = json["avatars"]["medium"];
  }
}

class Actor extends Person {
  Actor.fromMap(Map<String, dynamic> json) : super.fromMap(json);
}

class Director extends Person {
  Director.fromMap(Map<String, dynamic> json) : super.fromMap(json);
}

int counter = 1;

class MovieItem {
  int rank = 0;
  String imageURL = "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.pconline.com.cn%2Fimages%2Fupload%2Fupc%2Ftx%2Fitbbs%2F1310%2F14%2Fc25%2F27483108_1381737813693_mthumb.jpg&refer=http%3A%2F%2Fimg.pconline.com.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1645359143&t=c20a75844a2babe1598fec52db07d9a3";
  String title = "千与千寻";
  String playDate = "2018-18-18";
  double rating = 0;
  List<String> genres = ["adad", "kmksd", "o,sd", "oolcos", "asaxax"];
  List<Actor> casts = [];
  Director director = Director.fromMap({});
  String originalTitle = "";

  MovieItem.fromMap(Map<String, dynamic> json) {
    this.rank = counter++;
    this.imageURL = json["images"]["medium"];
    this.title = json["title"];
    this.playDate = json["year"];
    this.rating = json["rating"]["average"];
    this.genres = json["genres"].cast<String>();
    this.casts = (json["casts"] as List<dynamic>).map((item) {
      return Actor.fromMap(item);
    }).toList();
    this.director = Director.fromMap(json["directors"][0]);
    this.originalTitle = json["original_title"];
  }

  @override
  String toString() {
    return 'MovieItem{rank: $rank, imageURL: $imageURL, title: $title, playDate: $playDate, rating: $rating, genres: $genres, casts: $casts, director: $director, originalTitle: $originalTitle}';
  }
}
*/


class Person {
  String name = "宫崎骏";
  String avatarURL = "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2F511%2F101611154647%2F111016154647-10-1200.jpg&refer=http%3A%2F%2Fimg.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1645359142&t=aad47bd7531128d918605dbbbe64e1ab";
}

class Actor extends Person {

}

class Director extends Person {

}

int counter = 1;

class MovieItem {
  int rank = 0;
  String imageURL = "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg0.baidu.com%2Fit%2Fu%3D3453417222%2C293089715%26fm%3D253%26app%3D120%26f%3DJPEG%3Fw%3D791%26h%3D1200&refer=http%3A%2F%2Fimg0.baidu.com&app=2002&size=w300&q=a80&n=0&g=0n&fmt=jpeg?sec=1645364968&t=f417c54c353e98e5bec878055e33d4d0";
  String title = "千与千寻千与千寻千与千寻";
  String playDate = "2018-18-18";
  double rating = 0.3;
  List<String> genres = ["犯罪", "喜剧"];
  List<Actor> casts = [Actor(), Actor()];
  Director director = Director();
  String originalTitle = "名称名称名称名称名称名";


  @override
  String toString() {
    return 'MovieItem{rank: $rank, imageURL: $imageURL, title: $title, playDate: $playDate, rating: $rating, genres: $genres, casts: $casts, director: $director, originalTitle: $originalTitle}';
  }
}