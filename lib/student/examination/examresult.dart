import 'package:flutter/material.dart';

class RegisteredExamPage extends StatefulWidget {
  const RegisteredExamPage({super.key});

  @override
  State<RegisteredExamPage> createState() => _RegisteredExamPageState();
}

class _RegisteredExamPageState extends State<RegisteredExamPage> {

  bool open = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0a1230),

      appBar: AppBar(
        backgroundColor: const Color(0xff0a1230),
        elevation: 0,
        title: const Text(
          "My Registered Exam",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xff3c4566),
            borderRadius: BorderRadius.circular(12),
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// HEADER
              ListTile(
                title: const Text(
                  "Mid Term Examination 2025",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),

                subtitle: const Text(
                  "Written",
                  style: TextStyle(color: Colors.white70),
                ),

                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),

                      decoration: BoxDecoration(
                        color: const Color(0xff5f6a7a),
                        borderRadius: BorderRadius.circular(8),
                      ),

                      child: const Text(
                        "01 oct 2025 - 30 oct 2025",
                        style: TextStyle(
                            color: Colors.white, fontSize: 12),
                      ),
                    ),

                    const SizedBox(height: 5),

                    Icon(
                      open
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: Colors.white,
                    ),
                  ],
                ),

                onTap: () {
                  setState(() {
                    open = !open;
                  });
                },
              ),

              /// DETAILS
              if (open)
                Padding(
                  padding: const EdgeInsets.all(16),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      const Text(
                        "Admit Card Details",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),

                      const SizedBox(height: 10),

                      const Text(
                        "Student Name:  Nisha Rao",
                        style: TextStyle(color: Colors.white70),
                      ),

                      const SizedBox(height: 6),

                      const Text(
                        "Roll No:  25IIAS2UG103",
                        style: TextStyle(color: Colors.white70),
                      ),

                      const SizedBox(height: 6),

                      const Text(
                        "Class:  Cost Analysis and Management",
                        style: TextStyle(color: Colors.white70),
                      ),

                      const SizedBox(height: 6),

                      const Text(
                        "Section  A",
                        style: TextStyle(color: Colors.white70),
                      ),

                      const SizedBox(height: 20),

                      /// PAPER SCHEDULE
                      const Row(
                        children: [

                          Icon(Icons.calendar_month,
                              color: Colors.white70,
                              size: 18),

                          SizedBox(width: 6),

                          Text(
                            "Paper Schedule",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),

                      const SizedBox(height: 15),

                      /// TABLE HEADER
                      Container(
                        padding: const EdgeInsets.all(10),
                        color: const Color(0xff2f3756),

                        child: const Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,

                          children: [

                            Text("Subject",
                                style: TextStyle(
                                    color: Colors.white)),

                            Text("Date",
                                style: TextStyle(
                                    color: Colors.white)),

                            Text("Time",
                                style: TextStyle(
                                    color: Colors.white)),

                            Text("Venue",
                                style: TextStyle(
                                    color: Colors.white)),
                          ],
                        ),
                      ),

                      /// TABLE ROW
                      Container(
                        padding: const EdgeInsets.all(10),

                        child: const Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,

                          children: [

                            SizedBox(
                              width: 80,
                              child: Text(
                                "Cost Accounting Methods",
                                style: TextStyle(
                                    color: Colors.white),
                              ),
                            ),

                            Text(
                              "14 Oct 2025",
                              style: TextStyle(
                                  color: Colors.white),
                            ),

                            Text(
                              "9:00 AM - 12:00 PM",
                              style: TextStyle(
                                  color: Colors.white),
                            ),

                            Text(
                              "Room 102",
                              style: TextStyle(
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),

                      /// PRINT BUTTON
                      Container(
                        width: 200,
                        height: 40,

                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(8),
                        ),

                        child: const Row(
                          mainAxisAlignment:
                          MainAxisAlignment.center,

                          children: [

                            Icon(Icons.print,
                                color: Colors.white,
                                size: 18),

                            SizedBox(width: 8),

                            Text(
                              "PRINT ADMIT CARD",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
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
      ),
    );
  }
}
