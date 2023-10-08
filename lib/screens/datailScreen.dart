import 'package:flutter/material.dart';

import 'package:my_gym/main.dart';
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
      body: ListView(
        children: [
          SizedBox(
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
                      Text(
                          " ${MainScreen.users[index].name}  :نام و نام خانوادگی"),
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
                      child: Text(
                          " ${MainScreen.users[index].amount}  :مبلغ شهریه"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: Text(
                          "شیوه پرداخت:   ${MainScreen.users[index].payment_method ? "نقد" : "اقساط"}"),
                    )
                  ],
                ),
                //
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child:
                          Text(" ${MainScreen.users[index].coach}  :نام مربی"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: Text(
                          "رشته ورزشی:   ${MainScreen.users[index].field}"),
                    )
                  ],
                ),
                //
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Text(" ${MainScreen.users[index].date}  :تاریخ عضویت"),
                ),

                Container(
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(top: 25, right: 50),
                  child: Text("  :وضعیت پرداخت شهریه"),
                ),

                month_pay(
                    context, "فروردین", MainScreen.users[index].farvardin),

                month_pay(
                    context, "اردیبهشت", MainScreen.users[index].ordibehesht),

                month_pay(context, "خرداد", MainScreen.users[index].khordad),

                month_pay(context, "تیر", MainScreen.users[index].tir),

                month_pay(context, "مرداد", MainScreen.users[index].mordad),

                month_pay(context, "شهریور", MainScreen.users[index].shahrivar),

                month_pay(context, "مهر", MainScreen.users[index].mehr),

                month_pay(context, "آبان", MainScreen.users[index].aban),

                month_pay(context, "آذر", MainScreen.users[index].azar),
                month_pay(context, "دی", MainScreen.users[index].dey),
                month_pay(context, "بهمن", MainScreen.users[index].bahman),
                month_pay(context, "اسفند", MainScreen.users[index].esphasnd),
                Padding(
                  padding: const EdgeInsets.only(top: 50, bottom: 20),
                  child: SizedBox(
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
        ],
      ),
    );
  }

  Widget month_pay(BuildContext context, String monthName, bool month) {
    return Container(
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.only(top: 25, right: 50),
      child: Text(
          "$monthName:   ${month == true ? "پرداخت شده" : "پرداخت نشده"}  "),
    );
  }
}
