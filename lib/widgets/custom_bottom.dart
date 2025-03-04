import 'package:flutter/material.dart';
import 'package:notes_app/constans.dart';

class CustomBottom extends StatelessWidget {
  const CustomBottom({super.key, this.isLoading = false});
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      height: 40,

      child: Align(
        alignment: Alignment.center,
        child:
            isLoading
                ? SizedBox(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator(color: Colors.black),
                )
                : Text(
                  'Add',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
      ),
    );
  }
}
