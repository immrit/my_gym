import 'package:hive/hive.dart';
part 'users.g.dart';

@HiveType(typeId: 0)
class Users {
  @HiveField(1)
  int id;
  @HiveField(2)
  String name;
  @HiveField(3)
  String nationalCode;
  @HiveField(4)
  String fatherName;
  @HiveField(5)
  String date;
  @HiveField(6)
  bool gender;

  Users({
    required this.id,
    required this.name,
    required this.nationalCode,
    required this.fatherName,
    required this.date,
    required this.gender,
  });
}
