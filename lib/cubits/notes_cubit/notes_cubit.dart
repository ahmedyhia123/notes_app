import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/models/object_Box.dart';
part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  final ObjectBox objectBox;
  List<NoteModel>? notes;

  NotesCubit(this.objectBox) : super(NotesInitial());

  fetchAllNotes() {
    notes = objectBox.getAllNotes();
    emit(NotesSucsse());
  }
}
