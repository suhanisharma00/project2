import 'package:flutter/material.dart';

class RemarksPage extends StatefulWidget {
  const RemarksPage({super.key});

  @override
  State<RemarksPage> createState() => _RemarksPageState();
}

class _RemarksPageState extends State<RemarksPage> {

  String? selectedRemark;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0B1230),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // ================= TITLE =================

              const Row(
                children: [

                  Icon(Icons.chat_bubble_outline,
                      color: Colors.white70),

                  SizedBox(width: 10),

                  Text(
                    "Remarks for Nisha Rao",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // ================= FILTER CARD =================

              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xff3A4266),
                  borderRadius: BorderRadius.circular(14),
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    const Row(
                      children: [

                        Icon(Icons.filter_alt,
                            color: Colors.white70),

                        SizedBox(width: 10),

                        Text(
                          "Filter Remarks",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),

                    const SizedBox(height: 15),

                    const Text(
                      "Filter by Remark Type",
                      style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16),
                    ),

                    const SizedBox(height: 10),

                    // ================= DROPDOWN =================

                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: const Color(0xff5E6A77),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          dropdownColor: const Color(0xff5E6A77),
                          value: selectedRemark,
                          hint: const Text(
                            "Select an option",
                            style: TextStyle(color: Colors.white70),
                          ),
                          icon: const Icon(Icons.arrow_drop_down,
                              color: Colors.white),

                          items: const [

                            DropdownMenuItem(
                              value: "Academic",
                              child: Text("Academic",
                                  style: TextStyle(color: Colors.white)),
                            ),

                            DropdownMenuItem(
                              value: "Discipline",
                              child: Text("Discipline",
                                  style: TextStyle(color: Colors.white)),
                            ),

                            DropdownMenuItem(
                              value: "Attendance",
                              child: Text("Attendance",
                                  style: TextStyle(color: Colors.white)),
                            ),

                          ],

                          onChanged: (value) {
                            setState(() {
                              selectedRemark = value;
                            });
                          },
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // ================= RESET BUTTON =================

                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      decoration: BoxDecoration(
                        color: const Color(0xff5E6A77),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          "RESET FILTERS",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1),
                        ),
                      ),
                    )
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // ================= REMARK HISTORY =================

              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xff3A4266),
                  borderRadius: BorderRadius.circular(14),
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    const Row(
                      children: [

                        Icon(Icons.list,
                            color: Colors.white70),

                        SizedBox(width: 10),

                        Text(
                          "Remark History",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      "View and manage all remarks for this student.",
                      style: TextStyle(color: Colors.white70),
                    ),

                    const SizedBox(height: 20),

                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xff5E6A77),
                        borderRadius: BorderRadius.circular(10),
                      ),

                      child: const Text(
                        "No remarks found for this student.",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
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
