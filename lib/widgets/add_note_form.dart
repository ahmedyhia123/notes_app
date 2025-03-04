import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/constans.dart';
import 'package:notes_app/cubits/add_note_cubit/cubit/add_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
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

  final isLoading = false;
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
                BlocProvider.of<AddNoteCubit>(context).addNote(
                  NoteModel(
                    title: title!,
                    subtitle: subtitle!,
                    date:
                        DateFormat(
                          "yyyy-MM-dd",
                        ).format(DateTime.now()).toString(),
                    color: Colors.blue.value,
                  ),
                );
              } else {
                autovalidateMode = AutovalidateMode.always;
                setState(() {});
              }
            },
            child: BlocBuilder<AddNoteCubit, AddNoteState>(
              builder: (context, state) {
                return customBottom(
                  isLoading: state is AddNoteLoding ? true : false,
                );
              },
            ),
          ),

          SizedBox(height: 40),
        ],
      ),
    );
  }
}

class customBottom extends StatelessWidget {
  const customBottom({super.key, this.isLoading = false});
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
