import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF2C3E50),
      child: ListView(
        children: const [
          SizedBox(height: 40),
          ListTile(
            title: Text("Menu",
                style: TextStyle(color: Colors.white)),
          )
        ],
      ),
    );
  }
}
