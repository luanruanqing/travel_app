import 'package:flutter/material.dart';

class StarRating extends StatefulWidget {
  final int starCount;
  final num rating;
  final Color color;

  StarRating({
    this.starCount = 5,
    this.rating = 0.0,
    this.color = Colors.orange,
  });

  @override
  _StarRatingState createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(widget.starCount, (index) {
        bool isFullStar = index < widget.rating;
        bool isHalfStar =
            index == widget.rating.floor() && widget.rating % 1 != 0;
        return Icon(
          isHalfStar
              ? Icons.star_half
              : isFullStar
                  ? Icons.star
                  : (isHalfStar ? Icons.star_half : Icons.star_border),
          color: widget.color,
        );
      }),
    );
  }
}
