import 'package:flutter/material.dart';
import 'package:my_gym/utils/calculate.dart';
import 'package:my_gym/widgets/chart.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 20, right: 20),
                child: Text(
                  "آمار اطلاعاتی باشگاه",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              InfoItem(
                  text: "   :دریافتی های امروز",
                  number: Calculate.mToday().toString()),
              InfoItem(
                  text: "   :دریافتی های این ماه",
                  number: Calculate.mMonth().toString()),
              InfoItem(
                  text: "   :دریافتی های امسال",
                  number: Calculate.myear().toString()),
              Container(
                  width: double.infinity,
                  height: 350,
                  padding: EdgeInsets.only(top: 150),
                  child: BarChartWidget())
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
        Text("${number}  تومان", textDirection: TextDirection.rtl),
        Text(text),
      ]),
    );
  }
}
