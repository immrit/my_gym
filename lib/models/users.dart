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
  @HiveField(7)
  String amount;
  @HiveField(8)
  bool payment_method;
  @HiveField(9)
  String coach;
  @HiveField(10)
  String field;
  @HiveField(11)
  bool farvardin;
  @HiveField(12)
  bool ordibehesht;
  @HiveField(13)
  bool khordad;
  @HiveField(14)
  bool tir;
  @HiveField(15)
  bool mordad;
  @HiveField(16)
  bool shahrivar;
  @HiveField(17)
  bool mehr;
  @HiveField(18)
  bool aban;
  @HiveField(19)
  bool azar;
  @HiveField(20)
  bool dey;
  @HiveField(21)
  bool bahman;
  @HiveField(22)
  bool esphasnd;

  Users({
    required this.id,
    required this.name,
    required this.nationalCode,
    required this.fatherName,
    required this.date,
    required this.gender,
    required this.amount,
    required this.payment_method,
    required this.coach,
    required this.field,
    required this.farvardin,
    required this.ordibehesht,
    required this.khordad,
    required this.tir,
    required this.mordad,
    required this.shahrivar,
    required this.mehr,
    required this.aban,
    required this.azar,
    required this.dey,
    required this.bahman,
    required this.esphasnd,
  });
}
