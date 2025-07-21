import 'package:flutter/material.dart';
import 'package:flutter_pannable_rating_bar/flutter_pannable_rating_bar.dart';
import 'package:nestify/core/utils/styles.dart';
import 'package:nestify/core/widgets/space.dart';

class CustomRatingDialog extends StatefulWidget {
  const CustomRatingDialog({
    super.key,
  });
  

  @override
  State<CustomRatingDialog> createState() => _CustomRatingDialogState();
}

class _CustomRatingDialogState extends State<CustomRatingDialog> {
  double rating = 0;
  bool rated = false;

  String textRate(double rate) {
    if (rate > 0 && rate <= 2) {
      return 'Good!';
    } else if (rate >= 2 && rate <= 3.5) {
      return 'Very Good!';
    } else if (rate == 0) {
      return 'Rating!';
    } else {
      return 'Impressive!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(textRate(rating), style: Styles.style16),
            const SpaceV(20),
            PannableRatingBar(
                rate: rating,
                items: List.generate(
                    5,
                    (index) => const RatingWidget(
                          selectedColor: Colors.yellow,
                          unSelectedColor: Colors.grey,
                          child: Icon(
                            Icons.star,
                            size: 48,
                          ),
                        )),
                onChanged: (value) {
                  setState(() {
                    rating = value;
                    rated = true;
                  });
                },
                onCompleted: (finalRate) {
                  Navigator.pop(context);
                }),
            const SpaceV(20),
            Text(
              rated ? 'Thank you for your feadback!' : '',
              style: Styles.style16,
            ),
          ],
        ),
      ),
    );
  }
}
