import 'note_model.dart';
import '../objectbox.g.dart';

class ObjectBox {
  late final Store store;
  late final Box<NoteModel> _noteBox;

  ObjectBox._create(this.store) {
    _noteBox = Box<NoteModel>(store);
  }

  static Future<ObjectBox> init() async {
    final store = await openStore();
    return ObjectBox._create(store);
  }

  NoteModel? getNote(int id) => _noteBox.get(id);
  int insertNote(NoteModel note) => _noteBox.put(note);
  void updateNote(int noteId, NoteModel newNote) {
    var note = _noteBox.get(noteId); // احصل على الكائن الموجود
    if (note != null) {
      note.title = newNote.title;
      note.subtitle = newNote.subtitle;
      _noteBox.put(note); // قم بالتحديث
    }
  }

  bool deleteNote(int id) => _noteBox.remove(id);
  List<NoteModel> getAllNotes() => _noteBox.getAll();
  deleteAllNotes() => _noteBox.removeAll();
}
