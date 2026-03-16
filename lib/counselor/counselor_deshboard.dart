import 'package:flutter/material.dart';
import 'package:project2/counselor/profile.dart';
import 'package:project2/counselor/virtual_id.dart';
import 'package:project2/counselor/class_routine.dart';
import 'package:project2/counselor/salary_infomation.dart';
import 'package:project2/counselor/examination_information.dart';

import 'manageaccount/manager.dart';
import 'manageaccount/counselor.dart';
import 'manageaccount/teachers.dart';
import 'manageaccount/librarian.dart';
import 'manageaccount/accountants.dart';
import 'manageaccount/staff.dart';

import 'manage_class/classes.dart';
import 'manage_class/subject.dart';

import 'library/book_catlog.dart';
import 'library/My_book_issue.dart';

import 'event_managmant/event_information.dart';
import 'event_managmant/registed_event.dart';

import 'support_tiket/My_tiket.dart';
import 'support_tiket/Submit_new_tiket.dart';
import 'support_tiket/Assigned_tiket.dart';

class CounslorDeshboardPage extends StatelessWidget {
  const CounslorDeshboardPage({super.key});

  static const Color bgColor = Color(0xFF0B1221);
  static const Color cardColor = Color(0xFF1E293B);
  static const Color buttonColor = Color(0xFF334155);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// HEADER
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome back, Ananya R. Singh!",
                        style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Tuesday, February 27, 2026",
                        style: TextStyle(color: Colors.white60, fontSize: 13),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(20)),
                    child: const Text("Online", style: TextStyle(color: Colors.white, fontSize: 11)),
                  )
                ],
              ),
              const SizedBox(height: 16),

              /// VIRTUAL ID BUTTON
              GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const VirtualIdCardPage())),
                child: Container(
                  width: 130,
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  decoration: BoxDecoration(color: buttonColor, borderRadius: BorderRadius.circular(6)),
                  child: const Row(
                    children: [
                      Icon(Icons.vpn_key, color: Colors.blue, size: 16),
                      SizedBox(width: 8),
                      Text("VIRTUAL ID", style: TextStyle(color: Colors.white, fontSize: 13)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              /// STATS GRID
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                physics: const NeverScrollableScrollPhysics(),
                childAspectRatio: 1.6,
                children: const [
                  StatCard(icon: Icons.school, title: "Total Classes", subTitle: "Under your guidance"),
                  StatCard(icon: Icons.groups, title: "Active Account", subTitle: "Across all institutes"),
                  StatCard(icon: Icons.error_outline, title: "Pending Tickets", subTitle: "Require your attention"),
                  StatCard(icon: Icons.fact_check, title: "Active Exams", subTitle: "Currently ongoing"),
                ],
              ),
              const SizedBox(height: 16),

              /// PROFILE SECTION
              SectionWrapper(
                title: "Profile",
                icon: Icons.person,
                child: InkWell(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CounselorProfilePage())),
                  child: Column(
                    children: [
                      const CircleAvatar(radius: 30, backgroundColor: Colors.white24, child: Icon(Icons.person, size: 30, color: Colors.white)),
                      const SizedBox(height: 10),
                      const Text("Ananya R. Singh", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      const Text("Senior Student Counselor", style: TextStyle(color: Colors.white60, fontSize: 13)),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          infoItem(Icons.email, "ananya@iias", "Email"),
                          infoItem(Icons.phone, "9812344567", "phone"),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),

              /// MANAGE ACCOUNTS
              SectionWrapper(
                title: "Manage Accounts",
                icon: Icons.groups,
                child: GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 2.8,
                  children: [
                    navBtn(context, "Manager", const InstituteManagerPage()),
                    navBtn(context, "Counselors", const CounselorPage()),
                    navBtn(context, "Teachers", const TeachersPage()),
                    navBtn(context, "Librarian", const LibrarianPage()),
                    navBtn(context, "Accountants", const AccountantPage()),
                    navBtn(context, "Staff", const StaffPage()),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              /// MANAGE CLASSES
              SectionWrapper(
                title: "Manage Classes",
                icon: Icons.class_outlined,
                child: Row(
                  children: [
                    Expanded(child: navBtn(context, "Classes", const ClassManagementPage())),
                    const SizedBox(width: 10),
                    Expanded(child: navBtn(context, "Subjects", const SubjectManagementPage())),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              /// ACTIVE EXAMS
              SectionWrapper(
                title: "Active Exams",
                icon: Icons.school_outlined,
                child: const Column(
                  children: [
                    ExamTile(title: "Mid Term Examination II 2025", sub: "Written"),
                    ExamTile(title: "Mid Term Examination 2025", sub: "Written"),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              /// MY SALARY
              SectionWrapper(
                title: "My Salary",
                icon: Icons.account_balance_wallet_outlined,
                child: Column(
                  children: [
                    const Text("₹50,000.00", style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
                    const Text("Last paid: September 2025", style: TextStyle(color: Colors.white60, fontSize: 13)),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Status:", style: TextStyle(color: Colors.white70)),
                        Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2), decoration: BoxDecoration(color: Colors.white12, borderRadius: BorderRadius.circular(4)), child: const Text("Paid", style: TextStyle(color: Colors.white, fontSize: 12))),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Payment Date:", style: TextStyle(color: Colors.white70)),
                        Text("09 Oct 2025", style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              /// UPCOMING EVENTS
              SectionWrapper(
                title: "Upcoming Events",
                icon: Icons.event_note,
                child: const Center(
                  child: Column(
                    children: [
                      Icon(Icons.event_busy, color: Colors.white24, size: 40),
                      SizedBox(height: 10),
                      Text("No upcoming events.", style: TextStyle(color: Colors.white60)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),

              /// CLASS ROUTINES
              fullWidthBtn(context, "Class Routines", Icons.calendar_view_day_outlined, const ClassesDetailsPage()),
              const SizedBox(height: 16),

              /// LIBRARY
              SectionWrapper(
                title: "Library",
                icon: Icons.menu_book,
                child: Row(
                  children: [
                    Expanded(child: navBtn(context, "Book Catalog", const LibraryBooksPage())),
                    const SizedBox(width: 10),
                    Expanded(child: navBtn(context, "My Issued Books", const MyLendingBooksPage())),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              /// EXAMINATIONS
              SectionWrapper(
                title: "Examinations",
                icon: Icons.assignment_outlined,
                child: navBtn(context, "Examination Information", const ExamListPage()),
              ),
              const SizedBox(height: 16),

              fullWidthBtn(context, "Salary information", Icons.money, const SalaryBankPage()),
              const SizedBox(height: 16),

              /// EVENTS MANAGEMENT
              SectionWrapper(
                title: "Events Management",
                icon: Icons.event_available,
                child: Row(
                  children: [
                    Expanded(child: navBtn(context, "Event Information", const ExploreEventsPage())),
                    const SizedBox(width: 10),
                    Expanded(child: navBtn(context, "Registered Events", const MyRegisteredEventsPage())),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              /// SUPPORT TICKET
              SectionWrapper(
                title: "Support Ticket",
                icon: Icons.headset_mic_outlined,
                child: Column(
                  children: [
                    navBtn(context, "My Ticket", const yoursupportticket(), isWide: true),
                    const SizedBox(height: 8),
                    navBtn(context, "Submit New Ticket", const CreateSupportTicketPage(), isWide: true),
                    const SizedBox(height: 8),
                    navBtn(context, "Assigned Ticket", const AssignedTicketsPage(), isWide: true),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              /// SUBJECT AREAS
              SectionWrapper(
                title: "Subject Areas",
                child: GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 2.2,
                  children: [
                    subjectBtn("Principles of Accounting (FAB101A)"),
                    subjectBtn("Financial Statements (FAB101B)"),
                    subjectBtn("Cost Accounting Methods (CAM204A)"),
                    subjectBtn("Business Cost Control (CAM204B)"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget navBtn(BuildContext context, String text, Widget page, {bool isWide = false}) {
    return SizedBox(
      width: isWide ? double.infinity : null,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: buttonColor, elevation: 0, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => page)),
        child: Text(text, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white, fontSize: 13)),
      ),
    );
  }

  Widget fullWidthBtn(BuildContext context, String text, IconData icon, Widget page) {
    return InkWell(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => page)),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(color: cardColor, borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Icon(icon, color: Colors.white, size: 20),
            const SizedBox(width: 12),
            Text(text, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget infoItem(IconData icon, String val, String label) {
    return Row(
      children: [
        Icon(icon, color: Colors.white60, size: 16),
        const SizedBox(width: 6),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(val, style: const TextStyle(color: Colors.white, fontSize: 12)),
            Text(label, style: const TextStyle(color: Colors.white38, fontSize: 10)),
          ],
        )
      ],
    );
  }

  Widget subjectBtn(String text) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(color: buttonColor, borderRadius: BorderRadius.circular(8)),
      child: Text(text, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white, fontSize: 11)),
    );
  }
}

class SectionWrapper extends StatelessWidget {
  final String title;
  final IconData? icon;
  final Widget child;
  const SectionWrapper({super.key, required this.title, this.icon, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: CounslorDeshboardPage.cardColor, borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (icon != null) Icon(icon, color: Colors.white, size: 18),
              if (icon != null) const SizedBox(width: 8),
              Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 16),
          child,
        ],
      ),
    );
  }
}

class StatCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subTitle;
  const StatCard({super.key, required this.icon, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: CounslorDeshboardPage.cardColor, borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white, size: 20),
          const SizedBox(height: 8),
          Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
          Text(subTitle, style: const TextStyle(color: Colors.white38, fontSize: 10)),
        ],
      ),
    );
  }
}

class ExamTile extends StatelessWidget {
  final String title;
  final String sub;
  const ExamTile({super.key, required this.title, required this.sub});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold)),
              Text(sub, style: const TextStyle(color: Colors.white60, fontSize: 12)),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(color: Colors.white12, borderRadius: BorderRadius.circular(4)),
            child: const Text("Active", style: TextStyle(color: Colors.white60, fontSize: 11)),
          )
        ],
      ),
    );
  }
}
