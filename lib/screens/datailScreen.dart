import 'package:flutter/material.dart';
import 'package:my_gym/main.dart';
import 'package:my_gym/screens/main_screen.dart';
import 'package:my_gym/screens/new_member.dart';

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
    super.initState();
    index = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'جزییات اطلاعات',
          style: TextStyle(fontSize: 16),
        ),
        // actions: [
        //   /*
        //     Edite Action
        //   */
        //   IconButton(
        //       onPressed: () {
        //         NewMember.nameControll.text = MainScreen.users[index].name;
        //         NewMember.nationalCodeControll.text =
        //             MainScreen.users[index].nationalCode;
        //         NewMember.fatherNameControll.text =
        //             MainScreen.users[index].fatherName;
        //         NewMember.groupId = MainScreen.users[index].gender ? 1 : 2;
        //         NewMember.isEditing = true;
        //         NewMember.index = index;

        //         Navigator.of(context)
        //             .push(MaterialPageRoute(
        //                 builder: (context) => const NewMember()))
        //             .then((value) {
        //           MyApp.getData();
        //           setState(() {});
        //         });
        //       },
        //       icon: const Icon(Icons.edit))
        // ],
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            const CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS38DwDrD_4VaUHAYdbZIqC3TRmRWrUH4i98Vtjvi7SLeJ5btJFCc-aUmDwAzm6BXcT2vI&usqp=CAU'),
              maxRadius: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 35),
              child: Text(" ${MainScreen.users[index].id}  :کد پرسنلی"),
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
                  Text(" ${MainScreen.users[index].fatherName}  :نام پدر"),
                  Text(
                      "جنسیت:   ${MainScreen.users[index].gender ? "خانم" : "آقا"}"),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child:
                      Text(" ${MainScreen.users[index].amount}  :مبلغ شهریه"),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Text(
                      "شیوه پرداخت:   ${MainScreen.users[index].payment_method ? "نقد" : "اقساط"}"),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Text(" ${MainScreen.users[index].date}  :تاریخ عضویت"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 180),
              child: Container(
                  width: 260,
                  child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          MyApp.getData();
                        });
                        Navigator.of(context).pop();
                      },
                      child: const Text("بازگشت"))),
            )
          ],
        ),
      ),
    );
  }
}
