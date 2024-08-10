
import 'package:flutter/material.dart';
import 'package:nestify/core/theme/app_color.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search_rounded, color: Colors.grey),
          suffixIcon: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.tune, color: AppColor.primaryColor),
          ),
          hintText: 'Search',
          hintStyle: const TextStyle(color: Colors.grey),
          contentPadding: const EdgeInsets.all(5),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(14))),
          enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(14)),
              borderSide: BorderSide(color: Colors.grey)),
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(14)),
              borderSide: BorderSide(color: AppColor.primaryColor)),
        ),
      ),
    );
  }
}
