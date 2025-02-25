part of 'add_note_cubit.dart';

@immutable
sealed class AddNoteState {}

final class AddNoteInitial extends AddNoteState {}

final class AddNoteLoding extends AddNoteState {}

final class AddNoteSucsse extends AddNoteState {}

final class AddNoteFulier extends AddNoteState {
  final String errorMsg;

  AddNoteFulier(this.errorMsg);
}
