import 'package:uuid/uuid.dart';

class UniqueID {
  final _uid = const Uuid().v4().split('-').join();

  String getID() {
    return _uid;
  }
}
