  import 'package:flutter/material.dart';
  import 'profile.dart';

  class AppNavigationDrawer extends StatelessWidget {
    const AppNavigationDrawer({super.key});

    @override
    Widget build(BuildContext context) {
      return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text("Menu", style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ListTile(
              title: const Text("Home"),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
    title: Text("Profile"),
    onTap: () => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProfilePage()),
    ),
  ),

          ],
        ),
      );
    }
  }
