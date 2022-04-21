// ignore_for_file: constant_identifier_names

enum TaskType { ToDo, Phone, Email, Meeting }

extension ParseToString on TaskType {
  String toShortString() {
    return toString().split('.').last;
  }
}
