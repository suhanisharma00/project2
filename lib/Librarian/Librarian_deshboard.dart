import 'package:flutter/material.dart';
import 'package:project2/Librarian/supportticket/My_ticket.dart';
import 'package:project2/Librarian/supportticket/create_ticket.dart';

import '../counselor/event_managmant/event_information.dart';
import '../counselor/support_tiket/Assigned_tiket.dart';

import '../pages/LendingBooksPage.dart';

import '../pages/salarybankdetails.dart';

import '../pages/ MyRegisteredEvents.dart';

import 'Books/All_Books.dart';
import 'Books/Add_new_bokks.dart';
import 'Issued_Book/Issue_list.dart';
import 'Issued_Book/issue_Book.dart';
import 'examination.dart';
import 'librarian_profile.dart';
import 'overdue_books.dart';

class LibrarianDashboard extends StatelessWidget {
  const LibrarianDashboard({super.key});

  static const Color bgColor = Color(0xFF0B0D18);
  static const Color cardColor = Color(0xFF1B2238);
  static const Color buttonColor = Color(0xFF323B5C);
  static const Color accentBlue = Color(0xFF4A89FF);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// HEADER (Excluded from navigation as requested)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome, Neelam Kapoor",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Librarian / Resource Management",
                        style: TextStyle(color: Colors.white60, fontSize: 13),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Tuesday, February 27, 2026",
                        style: TextStyle(color: Colors.white38, fontSize: 11),
                      ),
                    ],
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white24, width: 2),
                    ),
                    child: const Center(
                      child: Text(
                        "NK",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                  )
                ],
              ),

              const SizedBox(height: 25),

              /// PROFILE OVERVIEW -> Navigates to ProfilePage
              SectionWrapper(
                title: "Profile overview",
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LibrarianProfilePage()),
                    );
                  },
                  child: Column(
                    children: [
                      const CircleAvatar(
                        radius: 35,
                        backgroundColor: Colors.white24,
                        child: Text("NK",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        "Neelam Kapoor",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        "(EMP-LIB-789)",
                        style: TextStyle(color: Colors.white54, fontSize: 13),
                      ),
                      const SizedBox(height: 20),
                      profileInfo(Icons.email_outlined, "neelam@iias.com"),
                      profileInfo(Icons.phone_outlined, "+91 98123-45678"),
                      profileInfo(Icons.location_on_outlined, "Sector 14, Lucknow"),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              /// MY SALARY (Excluded from navigation as requested)
              SectionWrapper(
                title: "My Salary",
                icon: Icons.account_balance_wallet_outlined,
                child: Column(
                  children: [
                    const Text(
                      "₹60,000.00",
                      style: TextStyle(
                          color: Colors.greenAccent,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "Last paid: 09 Jan 2026",
                      style: TextStyle(color: Colors.white54, fontSize: 13),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Status:",
                            style: TextStyle(color: Colors.white70)),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.green.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Text("Paid",
                              style: TextStyle(
                                  color: Colors.greenAccent,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Payment Date:",
                            style: TextStyle(color: Colors.white70)),
                        Text("12 Jan 2026",
                            style: TextStyle(color: Colors.white, fontSize: 13)),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              /// BOOKS
              SectionWrapper(
                title: "Books",
                icon: Icons.menu_book_outlined,
                child: Column(
                  children: [
                    navButton("All Books", Icons.arrow_forward_ios, () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const AllBooksPage()),
                      );
                    }),
                    const SizedBox(height: 10),
                    navButton("Add New Books", Icons.arrow_forward_ios, () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const AddNewBookPage()),
                      );
                    }),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              /// ISSUED BOOKS
              SectionWrapper(
                title: "Issued Books",
                icon: Icons.assignment_turned_in_outlined,
                child: Column(
                  children: [
                    navButton("Issue List", Icons.arrow_forward_ios, () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const IssuedBooksListPage()),
                      );
                    }),
                    const SizedBox(height: 10),
                    navButton("Issue Book", Icons.arrow_forward_ios, () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const IssueBookPage()),
                      );
                    }),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              /// OVERDUE BOOKS
              SectionWrapper(
                title: "Overdue Books",
                icon: Icons.info_outline,
                child: navButton("Overdue List", Icons.arrow_forward_ios, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const OverdueBooksPage()),
                  );
                }),
              ),

              const SizedBox(height: 20),

              /// MY LENDING BOOKS
              fullWidthNavItem("My Lending Books", Icons.people_outline, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyLendingBooksPage()),
                );
              }),

              const SizedBox(height: 20),

              /// EXAMINATIONS
              SectionWrapper(
                title: "Examinations",
                icon: Icons.description_outlined,
                child: navButton(
                    "Examination Information", Icons.arrow_forward_ios, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ExaminationListPage()),
                  );
                }),
              ),

              const SizedBox(height: 20),

              /// SALARY DETAILS
              fullWidthNavItem("Salary Details", Icons.payments_outlined, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SalaryBankDetailsPage()),
                );
              }),

              const SizedBox(height: 20),

              /// EVENT MANAGEMENT
              SectionWrapper(
                title: "Event Management",
                icon: Icons.event_note_outlined,
                child: Column(
                  children: [
                    navButton("Event List", Icons.arrow_forward_ios, () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ExploreEventsPage()),
                      );
                    }),
                    const SizedBox(height: 10),
                    navButton("Registered Events", Icons.arrow_forward_ios, () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const MyRegisteredEventsPage()),
                      );
                    }),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              /// SUPPORT TICKETS
              SectionWrapper(
                title: "Support Tickets",
                icon: Icons.help_outline,
                child: Column(
                  children: [
                    navButton("My Tickets", Icons.arrow_forward_ios, () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const MyTicketsPage()),
                      );
                    }),
                    const SizedBox(height: 10),
                    navButton("Create Ticket", Icons.arrow_forward_ios, () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const CreateTicketPage()),
                      );
                    }),
                    const SizedBox(height: 10),
                    navButton("Assigned Tickets", Icons.arrow_forward_ios, () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const AssignedTicketsPage()),
                      );
                    }),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              /// RECENTLY ADDED BOOKS (Excluded from navigation)
              const SectionHeader(icon: Icons.library_books_outlined, title: "Recently Added Books"),
              const SizedBox(height: 12),
              Column(
                children: [
                  bookItem("Research Methods", "By Dr. Smith", "01 Dec 2023"),
                  bookItem("Advanced Taxation Concepts", "By Prof. Kumar", "01 Dec 2023"),
                  bookItem("Introduction to Managerial Accounting", "By J.S. Rao", "01 Dec 2023"),
                  bookItem("Cost Management Techniques", "By M. Sharma", "01 Dec 2023"),
                ],
              ),

              const SizedBox(height: 25),

              /// RECENTLY ISSUED BOOKS (Excluded from navigation)
              const SectionHeader(icon: Icons.history_outlined, title: "Recently Issued Books"),
              const SizedBox(height: 12),
              Column(
                children: [
                  issuedItem("Principles of Financial Accounting", "Neelam Kapoor", "02 Dec 2023"),
                  issuedItem("Introduction to Managerial Accounting", "Neelam Kapoor", "02 Dec 2023"),
                  issuedItem("Advanced Taxation Concepts", "Neelam Kapoor", "02 Dec 2023"),
                  issuedItem("Advanced Taxation Concepts", "Neelam Kapoor", "02 Dec 2023"),
                ],
              ),

              const SizedBox(height: 25),

              /// OVERDUE BOOKS LIST (Excluded from navigation)
              const SectionHeader(icon: Icons.warning_amber_outlined, title: "Overdue Books"),
              const SizedBox(height: 12),
              Column(
                children: [
                  overdueItem("Principles of Financial Accounting", "Neelam Kapoor", "02 Dec 2023"),
                  overdueItem("Introduction to Managerial Accounting", "Neelam Kapoor", "02 Dec 2023"),
                  overdueItem("Advanced Taxation Concepts", "Neelam Kapoor", "02 Dec 2023"),
                  /// Empty Placeholder from image
                  Container(
                    height: 50,
                    margin: const EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      color: cardColor.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// HELPER WIDGETS

  Widget profileInfo(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white38, size: 16),
          const SizedBox(width: 8),
          Text(text, style: const TextStyle(color: Colors.white70, fontSize: 13)),
        ],
      ),
    );
  }

  Widget navButton(String text, IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text, style: const TextStyle(color: Colors.white, fontSize: 14)),
            Icon(icon, color: Colors.white54, size: 14),
          ],
        ),
      ),
    );
  }

  Widget fullWidthNavItem(String title, IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.white70, size: 20),
            const SizedBox(width: 12),
            Text(title,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15)),
          ],
        ),
      ),
    );
  }

  Widget bookItem(String title, String author, String date) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
                Text(author, style: const TextStyle(color: Colors.white38, fontSize: 11)),
              ],
            ),
          ),
          Text(date, style: const TextStyle(color: Colors.white38, fontSize: 11)),
        ],
      ),
    );
  }

  Widget issuedItem(String title, String borrower, String date) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
                Text("Issued to: $borrower", style: const TextStyle(color: Colors.white38, fontSize: 11)),
              ],
            ),
          ),
          Text(date, style: const TextStyle(color: Colors.white38, fontSize: 11)),
        ],
      ),
    );
  }

  Widget overdueItem(String title, String borrower, String date) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
                Text("Borrower: $borrower", style: const TextStyle(color: Colors.white38, fontSize: 11)),
              ],
            ),
          ),
          Text("Overdue:\n$date", textAlign: TextAlign.right, style: const TextStyle(color: Colors.white38, fontSize: 10)),
        ],
      ),
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
      decoration: BoxDecoration(
        color: LibrarianDashboard.cardColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (icon != null) Icon(icon, color: Colors.white, size: 18),
              if (icon != null) const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: 16),
          child,
        ],
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final IconData icon;
  final String title;

  const SectionHeader({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.white, size: 20),
        const SizedBox(width: 10),
        Text(
          title,
          style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 17),
        ),
      ],
    );
  }
}



