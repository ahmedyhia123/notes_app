import 'package:flutter/material.dart';
import 'package:notes_app/constans.dart';
import 'package:notes_app/widgets/costom_text_form_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> myForm = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subtitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: autovalidateMode,
      key: myForm,
      child: Column(
        children: [
          CostomTextFormField(
            maxLines: 1,
            title: 'Title',

            onSaved: (newValue) {
              title = newValue;
            },
          ),
          SizedBox(height: 10),

          CostomTextFormField(
            title: 'Contant',
            maxLines: 5,
            onSaved: (newValue) {
              subtitle = newValue;
            },
          ),

          SizedBox(height: 30),
          GestureDetector(
            onTap: () {
              if (myForm.currentState!.validate()) {
                myForm.currentState!.save();
              } else {
                autovalidateMode = AutovalidateMode.always;
                setState(() {});
              }
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
    );
  }
}
