import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_gym/models/users.dart';
import 'package:my_gym/screens/main_screen.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UsersAdapter());
  await Hive.openBox<Users>('users');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static void getData() {
    Box<Users> hiveBox = Hive.box('users');
    MainScreen.users.clear();
    for (var value in hiveBox.values) {
      MainScreen.users.add(value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Gym',
      theme: ThemeData(
        splashColor: Colors.transparent,
        fontFamily: 'iran',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MainPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
