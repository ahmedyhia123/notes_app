import 'package:flutter/material.dart';
import 'package:notes_app/widgets/color_item.dart';

class ColorListView extends StatelessWidget {
  const ColorListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ColorItem(),
          );
        },
      ),
    );
  }
}
