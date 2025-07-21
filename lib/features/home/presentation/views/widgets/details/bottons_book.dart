import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:nestify/core/helper/paymob/payment_manager.dart';
import 'package:nestify/core/theme/app_color.dart';
import 'package:nestify/core/widgets/space.dart';
import 'package:nestify/features/auth/presentation/view/widgets/custom_button.dart';
import 'package:nestify/features/home/data/model/house_model.dart';
import 'package:nestify/features/home/presentation/views/contact_owner_view.dart';
import 'package:nestify/features/home/presentation/views/payment_view.dart';

class ButtonsBook extends StatefulWidget {
  const ButtonsBook({
    super.key,
    required this.house,
  });
  final HouseModel house;

  @override
  State<ButtonsBook> createState() => _ButtonsBookState();
}

class _ButtonsBookState extends State<ButtonsBook> {
  DateTime? selectedDate;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: CustomButton(
                text: 'contact owner',
                onPressed: () {
                  Get.to(() => ContactOwnerView(house: widget.house),
                      transition: Transition.fade);
                },
                color: Colors.white,
                foreCol: AppColor.primaryColor),
          ),
          const SpaceH(15),
          Expanded(
            child: CustomButton(
                text: 'book Now',
                onPressed: () {
                  _selectDate(context);
                },
                color: AppColor.primaryColor),
          ),
        ],
      ),
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime? datePicked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2025),
      lastDate: DateTime(2026),
    );

    if (datePicked != null && datePicked != DateTime.now()) {
      String clientUrl = await PaymentManager().payWithPayMob(
          price: (num.parse(widget.house.price) * 100).toString(),);

      setState(() {
        selectedDate = datePicked;
        Get.to(() => PaymentGatewayView(
              clientUrl: clientUrl,
            ));
      });
    }
  }
}
