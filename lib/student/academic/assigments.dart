import 'package:flutter/material.dart';

class AssignmentPage extends StatefulWidget {
  const AssignmentPage({super.key});

  @override
  State<AssignmentPage> createState() => _AssignmentPageState();
}

class _AssignmentPageState extends State<AssignmentPage> {

  bool open1 = true;
  bool open2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0a1230),

      appBar: AppBar(
        backgroundColor: const Color(0xff0a1230),
        elevation: 0,
        title: const Text(
          "Assignments for Cost Analysis and Management - A",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            /// SUBJECT 1
            subjectCard(
              "Principles of Accounting",
              open1,
                  () {
                setState(() {
                  open1 = !open1;
                });
              },
            ),

            const SizedBox(height: 20),

            /// SUBJECT 2
            subjectCard(
              "Financial Statements",
              open2,
                  () {
                setState(() {
                  open2 = !open2;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget subjectCard(String title, bool open, VoidCallback onTap) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xff3c4566),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [

          /// DROPDOWN HEADER
          ListTile(
            title: Text(
              title,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            trailing: Icon(
              open
                  ? Icons.keyboard_arrow_up
                  : Icons.keyboard_arrow_down,
              color: Colors.white,
            ),
            onTap: onTap,
          ),

          /// ASSIGNMENT CARD
          if (open)
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),

              decoration: BoxDecoration(
                color: const Color(0xff46507a),
                borderRadius: BorderRadius.circular(14),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const Text(
                    "Assignment 1",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    "Due Date: 30 Nov, 2025",
                    style: TextStyle(color: Colors.white70),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    "Uploaded by: Devansh Mehra",
                    style: TextStyle(color: Colors.white70),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    "This is assignment 1",
                    style: TextStyle(color: Colors.white70),
                  ),

                  const SizedBox(height: 20),

                  /// VIEW BUTTON
                  Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color(0xff6b7685),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Text(
                        "VIEW ASSIGNMENT",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// STATUS
                  Container(
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xff6b7685),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Text(
                        "Pending Submission",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    "Upload File (Optional)",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 10),

                  /// FILE PICKER
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                      color: const Color(0xff5c6773),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: const [

                        Expanded(
                          child: Center(
                            child: Text(
                              "Choose File",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),

                        VerticalDivider(color: Colors.white),

                        Expanded(
                          child: Center(
                            child: Text(
                              "No File Chosen",
                              style: TextStyle(color: Colors.white70),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    "Type Answer (Optional)",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 10),

                  /// ANSWER BOX
                  Container(
                    height: 120,
                    decoration: BoxDecoration(
                      color: const Color(0xff5c6773),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// SUBMIT BUTTON
                  Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color(0xff3e63dd),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Text(
                        "SUBMIT ASSIGNMENT",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                  )
                ],
              ),
            )
        ],
      ),
    );
  }
}
