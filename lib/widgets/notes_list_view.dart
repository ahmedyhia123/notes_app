import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/widgets/note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel> notes = BlocProvider.of<NotesCubit>(context).notes!;
        if (notes.isNotEmpty) {
          return Expanded(
            child: ListView.builder(
              itemCount: notes.length,

              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 14),
                  child: NoteItem(note: notes[index]),
                );
              },
            ),
          );
        } else {
          return Center(child: Text('No Notes Yet! ,add some notes'));
        }
      },
    );
  }
}
