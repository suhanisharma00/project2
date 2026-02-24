import 'package:flutter/material.dart';

class MentoredSectionsPage extends StatefulWidget {
  const MentoredSectionsPage({Key? key}) : super(key: key);

  @override
  State<MentoredSectionsPage> createState() => _MentoredSectionsPageState();
}

class _MentoredSectionsPageState extends State<MentoredSectionsPage> {
  bool isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0B1230),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const Text(
                "My Mentored Sections",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              /// DROPDOWN HEADER
              GestureDetector(
                onTap: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 18),
                  decoration: BoxDecoration(
                    color: const Color(0xff5E6A77),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.groups, color: Colors.white),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Text(
                          "Financial Accounting Basics",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Icon(
                        isExpanded
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),

              /// EXPANDED CONTENT
              if (isExpanded) ...[
                const SizedBox(height: 20),

                buildSchedulesCard(),

                const SizedBox(height: 25),

                buildStudentsCard(),
              ]
            ],
          ),
        ),
      ),
    );
  }

  // ==========================
  // SCHEDULES CARD
  // ==========================

  Widget buildSchedulesCard() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xff3A4266),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white24),
      ),
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            children: const [
              Icon(Icons.calendar_month, color: Colors.white),
              SizedBox(width: 10),
              Text(
                "Schedules",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),

          const SizedBox(height: 20),

          buildDayTile("Monday", "Principles of Accounting"),
          buildDayTile("Tuesday", "Financial Statements"),
          buildDayTile("Friday", "Principles of Accounting"),
        ],
      ),
    );
  }

  Widget buildDayTile(String day, String subject) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          day,
          style: const TextStyle(
            color: Color(0xff5C6BD8),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),

        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white24),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Principles of Accounting",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 6),
              Text(
                "9:00 AM - 11:00 AM",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 12),
              Chip(
                label: Text("Devansh Mehra"),
                backgroundColor: Color(0xff5E6A77),
                labelStyle: TextStyle(color: Colors.white),
              )
            ],
          ),
        ),

        const SizedBox(height: 20),
      ],
    );
  }

  // ==========================
  // STUDENTS CARD
  // ==========================

  Widget buildStudentsCard() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xff3A4266),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white24),
      ),
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            children: const [
              Icon(Icons.groups, color: Colors.white),
              SizedBox(width: 10),
              Text(
                "Students",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),

          const SizedBox(height: 20),

          buildStudentRow("1", "Aarav Mehta", "25IIAS2UG102"),
          buildStudentRow("2", "Anurag Singh", "25IIAS010"),
          buildStudentRow("3", "Mr Singh", "25IIAS013"),
        ],
      ),
    );
  }

  Widget buildStudentRow(String index, String name, String roll) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          SizedBox(
            width: 25,
            child: Text(index,
                style: const TextStyle(color: Colors.white, fontSize: 16)),
          ),

          const SizedBox(width: 10),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      decoration: TextDecoration.underline),
                ),
                const SizedBox(height: 5),
                Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Text(
                    "Active",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),

          const SizedBox(width: 10),

          Text(
            roll,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),

          const SizedBox(width: 10),

          Container(
            padding:
            const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xff5E6A77),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text(
              "REMARKS",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
