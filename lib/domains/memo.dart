import 'model.dart' show Model;

abstract class Memo extends Model {
  DateTime dateTime;
  String title;
  String text;
}
