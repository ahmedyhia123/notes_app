import 'package:objectbox/objectbox.dart';

@Entity()
@Sync()
class NoteModel {
  @Id()
  int id;
  String title;

  String subtitle;

  final String date;

  int color;

  NoteModel({
    this.id = 0,
    required this.title,
    required this.subtitle,
    required this.date,
    required this.color,
  });
}
