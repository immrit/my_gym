import 'package:flutter/material.dart';

import 'package:my_gym/screens/main_screen.dart';

class DatailScreen extends StatefulWidget {
  final int index;
  const DatailScreen({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  _DatailScreenState createState() => _DatailScreenState();
}

class _DatailScreenState extends State<DatailScreen> {
  int index = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    index = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS38DwDrD_4VaUHAYdbZIqC3TRmRWrUH4i98Vtjvi7SLeJ5btJFCc-aUmDwAzm6BXcT2vI&usqp=CAU'),
              maxRadius: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 35),
              child: Text(" ${MainScreen.users[this.index].id}  :کد پرسنلی"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(" ${MainScreen.users[index].nationalCode}  :کدملی"),
                  Text(" ${MainScreen.users[index].name}  :نام و نام خانوادگی"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(" ${MainScreen.users[this.index].fatherName}  :نام پدر"),
                  Text(
                      "جنسیت:   ${MainScreen.users[this.index].gender ? false == "خانم" : "آقا"}"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child:
                  Text(" ${MainScreen.users[this.index].date}  :تازیخ عضویت"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 220),
              child: SizedBox(
                  width: 300,
                  child: ElevatedButton(
                      // style: ButtonStyle(
                      //     textStyle: MaterialStateProperty.resolveWith(
                      //         (states) => TextStyle(color: Colors.amber)),
                      //     backgroundColor: MaterialStateColor.resolveWith(
                      //         (states) => Colors.black)),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("بازگشت"))),
            )
          ],
        ),
      ),
    );
  }
}
