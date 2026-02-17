import 'package:flutter/material.dart';

class QuickActionsPage extends StatelessWidget {
  const QuickActionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Quick Actions")),
      body: const Center(
        child: Text("Quick Actions Here"),
      ),
    );
  }
}
