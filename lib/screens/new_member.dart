import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_gym/models/users.dart';
import 'package:my_gym/screens/main_screen.dart';

class NewMember extends StatefulWidget {
  const NewMember({super.key});
  static int groupId = 0;
  static TextEditingController nameControll = TextEditingController();
  static TextEditingController fatherNameControll = TextEditingController();
  static TextEditingController nationalCodeControll = TextEditingController();

  @override
  State<NewMember> createState() => _NewMemberState();
}

class _NewMemberState extends State<NewMember> {
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
              const Text(
                "افزودن ورزشکار",
                style: TextStyle(fontSize: 18),
              ),
              const MyTextField(
                name: 'نام و نام خانوادگی',
                type: TextInputType.text,
                controller: NewMember.nameControll,
              ),
              const MyTextField(
                name: 'نام پدر',
                type: TextInputType.text,
                controller: NewMember.fatherNameControll,
              ),
              const MyTextField(
                name: 'کد ملی',
                type: TextInputType.number,
                controller: NewMember.nationalCodeControll,
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
                      onPressed: () {},
                      child: Text("تاریخ"),
                      // style: ButtonStyle(
                      //     backgroundColor:
                      //         MaterialStateProperty.all(Colors.blue.shade100)),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("ثبت نام"),
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
      padding: const EdgeInsets.only(top: 25),
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
