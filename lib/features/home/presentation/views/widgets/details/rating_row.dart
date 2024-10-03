import 'package:flutter/material.dart';
import 'package:flutter_pannable_rating_bar/flutter_pannable_rating_bar.dart';
import 'package:nestify/core/theme/app_color.dart';
import 'package:nestify/core/utils/styles.dart';
import 'package:nestify/core/widgets/space.dart';
import 'package:nestify/features/home/data/model/house_model.dart';
import 'package:nestify/features/home/presentation/views/widgets/details/custom_rating_dialog.dart';
import 'package:nestify/features/home/presentation/views/widgets/details/num_bed_card.dart';

class RatingRow extends StatefulWidget {
  const RatingRow({
    super.key,
    required this.house,
  });

  final HouseModel house;

  @override
  State<RatingRow> createState() => _RatingRowState();
}

class _RatingRowState extends State<RatingRow> {
  int numOfReview = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          NumBedsCard(numers: '${widget.house.bd}bd', icon: Icons.bed_outlined),
          const SpaceH(15),
          NumBedsCard(
              numers: '${widget.house.ba}ba', icon: Icons.bathtub_outlined),
          const SpaceH(25),
          const SizedBox(
            height: 70,
            child: VerticalDivider(),
          ),
          const SpaceH(25),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Ratings', style: Styles.style16),
              GestureDetector(
                onTap: () {

                  showDialog(
                    context: context,
                    builder: (context) {
                      return  const CustomRatingDialog();
                    },
                  );
                },
                child: PannableRatingBar(
                  rate: 4,
                  items: List.generate(
                      5,
                      (index) => const RatingWidget(
                            selectedColor: Colors.yellow,
                            unSelectedColor: Colors.grey,
                            child: Icon(
                              Icons.star,
                              size: 22,
                            ),
                          )),
                ),
              ),
              Text('$numOfReview' ' reviews',
                  style: const TextStyle(
                      color: AppColor.primaryColor,
                      decoration: TextDecoration.underline))
            ],
          ),
        ],
      ),
    );
  }
}
