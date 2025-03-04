import 'package:flutter/material.dart';
import 'package:notes_app/widgets/notes_list_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';

class notes_view_body extends StatefulWidget {
  const notes_view_body({super.key});

  @override
  State<notes_view_body> createState() => _notes_view_bodyState();
}

class _notes_view_bodyState extends State<notes_view_body> {
  void initState() {
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text('Notes', style: TextStyle(fontSize: 24)),
            Spacer(),
            Container(
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(Icons.search),
            ),
          ],
        ),
        SizedBox(height: 10),
        NotesListView(),
      ],
    );
  }
}
