import 'package:flutter/material.dart';
import 'package:project2/pages/ MyRegisteredEvents.dart';
import 'package:project2/pages/salarybankdetails.dart';
import 'package:project2/pages/studymaterial.dart';
import 'package:project2/pages/yoursupportticket.dart';
import 'AssignedTickets.dart';
import 'ExploreEvents.dart';
import 'assigment.dart';
import 'classdetail.dart';
import 'createnewsupportticket.dart';
import 'examlist.dart';
import 'librarybookpage.dart';
import 'markattendence.dart';
import 'mentoredsection.dart';
import 'newclassschedule.dart';
import 'virtual_id_card_page.dart';
import 'profile_page.dart';
import 'create_assignment_page.dart';
import 'schedule_class_page.dart';
import 'upload_material_page.dart';


class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool isSchedulesExpanded = false;
  bool isLibraryExpanded = false;
  bool isExamExpanded = false;
  bool isMaterialExpanded = false;
  bool isEventExpanded = false;
  bool isSupportExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
              IconButton(
                icon: const Icon(Icons.more_vert, color: Colors.black),
                onPressed: () {
                  _scaffoldKey.currentState!.openEndDrawer();
                },
              ),
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
                  "Teacher Panel",
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
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const ProfilePage()));
                  }),
              Theme(
                data: Theme.of(context).copyWith(
                  dividerColor: Colors.transparent,
                ),
                child: ExpansionTile(
                  leading: const Icon(Icons.class_, color: Colors.white70),
                  title: const Text(
                    "Class Management",
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
                        "My Class",
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const MentoredSectionsPage()),
                        );
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.menu_book_outlined,
                          color: Colors.white70),
                      title: const Text(
                        "All Class",
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const ClassesDetailsPage()),
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
                  leading: const Icon(Icons.calendar_month, color: Colors.white70),
                  title: const Text(
                    "Schedules",
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
                        "All Schedules",
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const ViewClassSchedulePage()),
                        );
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.menu_book_outlined,
                          color: Colors.white70),
                      title: const Text(
                        "My Schedules",
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const LibraryBooksPage()),
                        );
                      },
                    ),
                  ],
                ),
              ),
              buildDrawerItem(
                  icon: Icons.school,
                  title: "Student Leave",
                  context: context,
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (_) => ScheduleClassPage()));
                  }
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
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const LibraryBooksPage()),
                        );
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.menu_book_outlined,
                          color: Colors.white70),
                      title: const Text(
                        "Lending Books",
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const LibraryBooksPage()),
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
                    "Exam",
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
                        "Exam Information",
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const ExamListPage()),
                        );
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.menu_book_outlined,
                          color: Colors.white70),
                      title: const Text(
                        "Mark Entry",
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const Assigments()),
                        );
                      },
                    ),
                  ],
                ),
              ),
              buildDrawerItem(
                  icon: Icons.account_balance_wallet,
                  title: "Salary Info",
                  context: context,
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (_) => SalaryBankDetailsPage()));
                  }),
              Theme(
                data: Theme.of(context).copyWith(
                  dividerColor: Colors.transparent,
                ),
                child: ExpansionTile(
                  leading: const Icon(Icons.upload_file, color: Colors.white70),
                  title: const Text(
                    "Material ",
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
                        "Upload notes",
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const StudyMaterialsPage()),
                        );
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.menu_book_outlined,
                          color: Colors.white70),
                      title: const Text(
                        "upload Assigment",
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const Assigments()),
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
                        "Event List",
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const ManageEventsPage()),
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
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const MyRegisteredEventsPage()),
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
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const yoursupportticket()),
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
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const CreateSupportTicketPage()),
                        );
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.menu_book_outlined,
                          color: Colors.white70),
                      title: const Text(
                        "Assigned Tikects",
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const AssignedTickets()),
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
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Welcome back, Devansh Mehra",
                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              const Text(
                "Tuesday, January 27, 2026",
                style: TextStyle(color: Colors.white70),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1E2A5A),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const VirtualIdCardPage()),
                        );
                      },
                      child: const Text("GENERATE VIRTUAL ID"),
                    ),
                  ),
                  const SizedBox(width: 10),
                  PopupMenuButton<String>(
                    color: Colors.white,
                    onSelected: (value) {
                      if (value == "assignment") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const CreateAssignmentPage()),
                        );
                      } else if (value == "schedule") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const ScheduleClassPage()),
                        );
                      } else if (value == "upload") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const UploadAssignmentPage()),
                        );
                      }
                    },
                    itemBuilder: (context) => [
                      const PopupMenuItem(
                        value: "assignment",
                        child: ListTile(
                          leading: Icon(Icons.add),
                          title: Text("Create Assignment"),
                        ),
                      ),
                      const PopupMenuItem(
                        value: "schedule",
                        child: ListTile(
                          leading: Icon(Icons.calendar_today),
                          title: Text("Schedule Class"),
                        ),
                      ),
                      const PopupMenuItem(
                        value: "upload",
                        child: ListTile(
                          leading: Icon(Icons.upload_file),
                          title: Text("Upload Material"),
                        ),
                      ),
                    ],
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                      decoration: BoxDecoration(
                        color: const Color(0xFF3D63A8),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Row(
                        children: [
                          Text("QUICK ACTIONS", style: TextStyle(color: Colors.white)),
                          SizedBox(width: 5),
                          Icon(Icons.arrow_drop_down, color: Colors.white)
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  DashboardCard(title: "Total Classes Today", icon: Icons.class_),
                  DashboardCard(title: "Active Assignments", icon: Icons.list),
                  DashboardCard(title: "Pending Leave Reviews", icon: Icons.access_time),
                  DashboardCard(title: "Study Materials", icon: Icons.menu_book),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E2A5A),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Today's Schedule",
                        style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    const Text("Cost Accounting Methods", style: TextStyle(color: Colors.white)),
                    const Text("Cost Analysis and Management - A", style: TextStyle(color: Colors.white70)),
                    const SizedBox(height: 5),
                    const Text("15:00:00 - 16:00:00", style: TextStyle(color: Colors.white70)),
                    const SizedBox(height: 15),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const MarkAttendancePage()),
                          );
                        },
                        child: const Text("MARK ATTENDANCE"),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E2A5A),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Assignments",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    StatusTile(
                      title: "Assignment 2",
                      subtitle: "Due: 2025-11-15",
                      status: "Active",
                    ),
                    StatusTile(
                      title: "Assignment 1",
                      subtitle: "Due: 2025-11-30",
                      status: "Active",
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E2A5A),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Active Exams",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    StatusTile(
                      title: "Mid Term Examination II 2025",
                      subtitle: "Written",
                      status: "Active",
                    ),
                    StatusTile(
                      title: "Mid Term Examination 2025",
                      subtitle: "Written",
                      status: "Active",
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E2A5A),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("My Salary",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 15),
                    Center(
                      child: Column(
                        children: [
                          Text("₹50,000.00",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold)),
                          Text("Last paid: September 2025",
                              style: TextStyle(color: Colors.white70)),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Text("Status: Paid", style: TextStyle(color: Colors.white70)),
                    Text("Payment Date: 09 Oct 2025",
                        style: TextStyle(color: Colors.white70)),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E2A5A),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Upcoming Events",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 20),
                    Center(
                      child: Column(
                        children: [
                          Icon(Icons.event_busy,
                              size: 40, color: Colors.white54),
                          SizedBox(height: 10),
                          Text("No upcoming events.",
                              style: TextStyle(color: Colors.white70)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E2A5A),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Support Tickets",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    StatusTile(
                      title: "Classroom Technology Malfunction",
                      subtitle: "Open",
                      status: "Open",
                    ),
                    StatusTile(
                      title: "Issue with Fee Payment Portal",
                      subtitle: "Open",
                      status: "Open",
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E2A5A),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Leave Requests",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    StatusTile(
                      title: "Aarav Mehta",
                      subtitle: "I Have a Plan",
                      status: "Pending",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDrawerItem({required IconData icon, required String title, required BuildContext context, required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(icon, color: Colors.white70),
      title: Text(title, style: const TextStyle(color: Colors.white)),
      onTap: onTap,
    );
  }
}

class DashboardCard extends StatelessWidget {
  final String title;
  final IconData icon;

  const DashboardCard({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1E2A5A),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white, size: 30),
          const SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class StatusTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String status;

  const StatusTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500)),
                const SizedBox(height: 2),
                Text(subtitle, style: const TextStyle(color: Colors.white70, fontSize: 12)),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: _getStatusColor(status).withOpacity(0.2),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              status,
              style: TextStyle(color: _getStatusColor(status), fontSize: 10, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'active':
        return Colors.green;
      case 'pending':
        return Colors.orange;
      case 'open':
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }
}

