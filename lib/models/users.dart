import 'package:hive/hive.dart';
part 'users.g.dart';

@HiveType(typeId: 0)
class Users {
  @HiveField(0)
  int id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String nationalCode;
  @HiveField(3)
  String fatherName;
  @HiveField(4)
  String date;
  @HiveField(5)
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
