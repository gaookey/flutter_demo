import 'package:flutter/material.dart';

import '../../model/home_model.dart';
import '../../widgets/star_rating.dart';
import '../../widgets/dashed_line.dart';

class GoHomeMovieItem extends StatelessWidget {
  final MovieItem movieItem;

  GoHomeMovieItem(this.movieItem);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            border:
                Border(bottom: BorderSide(width: 8, color: Colors.black12))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildHeader(),
            SizedBox(height: 8),
            buildContent(),
            SizedBox(height: 8),
            buildContentFooter(),
          ],
        ));
  }

  // 头部的布局
  Widget buildHeader() {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      decoration: BoxDecoration(
          color: Colors.amber, borderRadius: BorderRadius.circular(5)),
      child: Text(
        "No.${movieItem.rank}",
        style: TextStyle(fontSize: 16, color: Colors.purple),
      ),
    );
  }

  // 内容的布局
  Widget buildContent() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildContentImage(),
        SizedBox(width: 8),
        Expanded(
            child: IntrinsicHeight(
          child: Row(
            children: [
              buildContentInfo(),
              SizedBox(width: 8),
              buildContentLine(),
              SizedBox(width: 8),
              buildContentWish()
            ],
          ),
        )),
      ],
    );
  }

  Widget buildContentImage() {
    return ClipRRect(
        child: Image.network(
          movieItem.imageURL,
          height: 1200 * 0.1,
          width: 719 * 0.1,
        ),
        borderRadius: BorderRadius.circular(8));
  }

  Widget buildContentInfo() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildContentInfoTitle(),
          SizedBox(height: 5),
          buildContentInfoRate(),
          SizedBox(height: 5),
          buildContentInfoDesc()
        ],
      ),
    );
  }

  Widget buildContentInfoTitle() {
    return Text.rich(TextSpan(children: [
      WidgetSpan(
          child: Icon(Icons.airplay_outlined, color: Colors.red, size: 25),
          baseline: TextBaseline.ideographic,
          alignment: PlaceholderAlignment.middle),
      WidgetSpan(
          child: SizedBox(
        width: 3,
      )),
      ...movieItem.title.runes.map((rune) {
        return WidgetSpan(
            child: Text(new String.fromCharCode(rune),
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            alignment: PlaceholderAlignment.middle);
      }).toList(),
      WidgetSpan(
          child: SizedBox(
        width: 3,
      )),
      WidgetSpan(
          child:
              Text("(${movieItem.playDate})", style: TextStyle(fontSize: 12)))
    ]));
  }

  Widget buildContentInfoRate() {
    return FittedBox(
      child: Row(
        children: [
          GoStarRating(rating: movieItem.rating, size: 25),
          SizedBox(width: 5),
          Text("${movieItem.rating}", style: TextStyle(fontSize: 18))
        ],
      ),
    );
  }

  Widget buildContentInfoDesc() {
    final genres = movieItem.genres.join(" ");
    final director = movieItem.director.name;
    final casts = movieItem.casts.map((item) => item.name).join(" ");

    return Text("$genres / $director / $casts",
        maxLines: 2, overflow: TextOverflow.ellipsis);
  }

  Widget buildContentLine() {
    return Container(
      height: 120,
      child: GoDashedLine(
        axis: Axis.vertical,
        dashedHeight: 6,
        count: 10,
        color: Colors.grey,
      ),
    );
  }

  Widget buildContentWish() {
    return Container(
      // height: 120,
      width: 60,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.star_border, size: 30),
          SizedBox(height: 8),
          Text("喜欢")
        ],
      ),
    );
  }

  Widget buildContentFooter() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.black12, borderRadius: BorderRadius.circular(5)),
      child: Text(
        movieItem.originalTitle,
        style: TextStyle(color: Colors.grey, fontSize: 16),
      ),
    );
  }
}
