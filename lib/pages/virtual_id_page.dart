import 'package:flutter/material.dart';

class VirtualIdPage extends StatelessWidget {
  const VirtualIdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Virtual ID")),
      body: const Center(
        child: Text("Generated Virtual ID: VID-2026-001",
            style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
