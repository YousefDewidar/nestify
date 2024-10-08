import 'package:flutter/material.dart';
import 'package:nestify/core/theme/app_color.dart';
import 'package:nestify/features/home/presentation/views/widgets/drawer/custom_drawer.dart';
import 'package:nestify/features/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      backgroundColor: AppColor.backGColor,
      body: HomeViewBody(),
      drawer: CustomDrawer(),
    );
  }
}
