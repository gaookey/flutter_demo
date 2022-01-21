import 'dart:math';
import 'package:flutter/material.dart';

class GoStarRating extends StatefulWidget {
  final double rating; // 0...1
  final int count;
  final double size;
  final Color normalColor;
  final Color selectedColor;
  final String normalImage;
  final String selectedImage;

  GoStarRating(
      {required double rating,
      this.count = 5,
      this.size = 30,
      this.normalColor = const Color(0xffbbbbbb),
      this.selectedColor = Colors.red,
      this.normalImage = "",
      this.selectedImage = ""})
      : rating = max(0, min(1, rating));

  @override
  _GoStarRatingState createState() => _GoStarRatingState();
}

class _GoStarRatingState extends State<GoStarRating> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(mainAxisSize: MainAxisSize.min, children: buildUnselectedStar()),
        Row(mainAxisSize: MainAxisSize.min, children: buildSelectedStar())
      ],
    );
  }

  List<Widget> buildUnselectedStar() {
    return List.generate(widget.count, (index) {
      if (widget.normalImage.isEmpty) {
        return Icon(Icons.star_border,
            color: widget.normalColor, size: widget.size);
      }
      return Image.asset(widget.normalImage,
          width: widget.size, height: widget.size);
    });
  }

  List<Widget> buildSelectedStar() {
    var star = null;
    if (widget.selectedImage.isEmpty) {
      star = Icon(Icons.star, color: widget.selectedColor, size: widget.size);
    } else {
      star = Image.asset(widget.selectedImage,
          width: widget.size, height: widget.size);
    }

    List<Widget> stars = [];

    double value = 10 / widget.count;
    int entireCount = (widget.rating * 10 / value).floor();
    for (var i = 0; i < entireCount; i++) {
      stars.add(star);
    }

    double leftWidth =
        ((widget.rating * 10 / value) - entireCount) * widget.size;
    final halfStar = ClipRect(clipper: GoStarClipper(leftWidth), child: star);

    stars.add(halfStar);

    if (stars.length > widget.count) {
      return stars.sublist(0, widget.count);
    }

    return stars;
  }
}

class GoStarClipper extends CustomClipper<Rect> {
  double width;

  GoStarClipper(this.width);

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0, 0, width, size.height);
  }

  @override
  bool shouldReclip(GoStarClipper oldClipper) {
    return oldClipper.width != width;
  }
}
