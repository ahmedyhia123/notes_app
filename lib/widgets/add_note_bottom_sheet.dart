import 'package:flutter/material.dart';
import 'package:notes_app/widgets/add_note_form.dart';

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
      child: SingleChildScrollView(child: AddNoteForm()),
    );
  }
}
