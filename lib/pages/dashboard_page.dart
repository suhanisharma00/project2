import 'package:flutter/material.dart';
import 'virtual_id_card_page.dart';
import 'quick_actions_page.dart';
import 'profile_page.dart';
import 'create_assignment_page.dart';
import 'schedule_class_page.dart';
import 'upload_material_page.dart';
import 'classmanagement.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color(0xFF0B1220),
//app bar
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

              ///  3 Dots Button
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

      ///  WHATSAPP STYLE HALF DRAWER
      endDrawer: SizedBox(
        width: MediaQuery.of(context).size.width * 0.75,
        child: Drawer(
          backgroundColor: const Color(0xFF2C3E50),
          child: Column(
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

              /// Menu Items
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
              buildDrawerItem(
                  icon: Icons.class_,
                  title: "Class Management",
                  context: context,
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (_) => ClassManagementPage()));
                  }),
              buildDrawerItem(
                  icon: Icons.calendar_month,
                  title: "Schedules",
                  context: context,
                  onTap: () {}),
              buildDrawerItem(
                  icon: Icons.school,
                  title: "Student Leave",
                  context: context,
                  onTap: () {}),
              buildDrawerItem(
                  icon: Icons.menu_book,
                  title: "Library Resources",
                  context: context,
                  onTap: () {}),
              buildDrawerItem(
                  icon: Icons.edit_document,
                  title: "Exams",
                  context: context,
                  onTap: () {}),
              buildDrawerItem(
                  icon: Icons.account_balance_wallet,
                  title: "Salary Info",
                  context: context,
                  onTap: () {}),
              buildDrawerItem(
                  icon: Icons.upload_file,
                  title: "Materials",
                  context: context,
                  onTap: () {}),
              buildDrawerItem(
                  icon: Icons.event,
                  title: "Event Management",
                  context: context,
                  onTap: () {}),
              buildDrawerItem(
                  icon: Icons.support_agent,
                  title: "Support Tickets",
                  context: context,
                  onTap: () {}),
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
              /// Header
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

              /// Buttons Row
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

                  /// Quick Actions Dropdown
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

              /// 4 Small Cards
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

              /// Today's Schedule
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

                    /// Mark Attendance Button
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey,
                        ),
                        onPressed: () {},
                        child: const Text("MARK ATTENDANCE"),
                      ),
                    )
                  ],
                ),
              ),

              const SizedBox(height: 20),
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
