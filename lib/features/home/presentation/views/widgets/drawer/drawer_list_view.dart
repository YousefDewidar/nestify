import 'package:flutter/material.dart';
import 'package:nestify/features/home/data/drawer_card_data.dart';
import 'package:nestify/features/home/presentation/views/widgets/drawer/drawer_option_card.dart';

class DrawerListView extends StatelessWidget {
  const DrawerListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .41,
      child: ListView.separated(
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: DrawerData.cardData.length,
        itemBuilder: (context, index) {
          return DrawerOptionCard(cardModel: DrawerData.cardData[index]);
        },
        separatorBuilder: (context, index)=>const Divider(indent: 40,),
      ),
    );
  }
}
