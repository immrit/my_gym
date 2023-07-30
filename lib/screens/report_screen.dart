import 'package:flutter/material.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20, right: 20),
                child: Text(
                  "آمار اطلاعاتی باشگاه",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              InfoItem(text: "   :ثبت نام امروز", number: "0"),
              InfoItem(text: "   :ثبت نام این ماه", number: "0"),
              InfoItem(text: "   :ثبت نام امسال", number: "0")
            ],
          ),
        ),
      ),
    );
  }
}

class InfoItem extends StatelessWidget {
  final String text;
  final String number;

  const InfoItem({
    super.key,
    required this.text,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, right: 20),
      child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        Text(number),
        Text(text),
      ]),
    );
  }
}
