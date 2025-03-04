import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/main.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  addNote(NoteModel note) async {
    emit(AddNoteLoding());
    try {
      objectBox.insertNote(note);
      print('note added');

      emit(AddNoteSucsse());
    } catch (e) {
      emit(AddNoteFulier(e.toString()));
    }
  }
}
