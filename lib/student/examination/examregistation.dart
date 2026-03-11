import 'package:flutter/material.dart';

class ExamSchedulePage extends StatefulWidget {
  const ExamSchedulePage({super.key});

  @override
  State<ExamSchedulePage> createState() => _ExamSchedulePageState();
}

class _ExamSchedulePageState extends State<ExamSchedulePage> {

  bool exam1Open = true;
  bool exam2Open = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0a1230),

      appBar: AppBar(
        backgroundColor: const Color(0xff0a1230),
        elevation: 0,
        title: const Text(
          "Exam List & Schedule",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            examCard(
              "Mid Term Examination 2025",
              "01 oct 2025 - 30 oct 2025",
              true,
              exam1Open,
                  () {
                setState(() {
                  exam1Open = !exam1Open;
                });
              },
            ),

            const SizedBox(height: 20),

            examCard(
              "Mid Term Examination II 2025",
              "31 oct 2025 - 30 nov 2025",
              false,
              exam2Open,
                  () {
                setState(() {
                  exam2Open = !exam2Open;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget examCard(
      String title,
      String date,
      bool registered,
      bool open,
      VoidCallback onTap) {

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xff3c4566),
        borderRadius: BorderRadius.circular(12),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// HEADER
          ListTile(
            title: Text(
              title,
              style: const TextStyle(
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

                  child: Text(
                    date,
                    style: const TextStyle(
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

            onTap: onTap,
          ),

          if (open)
            Padding(
              padding: const EdgeInsets.all(16),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const Text(
                    "Description: N/A",
                    style: TextStyle(color: Colors.white70),
                  ),

                  const SizedBox(height: 10),

                  /// PAPER SCHEDULE
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      const Row(
                        children: [
                          Icon(Icons.calendar_month,
                              color: Colors.white70, size: 18),
                          SizedBox(width: 6),
                          Text(
                            "Paper Schedule",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),

                      Row(
                        children: [

                          Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Icon(
                              Icons.print,
                              size: 18,
                              color: Colors.white,
                            ),
                          ),

                          const SizedBox(width: 8),

                          Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Icon(
                              Icons.picture_as_pdf,
                              size: 18,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),

                  const SizedBox(height: 15),

                  /// TABLE HEADER
                  Container(
                    padding: const EdgeInsets.all(10),
                    color: const Color(0xff2f3756),

                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Text("Subject",
                            style: TextStyle(color: Colors.white)),

                        Text("Date",
                            style: TextStyle(color: Colors.white)),

                        Text("Time",
                            style: TextStyle(color: Colors.white)),

                        Text("Venue",
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),

                  /// TABLE ROW
                  Container(
                    padding: const EdgeInsets.all(10),

                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        SizedBox(
                          width: 80,
                          child: Text(
                            "Cost Accounting Methods",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),

                        Text(
                          "14 Oct 2025",
                          style: TextStyle(color: Colors.white),
                        ),

                        Text(
                          "9:00 AM - 12:00 PM",
                          style: TextStyle(color: Colors.white),
                        ),

                        Text(
                          "Room 102",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 15),

                  /// BUTTON
                  Container(
                    width: 180,
                    height: 40,

                    decoration: BoxDecoration(
                      color: registered
                          ? Colors.green
                          : const Color(0xff2ea44f),
                      borderRadius: BorderRadius.circular(8),
                    ),

                    child: Center(
                      child: Text(
                        registered
                            ? "Already Registered"
                            : "REGISTER NOW",

                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
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
