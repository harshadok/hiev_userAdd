import 'package:hive/hive.dart';
//import 'lib.g.dart';
part 'model.g.dart';

@HiveType(typeId: 1)
class Model {
  @HiveField(0)
  int? id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String pass;
  @HiveField(3)
  final String email;
  @HiveField(4)
  final String phone;

  Model({
    this.id,
    required this.name,
    required this.pass,
    required this.email,
    required this.phone,
  });
}
