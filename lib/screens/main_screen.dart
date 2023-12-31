import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_gym/main.dart';
import 'package:searchbar_animation/searchbar_animation.dart';
import 'package:my_gym/models/users.dart';
import 'package:my_gym/screens/new_member.dart';
import 'package:my_gym/screens/report_screen.dart';
import 'datailScreen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  static List<Users> users = [];

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    MyApp.getData();
    super.initState();
  }

  Box<Users> hiveBox = Hive.box('users');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            NewMember.isEditing = false;
            NewMember.nameControll.text = '';
            NewMember.fatherNameControll.text = '';
            NewMember.nationalCodeControll.text = '';
            NewMember.amountControll.text = '';
            NewMember.coachController.text = '';
            NewMember.fieldController.text = '';
            NewMember.date = 'تاریخ';
            NewMember.groupId = 0;
            NewMember.payMethod = 0;

            Navigator.of(context)
                .push(MaterialPageRoute(builder: (c) => const NewMember()))
                .then((value) {
              MyApp.getData();
              setState(() {});
            });
          },
          backgroundColor: Colors.black,
          child: const Icon(Icons.add, color: Colors.white),
        ),
        body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: SearchBarAnimation(
                          textEditingController: searchController,
                          isOriginalAnimation: false,
                          buttonWidget: const Icon(Icons.search),
                          secondaryButtonWidget: const Icon(Icons.close),
                          trailingWidget: const Icon(Icons.search),
                          hintText: "جستجو",
                          searchBoxWidth: 290,
                          textAlignToRight: true,
                          onFieldSubmitted: (String text) {
                            List<Users> result = hiveBox.values
                                .where((value) =>
                                    value.name.contains(text) ||
                                    value.nationalCode.contains(text))
                                .toList();

                            MainScreen.users.clear();
                            setState(() {
                              for (var value in result) {
                                MainScreen.users.add(value);
                              }
                            });
                          },
                          onCollapseComplete: () {
                            MyApp.getData();
                            searchController.clear();
                            setState(() {});
                          },
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Text(
                        "باشگاه من",
                        style: TextStyle(
                            fontFamily: "iran",
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: MainScreen.users.isEmpty
                      ? const Column(
                          children: [
                            Spacer(),
                            Text("اطلاعاتی موجود نیست"),
                            Spacer(),
                          ],
                        )
                      : ListView.builder(
                          reverse: false,
                          itemCount: MainScreen.users.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onLongPress: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        content: const Text(
                                            textAlign: TextAlign.right,
                                            "آیا از حذف این آیتم اطمینان دارید؟"),
                                        actions: [
                                          ElevatedButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text("خیر")),
                                          ElevatedButton(
                                              onPressed: () {
                                                //! Delete item
                                                setState(() {
                                                  // MainScreen.users
                                                  //     .removeAt(index);
                                                  hiveBox.deleteAt(index);
                                                  MyApp.getData();
                                                  Navigator.of(context).pop();
                                                });
                                              },
                                              child: const Text("بله")),
                                        ],
                                      );
                                    });
                              },
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext b) => DatailScreen(
                                          index: index,
                                        )));
                              },
                              child: ListTileWidget(
                                index: index,
                              ),
                            );
                          }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ListTileWidget extends StatefulWidget {
  final int index;

  const ListTileWidget({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<ListTileWidget> createState() => _ListTileWidgetState();
}

class _ListTileWidgetState extends State<ListTileWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(right: 25, left: 25, top: 10),
        child: Container(
          color: Colors.transparent,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Edite Action

              IconButton(
                  onPressed: () {
                    NewMember.date = MainScreen.users[widget.index].date;
                    NewMember.nameControll.text =
                        MainScreen.users[widget.index].name;
                    NewMember.nationalCodeControll.text =
                        MainScreen.users[widget.index].nationalCode;
                    NewMember.fatherNameControll.text =
                        MainScreen.users[widget.index].fatherName;
                    NewMember.amountControll.text =
                        MainScreen.users[widget.index].amount;
                    NewMember.groupId =
                        MainScreen.users[widget.index].gender ? 1 : 2;
                    NewMember.payMethod =
                        MainScreen.users[widget.index].payment_method ? 1 : 2;
                    NewMember.isEditing = true;
                    NewMember.id = MainScreen.users[widget.index].id;
                    NewMember.coachController.text =
                        MainScreen.users[widget.index].coach;
                    NewMember.fieldController.text =
                        MainScreen.users[widget.index].field;
                    NewMember.farvardin =
                        MainScreen.users[widget.index].farvardin;
                    NewMember.ordibehesht =
                        MainScreen.users[widget.index].ordibehesht;
                    NewMember.khordad = MainScreen.users[widget.index].khordad;
                    NewMember.tir = MainScreen.users[widget.index].tir;
                    NewMember.mordad = MainScreen.users[widget.index].mordad;
                    NewMember.shahrivar =
                        MainScreen.users[widget.index].shahrivar;
                    NewMember.mehr = MainScreen.users[widget.index].mehr;
                    NewMember.aban = MainScreen.users[widget.index].aban;
                    NewMember.azar = MainScreen.users[widget.index].azar;
                    NewMember.dey = MainScreen.users[widget.index].dey;
                    NewMember.bahman = MainScreen.users[widget.index].bahman;
                    NewMember.esphasnd =
                        MainScreen.users[widget.index].esphasnd;

                    Navigator.of(context)
                        .push(MaterialPageRoute(
                            builder: (context) => const NewMember()))
                        .then((value) {
                      MyApp.getData();
                      setState(() {});
                    });
                  },
                  icon: const Icon(Icons.edit)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(MainScreen.users[widget.index].name),
                  Text(MainScreen.users[widget.index].nationalCode),
                  const Divider(
                    thickness: 1,
                  )
                ],
              ),
            ],
          ),
        ));
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    const MainScreen(),
    const ReportScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: Container(
          margin: const EdgeInsets.only(bottom: 20, right: 50, left: 50),
          padding: const EdgeInsets.only(left: 30, right: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.black,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 5), // changes position of shadow
              ),
            ],
          ),
          child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            elevation: 0,
            backgroundColor: Colors.black,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white30,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.report), label: "report")
            ],
            onTap: _onItemTapped,
          ),
        ));
  }
}
