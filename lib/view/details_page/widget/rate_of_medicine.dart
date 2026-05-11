import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../core/resources/color_manager.dart';


class RateOfMedicine extends StatelessWidget {
  const RateOfMedicine({
    super.key,
    required this.initialRating,
    required this.onRatingUpdate,
  });

  final double initialRating;
  final ValueChanged<double> onRatingUpdate;

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: 3,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemSize: 20,
      unratedColor: ColorManager.semiLightGray,
      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
      itemBuilder: (context, _) =>
          Icon(Icons.star, color: ColorManager.primary),
      onRatingUpdate: onRatingUpdate,
    );
  }
}