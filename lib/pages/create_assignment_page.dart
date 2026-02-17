import 'package:flutter/material.dart';

class CreateAssignmentPage extends StatelessWidget {
  const CreateAssignmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Create Assignment")),
      body: const Center(
        child: Text(
          "Create Assignment Page",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
