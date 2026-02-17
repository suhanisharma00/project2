import 'package:flutter/material.dart';

class Assigments extends StatelessWidget {
  const Assigments({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B1230),
      appBar: AppBar(
        backgroundColor: const Color(0xFF3E4468),
        title: const Row(
          children: [
            Icon(Icons.description_outlined),
            SizedBox(width: 10),
            Text("Assignments"),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            // 🔹 TOP CARD
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF3E4468),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const Text(
                    "Select Subject/Class/Section",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 15),

                  // 🔹 DROPDOWN
                  DropdownButtonFormField<String>(
                    dropdownColor: const Color(0xFF3E4468),
                    decoration: InputDecoration(
                      hintText: "Select Subject/Class/Section",
                      hintStyle:
                      const TextStyle(color: Colors.white54),
                      filled: true,
                      fillColor: Colors.grey.shade600,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    icon: const Icon(Icons.keyboard_arrow_down,
                        color: Colors.white),
                    items: const [
                      DropdownMenuItem(
                          value: "1", child: Text("Schedule 1")),
                      DropdownMenuItem(
                          value: "2", child: Text("Schedule 2")),
                    ],
                    onChanged: (value) {},
                  ),

                  const SizedBox(height: 20),

                  // 🔹 GREEN UPLOAD BUTTON
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade800,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {},
                      icon: const Icon(Icons.add),
                      label: const Text(
                        "Upload New",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // 🔹 MESSAGE CARD
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(40),
              decoration: BoxDecoration(
                color: const Color(0xFF3E4468),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: const [

                  Icon(
                    Icons.arrow_upward,
                    size: 80,
                    color: Colors.white70,
                  ),

                  SizedBox(height: 20),

                  Text(
                    "Please select a schedule above to view assignment.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
