import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pet_feeder/screens/alarm_screen.dart';
import 'package:pet_feeder/services/add_feed.dart';
import 'package:pet_feeder/utils/colors.dart';
import 'package:pet_feeder/widgets/drawer_widget.dart';
import 'package:pet_feeder/widgets/text_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int? _selectedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: primary,
        title: TextWidget(
          text: 'Pet Feeder',
          fontSize: 18,
          color: Colors.white,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextWidget(
              text: 'Feed Pet Now',
              fontSize: 18,
              color: primary,
              fontFamily: 'Bold',
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                showScheduleDialog();
              },
              child: Image.asset(
                'assets/images/Capture.png',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextWidget(
              text:
                  'Last Feed: ${DateFormat.yMMMd().add_jm().format(DateTime.now())}',
              fontSize: 14,
              color: Colors.black,
              fontFamily: 'Medium',
            ),
          ],
        ),
      ),
    );
  }

  showScheduleDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Select Amount'),
          content: StatefulBuilder(builder: (context, setState) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                RadioListTile<int>(
                  title: const Text('70 grams (appx.)'),
                  value: 70,
                  groupValue: _selectedValue,
                  onChanged: (int? value) {
                    setState(() {
                      _selectedValue = value;
                    });
                  },
                ),
                RadioListTile<int>(
                  title: const Text('105 grams (appx.)'),
                  value: 105,
                  groupValue: _selectedValue,
                  onChanged: (int? value) {
                    setState(() {
                      _selectedValue = value;
                    });
                  },
                ),
                RadioListTile<int>(
                  title: const Text('140 grams (appx.)'),
                  value: 140,
                  groupValue: _selectedValue,
                  onChanged: (int? value) {
                    setState(() {
                      _selectedValue = value;
                    });
                  },
                ),
                RadioListTile<int>(
                  title: const Text('175 grams (appx.)'),
                  value: 175,
                  groupValue: _selectedValue,
                  onChanged: (int? value) {
                    setState(() {
                      _selectedValue = value;
                    });
                  },
                ),
                RadioListTile<int>(
                  title: const Text('210 grams (appx.)'),
                  value: 210,
                  groupValue: _selectedValue,
                  onChanged: (int? value) {
                    setState(() {
                      _selectedValue = value;
                    });
                  },
                ),
              ],
            );
          }),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('CANCEL'),
            ),
            TextButton(
              onPressed: () {
                DateTime now = DateTime.now();
                String formattedTime =
                    DateFormat('HH:mm').format(now); // 24-hour format
                addFeed(_selectedValue, DateTime.now().year,
                    DateTime.now().month, DateTime.now().day, formattedTime);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const AlarmScreen()));
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
