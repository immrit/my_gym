import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_gym/main.dart';
import 'package:my_gym/models/users.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

class NewMember extends StatefulWidget {
  const NewMember({super.key});
  static int groupId = 0;
  static int payMethod = 0;
  static TextEditingController nameControll = TextEditingController();
  static TextEditingController fatherNameControll = TextEditingController();
  static TextEditingController nationalCodeControll = TextEditingController();
  static TextEditingController amountControll = TextEditingController();
  static bool isEditing = false;
  static int id = 0;
  static String date = "تاریخ";
  @override
  State<NewMember> createState() => _NewMemberState();
}

class _NewMemberState extends State<NewMember> {
  Box<Users> hiveBox = Hive.box('users');
  @override
  Widget build(BuildContext context) {
    print(NewMember.id);
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
              SizedBox(
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
                        payment_method:
                            NewMember.payMethod == 1 ? true : false);
                    if (NewMember.isEditing) {
                      int index = 0;
                      for (int i = 0; i < hiveBox.values.length; i++) {
                        if (hiveBox.values.elementAt(i).id == NewMember.id) {
                          index = i;
                        }
                      }
                      print(index);
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
