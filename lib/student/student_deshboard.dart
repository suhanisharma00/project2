import 'package:flutter/material.dart';
import 'package:project2/student/profile.dart';
import 'package:project2/student/viewvirtualidcard.dart';
import '../pages/ExploreEvents.dart';
import '../pages/LendingBooksPage.dart';
import '../pages/createnewsupportticket.dart';
import '../pages/librarybookpage.dart';
import '../pages/yoursupportticket.dart';
import '../pages/ MyRegisteredEvents.dart';
import 'TimeTable/customschedule.dart';
import 'TimeTable/weekschedule.dart';
import 'academic/assigments.dart';
import 'academic/lacturenotes.dart';
import 'attendance/leaveapplication.dart';
import 'attendance/viewattendance.dart';
import 'examination/admitcard.dart';
import 'examination/examregistation.dart';
import 'facultyremark.dart';
import 'feedetails.dart';

class StudentDashboard extends StatefulWidget {
  const StudentDashboard({Key? key}) : super(key: key);

  @override
  State<StudentDashboard> createState() => _StudentDashboardState();
}

class _StudentDashboardState extends State<StudentDashboard> {
  int currentIndex = 0;

  // Drawer expansion states
  bool isClassManagementExpanded = false;
  bool isSchedulesExpanded = false;
  bool isLibraryExpanded = false;
  bool isExamExpanded = false;
  bool isMaterialExpanded = false;
  bool isEventExpanded = false;
  bool isSupportExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B1220),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          color: Colors.white,
          child: Row(
            children: [
              const Icon(Icons.school, color: Colors.black),
              const SizedBox(width: 8),
              const Text(
                "EduPhin",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const SizedBox(width: 20),
              const Icon(Icons.person, color: Colors.grey),
              const SizedBox(width: 5),
              const Text("Devansh Mehra", style: TextStyle(color: Colors.black)),
              const SizedBox(width: 15),
              const Text("|", style: TextStyle(fontSize: 18, color: Colors.grey)),
              const SizedBox(width: 15),
              const Icon(Icons.apartment, color: Colors.grey),
              const SizedBox(width: 5),
              const Expanded(
                child: Text(
                  "Indian Institute of Applied Sciences (IIAS)",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Builder(builder: (context) {
                return IconButton(
                  icon: const Icon(Icons.more_vert, color: Colors.black),
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                );
              }),
            ],
          ),
        ),
      ),
      endDrawer: SizedBox(
        width: MediaQuery.of(context).size.width * 0.75,
        child: Drawer(
          backgroundColor: const Color(0xFF2C3E50),
          child: ListView(
            children: [
              const SizedBox(height: 40),
              const ListTile(
                leading: CircleAvatar(
                  radius: 22,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, color: Colors.blue),
                ),
                title: Text(
                  "Student Panel",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              const Divider(color: Colors.white24),
              buildDrawerItem(
                  icon: Icons.home,
                  title: "Home",
                  context: context,
                  onTap: () => Navigator.pop(context)),

              buildDrawerItem(
                  icon: Icons.person,
                  title: "My Profile",
                  context: context,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const StudentProfilePage(),
                      ),
                    );

                  }),
              buildDrawerItem(
                  icon: Icons.rate_review,
                  title: "Factaly Remark",
                  context: context,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RemarksPage(),
                      ),
                    );

                  }),

              Theme(
                data: Theme.of(context).copyWith(
                  dividerColor: Colors.transparent,
                ),
                child: ExpansionTile(
                  leading: const Icon(Icons.calendar_month, color: Colors.white70),
                  title: const Text(
                    "Time Table",
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: Icon(
                    isClassManagementExpanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: Colors.white,
                  ),
                  initiallyExpanded: isClassManagementExpanded,
                  onExpansionChanged: (value) {
                    setState(() {
                      isClassManagementExpanded = value;
                    });
                  },
                  children: [
                    ListTile(
                      leading: const Icon(Icons.book, color: Colors.white70),
                      title: const Text(
                        "Weekly Schedule",
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const TimetablePage()),
                        );

                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.menu_book_outlined,
                          color: Colors.white70),
                      title: const Text(
                        "Custom Schedule ",
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ClassSchedulePage()),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Theme(
                data: Theme.of(context).copyWith(
                  dividerColor: Colors.transparent,
                ),
                child: ExpansionTile(
                  leading: const Icon(Icons.fact_check, color: Colors.white),
                  title: const Text(
                    "Attendance",
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: Icon(
                    isSchedulesExpanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: Colors.white,
                  ),
                  initiallyExpanded: isSchedulesExpanded,
                  onExpansionChanged: (value) {
                    setState(() {
                      isSchedulesExpanded = value;
                    });
                  },
                  children: [
                    ListTile(
                      leading: const Icon(Icons.book, color: Colors.white70),
                      title: const Text(
                        "View Attendance",
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const AttendanceReportPage()),
                        );
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.menu_book_outlined,
                          color: Colors.white70),
                      title: const Text(
                        "Leave Application",
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const MyLeaveApplication()),
                        );
                      },
                    ),
                  ],
                ),
              ),

              Theme(
                data: Theme.of(context).copyWith(
                  dividerColor: Colors.transparent,
                ),
                child: ExpansionTile(
                  leading: const Icon(Icons.menu_book, color: Colors.white70),
                  title: const Text(
                    "Library Resources",
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: Icon(
                    isLibraryExpanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: Colors.white,
                  ),
                  initiallyExpanded: isLibraryExpanded,
                  onExpansionChanged: (value) {
                    setState(() {
                      isLibraryExpanded = value;
                    });
                  },
                  children: [
                    ListTile(
                      leading: const Icon(Icons.book, color: Colors.white70),
                      title: const Text(
                        "Available Books",
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const LibraryBooksPage()),
                        );
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.menu_book_outlined,
                          color: Colors.white70),
                      title: const Text(
                        "Borrowed Books",
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const MyLendingBooksPage()),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Theme(
                data: Theme.of(context).copyWith(
                  dividerColor: Colors.transparent,
                ),
                child: ExpansionTile(
                  leading: const Icon(Icons.edit_document, color: Colors.white70),
                  title: const Text(
                    "Examination",
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: Icon(
                    isExamExpanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: Colors.white,
                  ),
                  initiallyExpanded: isExamExpanded,
                  onExpansionChanged: (value) {
                    setState(() {
                      isExamExpanded = value;
                    });
                  },
                  children: [
                    ListTile(
                      leading: const Icon(Icons.book, color: Colors.white70),
                      title: const Text(
                        "Exam Registration",
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ExamSchedulePage()),
                        );
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.menu_book_outlined,
                          color: Colors.white70),
                      title: const Text(
                        "Admit Card",
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const RegisteredExamPage()),
                        );
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.menu_book_outlined,
                          color: Colors.white70),
                      title: const Text(
                        "Exam Results",
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const RegisteredExamPage()),
                        );
                      },
                    ),
                  ],
                ),
              ),
              buildDrawerItem(
                  icon: Icons.account_balance_wallet,
                  title: "Fee Detail",
                  context: context,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const StudentFeePage()),
                    );
                  }),
              Theme(
                data: Theme.of(context).copyWith(
                  dividerColor: Colors.transparent,
                ),
                child: ExpansionTile(
                  leading: const Icon(Icons.upload_file, color: Colors.white70),
                  title: const Text(
                    "Academic Material",
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: Icon(
                    isMaterialExpanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: Colors.white,
                  ),
                  initiallyExpanded: isMaterialExpanded,
                  onExpansionChanged: (value) {
                    setState(() {
                      isMaterialExpanded = value;
                    });
                  },
                  children: [
                    ListTile(
                      leading: const Icon(Icons.book, color: Colors.white70),
                      title: const Text(
                        "Lacture Notes",
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const NotesPage()),
                        );
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.menu_book_outlined,
                          color: Colors.white70),
                      title: const Text(
                        "Assigment",
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const AssignmentPage()),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Theme(
                data: Theme.of(context).copyWith(
                  dividerColor: Colors.transparent,
                ),
                child: ExpansionTile(
                  leading: const Icon(Icons.event, color: Colors.white70),
                  title: const Text(
                    "Event Managment",
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: Icon(
                    isEventExpanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: Colors.white,
                  ),
                  initiallyExpanded: isEventExpanded,
                  onExpansionChanged: (value) {
                    setState(() {
                      isEventExpanded = value;
                    });
                  },
                  children: [
                    ListTile(
                      leading: const Icon(Icons.book, color: Colors.white70),
                      title: const Text(
                        "All Event",
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ManageEventsPage()),
                        );
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.menu_book_outlined,
                          color: Colors.white70),
                      title: const Text(
                        "Registerd Event",
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const MyRegisteredEventsPage()),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Theme(
                data: Theme.of(context).copyWith(
                  dividerColor: Colors.transparent,
                ),
                child: ExpansionTile(
                  leading: const Icon(Icons.support_agent, color: Colors.white70),
                  title: const Text(
                    "Support Tikect",
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: Icon(
                    isSupportExpanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: Colors.white,
                  ),
                  initiallyExpanded: isSupportExpanded,
                  onExpansionChanged: (value) {
                    setState(() {
                      isSupportExpanded = value;
                    });
                  },
                  children: [
                    ListTile(
                      leading: const Icon(Icons.book, color: Colors.white70),
                      title: const Text(
                        "My Tikect",
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const yoursupportticket()),
                        );
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.book, color: Colors.white70),
                      title: const Text(
                        "Create  Tikect",
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const CreateSupportTicketPage()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      // ================= BODY =================
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Column(
                  children: [
                    Text(
                      "Welcome Back!",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 6),
                    Text(
                      "Nisha Rao",
                      style: TextStyle(
                          color: Colors.white70,
                          fontSize: 18),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Here's your academic overview",
                      style: TextStyle(
                          color: Colors.white60),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

      Row(
        children: [
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF525F6A),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const viewvirtualidcard()),
                );
              },
              child: const Text("VIEW VIRTUAL ID CARD"),
            ),

          ),
              ],
      ),

              const SizedBox(height: 25),
              buildCard("ATTENDANCE", "66.67%", "Keep up the good work!",
                  Icons.calendar_month),
              buildFeeCard(),
              buildSupportCard(),
              buildStudyCard(),
              buildUpcomingEvents(),
              buildAvailableExams(),
              buildStudyMaterial(),
              buildAssignments(),
            ],
          ),
        ),
      ),
    );
  }

  // ================= HELPER WIDGETS =================

  Widget buildDrawerItem({
    required IconData icon,
    required String title,
    required BuildContext context,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.white70),
      title: Text(title, style: const TextStyle(color: Colors.white)),
      onTap: onTap,
    );
  }

  Widget buildCard(String title, String value, String subtitle, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xff3A4266),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text(value,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Text(subtitle,
                      style: const TextStyle(color: Colors.white60)),
                ]),
          ),
          Icon(icon, color: Colors.white, size: 32)
        ],
      ),
    );
  }

  Widget buildFeeCard() {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xff3A4266),
        borderRadius: BorderRadius.circular(14),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("FEE STATUS",
              style: TextStyle(
                  color: Colors.white70, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Text("₹36600",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold)),
          Text("Due Amount",
              style: TextStyle(color: Colors.white60)),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Total ₹37600",
                  style: TextStyle(color: Colors.white70)),
              Text("Paid ₹1000",
                  style: TextStyle(color: Colors.white70)),
            ],
          )
        ],
      ),
    );
  }

  Widget buildSupportCard() {
    return buildCard(
        "SUPPORT", "1 Active Tickets",
        "Latest: Issue with Fee Payment Portal",
        Icons.headset_mic);
  }

  Widget buildStudyCard() {
    return buildCard(
        "STUDY", "2 Available Exams",
        "1 Study Materials 2 Assignment",
        Icons.show_chart);
  }

  Widget buildUpcomingEvents() {
    return buildCard(
        "Upcoming Events", "",
        "No upcoming events scheduled",
        Icons.event);
  }

  Widget buildAvailableExams() {
    return buildCard(
        "Available Exams", "",
        "Mid Term Examination II 2025",
        Icons.edit_document);
  }

  Widget buildStudyMaterial() {
    return buildCard(
        "Study Materials", "",
        "Cloud Computing Study Material",
        Icons.picture_as_pdf);
  }

  Widget buildAssignments() {
    return buildCard(
        "Assignments", "",
        "Assignment 1 & 2",
        Icons.assignment);
  }
}
