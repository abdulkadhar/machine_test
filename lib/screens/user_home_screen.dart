import 'package:flutter/material.dart';
import 'package:machine_test/widgets/user-home-screen/profile_container.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({Key? key}) : super(key: key);

  @override
  _UserHomeScreenState createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            const ProfileContainer(
              id: 23,
              userName: "MohammedMohammedMohammed",
            ),
            const SizedBox(
              height: 10,
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text(
                "Log out",
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              onTap: () {},
            )
          ],
        ),
      ),
      appBar: AppBar(),
    );
  }
}
