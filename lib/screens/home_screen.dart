import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pet_feeder/utils/colors.dart';
import 'package:pet_feeder/widgets/drawer_widget.dart';
import 'package:pet_feeder/widgets/text_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
            Image.asset(
              'assets/images/Capture.png',
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
}
