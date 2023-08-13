import 'package:flutter/material.dart';
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
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (c) => const NewMember()))
              .then((value) {
            setState(() {});
          }),
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
                // const Spacer(),
                // const Text("اطلاعاتی موجود نیست"),
                // const Spacer(),
                Expanded(
                  child: ListView.builder(
                      itemCount: MainScreen.users.length,
                      itemBuilder: (context, index) {
                        return ListTileWidget(
                          index: index,
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
      child: GestureDetector(
        onLongPress: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Text(
                      textAlign: TextAlign.right,
                      "آیا از حذف این آیتم اطمینان دارید؟"),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text("خیر")),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            MainScreen.users.removeAt(widget.index);
                          });
                        },
                        child: Text("بله")),
                  ],
                );
              });
        },
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext b) => DatailScreen(
                    index: widget.index,
                  )));
        },
        child: Container(
          color: Colors.transparent,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(MainScreen.users[widget.index].name),
              Text(MainScreen.users[widget.index].nationalCode),
              const Divider(
                thickness: 1,
              )
            ],
          ),
        ),
      ),
    );
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
