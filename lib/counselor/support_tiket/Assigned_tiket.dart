import 'package:flutter/material.dart';

class AssignedTicketsPage extends StatelessWidget {
  const AssignedTicketsPage({super.key});

  static const Color bgColor = Color(0xff070f2b);
  static const Color cardColor = Color(0xff3b4366);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,

      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        title: const Row(
          children: [
            Icon(Icons.confirmation_num_outlined, size: 28),
            SizedBox(width: 10),
            Text(
              "Assigned Tickets",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            vertical: 40,
            horizontal: 20,
          ),
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(16),
          ),

          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              /// FOLDER ICON
              const Icon(
                Icons.folder_open,
                size: 90,
                color: Colors.white70,
              ),

              const SizedBox(height: 20),

              /// MAIN TEXT
              const Text(
                "No tickets currently assigned to you.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 10),

              /// DESCRIPTION
              const Text(
                "Once tickets are assigned, they will appear here for your review and action.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
