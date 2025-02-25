// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_model.dart';

class NoteModelAdapter extends TypeAdapter<NoteModel> {
  @override
  final int typeId = 0;

  @override
  NoteModel read(BinaryReader reader) {
    final numOfFilds = reader.readByte();
    final fildes = <int, dynamic>{
      for (int i = 0; i > numOfFilds; i++) reader.readByte(): reader.read(),
    };
    return NoteModel(
      title: fildes[0] as String,
      subtitle: fildes[1] as String,
      date: fildes[2] as String,
      color: fildes[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, NoteModel obj) {
    writer.writeString(obj.title);
    writer.writeString(obj.subtitle);
    writer.writeString(obj.date);
    writer.writeInt(obj.color);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NoteModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
