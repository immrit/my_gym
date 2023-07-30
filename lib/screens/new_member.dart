import 'package:flutter/material.dart';

class NewMember extends StatefulWidget {
  const NewMember({super.key});

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
              Text(
                "افزودن ورزشکار",
                style: TextStyle(fontSize: 18),
              ),
              MyTextField(
                name: 'نام و نام خانوادگی',
                type: TextInputType.text,
              ),
              MyTextField(
                name: 'نام پدر',
                type: TextInputType.text,
              ),
              MyTextField(
                name: 'کد ملی',
                type: TextInputType.number,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MyRadio(
                    groupValue: 1000,
                    onChanged: (value) {},
                    value: 0,
                    text: 'خانم',
                  ),
                  MyRadio(
                    groupValue: 1000,
                    onChanged: (value) {},
                    value: 1,
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
        Radio(value: value, groupValue: groupValue, onChanged: onChanged),
        Text(text),
      ],
    );
  }
}

class MyTextField extends StatelessWidget {
  final String name;
  final TextInputType type;
  const MyTextField({
    Key? key,
    required this.name,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: TextField(
        textAlign: TextAlign.right,
        keyboardType: type,
        decoration: InputDecoration(
            hintText: name,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
      ),
    );
  }
}
