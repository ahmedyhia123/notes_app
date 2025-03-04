import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/main.dart';
import 'package:notes_app/models/note_model.dart';

class EditView extends StatefulWidget {
  const EditView({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditView> createState() => _EditViewState();
}

class _EditViewState extends State<EditView> {
  TextEditingController titleController = TextEditingController();

  TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Row(
                children: [
                  Text('Edit Note', style: TextStyle(fontSize: 24)),
                  Spacer(),
                  Container(
                    width: 46,
                    height: 46,
                    decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.check),
                      onPressed: () {
                        widget.note.title =
                            titleController.text.isEmpty
                                ? widget.note.title
                                : titleController.text;
                        widget.note.subtitle =
                            contentController.text.isEmpty
                                ? widget.note.subtitle
                                : contentController.text;
                        objectBox.updateNote(widget.note.id, widget.note);
                        BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              TextField(
                controller: titleController,
                cursorColor: Color(0xff62FCD6),
                decoration: InputDecoration(
                  hintText: widget.note.title,
                  label: Text(
                    'Title',
                    style: TextStyle(color: const Color(0xff62FCD6)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff62FCD6), width: 1),
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
                controller: contentController,
                maxLines: 5,
                cursorColor: Color(0xff62FCD6),
                decoration: InputDecoration(
                  hintText: widget.note.subtitle,
                  label: Text(
                    'Contant',
                    style: TextStyle(color: const Color(0xff62FCD6)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff62FCD6), width: 1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
