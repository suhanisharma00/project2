import 'package:flutter/material.dart';

class ScheduleClassPage extends StatelessWidget {
  const ScheduleClassPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Schedule Class")),
      body: const Center(
        child: Text(
          "Schedule Class Page",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

