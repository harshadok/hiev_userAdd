// ignore_for_file: non_constant_identifier_names

import 'package:hive/hive.dart';
//import 'lib.g.dart';
part 'model.g.dart';

@HiveType(typeId: 1)
class Model {
  @HiveField(0)
  int? id;
  @HiveField(1)
  final String firstName;
  @HiveField(2)
  final String lastName;
  @HiveField(3)
  final String Phone;
  @HiveField(4)
  final String age;

  Model({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.Phone,
    required this.age,
  });
}
