import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

import 'package:my_gym/main.dart';
import 'package:my_gym/models/users.dart';

class NewMember extends StatefulWidget {
  const NewMember({super.key});
  static int groupId = 0;
  static int payMethod = 0;
  static TextEditingController nameControll = TextEditingController();
  static TextEditingController fatherNameControll = TextEditingController();
  static TextEditingController nationalCodeControll = TextEditingController();
  static TextEditingController amountControll = TextEditingController();
  static TextEditingController coachController = TextEditingController();
  static TextEditingController fieldController = TextEditingController();
  static bool isEditing = false;
  static int id = 0;
  static String date = "تاریخ";
  static bool farvardin = false;
  static bool ordibehesht = false;
  static bool khordad = false;
  static bool tir = false;
  static bool mordad = false;
  static bool shahrivar = false;
  static bool mehr = false;
  static bool aban = false;
  static bool azar = false;
  static bool dey = false;
  static bool bahman = false;
  static bool esphasnd = false;

  @override
  State<NewMember> createState() => _NewMemberState();
}

class _NewMemberState extends State<NewMember> {
  Box<Users> hiveBox = Hive.box('users');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(15),
        child: ListView(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                NewMember.isEditing ? "ویرایش اطلاعات" : "افزودن ورزشکار",
                style: const TextStyle(fontSize: 18),
              ),
              MyTextField(
                name: 'نام و نام خانوادگی',
                type: TextInputType.text,
                controller: NewMember.nameControll,
              ),
              MyTextField(
                name: 'نام پدر',
                type: TextInputType.text,
                controller: NewMember.fatherNameControll,
              ),
              MyTextField(
                name: 'کد ملی',
                type: TextInputType.number,
                controller: NewMember.nationalCodeControll,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MyRadio(
                    groupValue: NewMember.payMethod,
                    onChanged: (value) {
                      setState(() {
                        NewMember.payMethod = value!;
                      });
                    },
                    value: 1,
                    text: 'نقد',
                  ),
                  MyRadio(
                    groupValue: NewMember.payMethod,
                    onChanged: (value) {
                      setState(() {
                        NewMember.payMethod = value!;
                      });
                    },
                    value: 2,
                    text: 'اقساط',
                  ),
                ],
              ),
              MyTextField(
                name: 'مبلغ شهریه',
                type: TextInputType.number,
                controller: NewMember.amountControll,
              ),
              MyTextField(
                name: 'نام مربی',
                type: TextInputType.text,
                controller: NewMember.coachController,
              ),
              MyTextField(
                name: 'رشته',
                type: TextInputType.text,
                controller: NewMember.fieldController,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MyRadio(
                    groupValue: NewMember.groupId,
                    onChanged: (value) {
                      setState(() {
                        NewMember.groupId = value!;
                      });
                    },
                    value: 1,
                    text: 'خانم',
                  ),
                  MyRadio(
                    groupValue: NewMember.groupId,
                    onChanged: (value) {
                      setState(() {
                        NewMember.groupId = value!;
                      });
                    },
                    value: 2,
                    text: 'آقا',
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: OutlinedButton(
                      onPressed: () async {
                        var pickedDate = await showPersianDatePicker(
                            context: context,
                            initialDate: Jalali.now(),
                            firstDate: Jalali(1402),
                            lastDate: Jalali(1499));
                        setState(() {
                          String year = pickedDate!.year.toString();
                          //
                          String month = pickedDate.month.toString().length == 1
                              ? '0${pickedDate.month.toString()}'
                              : pickedDate.month.toString();
                          //
                          String day = pickedDate.day.toString().length == 1
                              ? '0${pickedDate.day.toString()}'
                              : pickedDate.day.toString();
                          //
                          NewMember.date = '$year/$month/$day';
                        });
                      },
                      child: Text(
                        NewMember.date,
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: const Text(":پرداخت شهریه"),
              ),
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    CheckboxListTile(
                      value: NewMember.farvardin,
                      title: Text('فروردین'),
                      onChanged: (bool? value) {
                        setState(() {
                          NewMember.farvardin = value!;
                          print(value);
                        });
                      },
                    ),
                    CheckboxListTile(
                      value: NewMember.ordibehesht,
                      title: Text('اردیبهشت'),
                      onChanged: (bool? value) {
                        setState(() {
                          NewMember.ordibehesht = value!;
                          print(value);
                        });
                      },
                    ),
                    CheckboxListTile(
                      value: NewMember.khordad,
                      title: Text('خرداد'),
                      onChanged: (bool? value) {
                        setState(() {
                          NewMember.khordad = value!;
                          print(value);
                        });
                      },
                    ),
                    CheckboxListTile(
                      value: NewMember.tir,
                      title: Text('تیر'),
                      onChanged: (bool? value) {
                        setState(() {
                          NewMember.tir = value!;
                          print(value);
                        });
                      },
                    ),
                    CheckboxListTile(
                      value: NewMember.mordad,
                      title: Text('مرداد'),
                      onChanged: (bool? value) {
                        setState(() {
                          NewMember.mordad = value!;
                          print(value);
                        });
                      },
                    ),
                    CheckboxListTile(
                      value: NewMember.shahrivar,
                      title: Text('شهریور'),
                      onChanged: (bool? value) {
                        setState(() {
                          NewMember.shahrivar = value!;
                          print(value);
                        });
                      },
                    ),
                    CheckboxListTile(
                      value: NewMember.mehr,
                      title: Text('مهر'),
                      onChanged: (bool? value) {
                        setState(() {
                          NewMember.mehr = value!;
                          print(value);
                        });
                      },
                    ),
                    CheckboxListTile(
                      value: NewMember.aban,
                      title: Text('آبان'),
                      onChanged: (bool? value) {
                        setState(() {
                          NewMember.aban = value!;
                          print(value);
                        });
                      },
                    ),
                    CheckboxListTile(
                      value: NewMember.azar,
                      title: Text('آذر'),
                      onChanged: (bool? value) {
                        setState(() {
                          NewMember.azar = value!;
                          print(value);
                        });
                      },
                    ),
                    CheckboxListTile(
                      value: NewMember.dey,
                      title: Text('دی'),
                      onChanged: (bool? value) {
                        setState(() {
                          NewMember.dey = value!;
                          print(value);
                        });
                      },
                    ),
                    CheckboxListTile(
                      value: NewMember.bahman,
                      title: Text('بهمن'),
                      onChanged: (bool? value) {
                        setState(() {
                          NewMember.bahman = value!;
                          print(value);
                        });
                      },
                    ),
                    CheckboxListTile(
                      value: NewMember.esphasnd,
                      title: Text('اسفند'),
                      onChanged: (bool? value) {
                        setState(() {
                          NewMember.esphasnd = value!;
                          print(value);
                        });
                      },
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 20),
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Users item = Users(
                      id: Random().nextInt(99999),
                      name: NewMember.nameControll.text,
                      nationalCode: NewMember.nationalCodeControll.text,
                      fatherName: NewMember.fatherNameControll.text,
                      date: NewMember.date,
                      gender: NewMember.groupId == 1 ? true : false,
                      amount: NewMember.amountControll.text,
                      payment_method: NewMember.payMethod == 1 ? true : false,
                      coach: NewMember.coachController.text,
                      field: NewMember.fieldController.text,
                      farvardin: NewMember.farvardin,
                      ordibehesht: NewMember.ordibehesht,
                      aban: NewMember.aban,
                      azar: NewMember.azar,
                      bahman: NewMember.bahman,
                      dey: NewMember.dey,
                      esphasnd: NewMember.esphasnd,
                      khordad: NewMember.khordad,
                      mehr: NewMember.mehr,
                      mordad: NewMember.mordad,
                      shahrivar: NewMember.shahrivar,
                      tir: NewMember.tir,
                    );
                    if (NewMember.isEditing) {
                      int index = 0;
                      for (int i = 0; i < hiveBox.values.length; i++) {
                        if (hiveBox.values.elementAt(i).id == NewMember.id) {
                          index = i;
                        }
                      }
                      hiveBox.putAt(index, item);
                      MyApp.getData();
                    } else {
                      // MainScreen.users.add(item);
                      hiveBox.add(item);
                    }

                    Navigator.pop(context);
                  },
                  child: Text(NewMember.isEditing ? "ویرایش" : "ثبت نام"),
                ),
              )
            ],
          ),
        ]),
      )),
    );
  }
}

class MyRadio extends StatelessWidget {
  final int value;
  final int groupValue;
  final Function(int?) onChanged;
  final String text;

  const MyRadio({
    Key? key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Radio(
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
          activeColor: Colors.black,
        ),
        Text(text),
      ],
    );
  }
}

class MyRadioPayment extends StatelessWidget {
  final int value;
  final int groupValue;
  final Function(int?) onChanged;
  final String text;

  const MyRadioPayment({
    Key? key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Radio(
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
          activeColor: Colors.black,
        ),
        Text(text),
      ],
    );
  }
}

class MyTextField extends StatelessWidget {
  final String name;
  final TextInputType type;
  final TextEditingController controller;
  const MyTextField({
    Key? key,
    required this.name,
    required this.type,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: TextField(
        textAlign: TextAlign.right,
        keyboardType: type,
        controller: controller,
        decoration: InputDecoration(
            hintText: name,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
      ),
    );
  }
}

class CheckBoxMonth extends StatefulWidget {
  String monthName;
  bool variableName;

  CheckBoxMonth({
    Key? key,
    required this.monthName,
    required this.variableName,
  }) : super(key: key);

  @override
  State<CheckBoxMonth> createState() => _CheckBoxMonthState();
}

class _CheckBoxMonthState extends State<CheckBoxMonth> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: widget.variableName,
      title: Text(widget.monthName),
      onChanged: (bool? value) {
        setState(() {
          widget.variableName = value!;
          print(value);
        });
      },
    );
  }
}
