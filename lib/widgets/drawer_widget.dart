import 'package:flutter/material.dart';
import 'package:pet_feeder/screens/add_pet_screen.dart';
import 'package:pet_feeder/screens/home_screen.dart';
import 'package:pet_feeder/screens/my_pets_screen.dart';
import 'package:pet_feeder/screens/schedule_feed.dart';
import 'package:pet_feeder/widgets/text_widget.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      child: Drawer(
        child: ListView(
          padding: const EdgeInsets.only(top: 0),
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.brown,
              ),
              accountEmail: TextWidget(
                  text: 'Capstone Project', fontSize: 8, color: Colors.white),
              accountName: TextWidget(
                text: 'Pet Feeder',
                fontSize: 14,
                color: Colors.white,
              ),
              currentAccountPicture: const Padding(
                padding: EdgeInsets.all(5.0),
                child: CircleAvatar(
                  minRadius: 50,
                  maxRadius: 50,
                  backgroundImage: AssetImage('assets/images/logo.png'),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.front_hand_outlined),
              title: TextWidget(
                text: 'Feed Pet',
                fontSize: 12,
                color: Colors.black,
                fontFamily: 'Bold',
              ),
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const HomeScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.av_timer_rounded),
              title: TextWidget(
                text: 'Schedule Feed',
                fontSize: 12,
                color: Colors.black,
                fontFamily: 'Bold',
              ),
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const ScheduleFeedScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.pets_outlined),
              title: TextWidget(
                text: 'My Pets',
                fontSize: 12,
                color: Colors.black,
                fontFamily: 'Bold',
              ),
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const MyPetsScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.add_box_outlined),
              title: TextWidget(
                text: 'Add Pet',
                fontSize: 12,
                color: Colors.black,
                fontFamily: 'Bold',
              ),
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const AddPetScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
