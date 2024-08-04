import 'package:flutter/material.dart';
import 'package:nestify/core/utils/router.dart';
import 'package:nestify/core/utils/routes.dart';

void main() {
  runApp(const Nestify());
}

class Nestify extends StatelessWidget {
  const Nestify({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      onGenerateRoute:onGenerate ,
      debugShowCheckedModeBanner: false,
        initialRoute: AddRouter.verificationRoute,
    );
  }
}
