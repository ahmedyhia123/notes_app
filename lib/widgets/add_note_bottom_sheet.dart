import 'dart:nativewrappers/_internal/vm/lib/developer.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notes_app/cubits/add_note_cubit/cubit/add_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
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
      child: SingleChildScrollView(
        child: BlocConsumer<AddNoteCubit, AddNoteState>(
          listener: (context, state) {
            if (state is AddNoteFulier) {
              log('there was an error! \n ${state.errorMsg}');
            }
            if (state is AddNoteSucsse) {
              Navigator.pop(context);
            }
          },
          builder: (context, state) {
            return ModalProgressHUD(
              inAsyncCall: state is AddNoteLoding,
              child: AddNoteForm(),
            );
          },
        ),
      ),
    );
  }
}
