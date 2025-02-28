part of 'notes_cubit.dart';

@immutable
sealed class NotesState {}

final class NotesInitial extends NotesState {}

final class NotesSucsse extends NotesState {
  NotesSucsse(this.notes);
  final List<NoteModel> notes;
}

final class NotesFulier extends NotesState {
  final String errorMsg;

  NotesFulier(this.errorMsg);
}

final class NotesLoading extends NotesState {}
