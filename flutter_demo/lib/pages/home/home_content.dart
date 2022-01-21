import 'package:flutter/material.dart';

import '../home/home_movie_item.dart';
import '../../model/home_model.dart';
import '../../service/home_request.dart';

class GoHomeContent extends StatefulWidget {
  @override
  State<GoHomeContent> createState() => _GoHomeContentState();
}

class _GoHomeContentState extends State<GoHomeContent> {
  final List<MovieItem> movies = [];

  @override
  void initState() {
    super.initState();

    HomeRequest.reuqestMovieList(0).then((result) {
      setState(() {
        movies.addAll(result);
      });
    }).onError((error, stackTrace) {
      print("数据请求错误");

      setState(() {
        for (var i = 0; i < 50; i ++) {
          MovieItem movieItem = MovieItem();
          movieItem.title = "${movieItem.title}++$i";
          movieItem.rank = i + 1;
          movies.add(movieItem);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movies.length,
      itemBuilder: (context, index) {
        return GoHomeMovieItem(movies[index]);
      },
    );
  }
}
