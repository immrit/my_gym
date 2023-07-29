import 'package:flutter/material.dart';
import 'package:my_gym/screens/report_screen.dart';
import 'package:searchbar_animation/searchbar_animation.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
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
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: const Text(
                      "باشگاه من",
                      style: TextStyle(
                          fontFamily: "iran",
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
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
