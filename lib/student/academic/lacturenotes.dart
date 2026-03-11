import 'package:flutter/material.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {

  bool open = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0a1230),

      appBar: AppBar(
        backgroundColor: const Color(0xff0a1230),
        elevation: 0,
        title: const Text(
          "Notes for Cost Analysis and Management - A",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            /// SUBJECT CARD
            Container(
              decoration: BoxDecoration(
                color: const Color(0xff3c4566),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Column(
                children: [

                  /// DROPDOWN HEADER
                  ListTile(
                    title: const Text(
                      "Principles of Accounting",
                      style: TextStyle(
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

                    onTap: () {
                      setState(() {
                        open = !open;
                      });
                    },
                  ),

                  /// NOTE CARD
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

                          /// TITLE
                          Row(
                            children: const [

                              Icon(Icons.description,
                                  color: Colors.white),

                              SizedBox(width: 8),

                              Text(
                                "Cloud Computing",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),

                          const SizedBox(height: 15),

                          /// DATE
                          Row(
                            children: const [

                              Icon(Icons.calendar_month,
                                  color: Colors.white70,
                                  size: 20),

                              SizedBox(width: 8),

                              Text(
                                "Uploaded: 09 Oct, 2025",
                                style: TextStyle(
                                    color: Colors.white70),
                              )
                            ],
                          ),

                          const SizedBox(height: 10),

                          /// UPLOADED BY
                          Row(
                            children: const [

                              Icon(Icons.person,
                                  color: Colors.white70,
                                  size: 20),

                              SizedBox(width: 8),

                              Text(
                                "Uploaded by: Devansh Mehra",
                                style: TextStyle(
                                    color: Colors.white70),
                              )
                            ],
                          ),

                          const SizedBox(height: 20),

                          const Text(
                            "Details of Cloud computing",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16),
                          ),

                          const SizedBox(height: 20),

                          /// VIEW / DOWNLOAD BUTTON
                          Container(
                            width: double.infinity,
                            height: 50,

                            decoration: BoxDecoration(
                              color: const Color(0xff6b7685),
                              borderRadius: BorderRadius.circular(12),
                            ),

                            child: const Center(
                              child: Text(
                                "VIEW / DOWNLOAD",
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
            )
          ],
        ),
      ),
    );
  }
}
