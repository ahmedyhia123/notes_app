import 'package:flutter/material.dart';
import 'package:notes_app/constans.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    return Padding(
      padding: EdgeInsets.only(
        bottom: keyboardHeight + MediaQuery.of(context).padding.bottom,
        left: 12,
        right: 12,
        top: 24,
      ),
      child: SingleChildScrollView(
        reverse: true,
        child: Column(
          children: [
            TextField(
              cursorColor: kPrimaryColor,
              decoration: InputDecoration(
                label: Text('Title', style: TextStyle(color: kPrimaryColor)),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: kPrimaryColor, width: 1),
                  borderRadius: BorderRadius.circular(12),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 1),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              maxLines: 5,
              cursorColor: Color(0xff62FCD6),
              decoration: InputDecoration(
                label: Text('Contant', style: TextStyle(color: kPrimaryColor)),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: kPrimaryColor, width: 1),
                  borderRadius: BorderRadius.circular(12),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 1),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 50),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                width: double.infinity,
                height: 40,

                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Add',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
              ),
            ),

            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
