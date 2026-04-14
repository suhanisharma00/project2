import 'package:flutter/material.dart';

class FinancialDashboard extends StatelessWidget {
  const FinancialDashboard({super.key});

  static const Color primaryBg = Color(0xFF0D1127);
  static const Color cardBg = Color(0xFF1C223D);
  static const Color accentBlue = Color(0xFF3F51B5);
  static const Color accentPurple = Color(0xFF673AB7);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBg,
      appBar: AppBar(
        backgroundColor: cardBg,
        elevation: 0,
        title: Row(
          children: [
            const CircleAvatar(
              radius: 18,
              backgroundColor: Colors.grey,
              child: Icon(Icons.person, size: 20, color: Colors.white),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("Financial Overview & Management Dashboard", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
                Text("Real-time financial tracking and reporting", style: TextStyle(color: Colors.white54, fontSize: 10)),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildActionCard(Icons.badge, "GENERATE VIRTUAL ID CARD", accentBlue),
            const SizedBox(height: 20),
            _buildFinancialStats(),
            const SizedBox(height: 20),
            _buildSectionTitle("⚡ Quick Actions"),
            _buildQuickActionButtons(),
            const SizedBox(height: 20),
            _buildProfileCard(),
            const SizedBox(height: 20),
            _buildSectionTitle("💵 My Salary"),
            _buildSalaryCard(),
            const SizedBox(height: 20),
            _buildManagementGrid(),
            const SizedBox(height: 20),
            _buildSectionTitle("🏦 Institute Salaries"),
            _buildSalaryRecords(),
            const SizedBox(height: 20),
            _buildSectionTitle("💳 Recent Payments"),
            _buildRecentPayments(),
            const SizedBox(height: 20),
            _buildSectionTitle("⚠️ Fines & Penalties"),
            _buildFinesSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(title, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildActionCard(IconData icon, String label, Color color) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(12), border: Border.all(color: color.withOpacity(0.5))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 18),
          const SizedBox(width: 10),
          Text(label, style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 13)),
        ],
      ),
    );
  }

  Widget _buildFinancialStats() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: _buildStatCard(Icons.account_balance_wallet, "₹32,500.00", "Total Revenues", Colors.cyan)),
            const SizedBox(width: 12),
            Expanded(child: _buildStatCard(Icons.trending_up, "+12%", "Growth Rate", Colors.orange)),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(child: _buildStatCard(Icons.receipt_long, "₹14,800.00", "Institute Fees", Colors.teal)),
            const SizedBox(width: 12),
            Expanded(child: _buildStatCard(Icons.school, "₹18,000.00", "Class Fees", Colors.indigo)),
          ],
        ),
      ],
    );
  }

  Widget _buildStatCard(IconData icon, String value, String label, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: cardBg, borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 12),
          Text(value, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
          Text(label, style: const TextStyle(color: Colors.white54, fontSize: 11)),
        ],
      ),
    );
  }

  Widget _buildQuickActionButtons() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: cardBg, borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          _buildTextButton(Icons.list_alt, "FEE STRUCTURE"),
          const SizedBox(height: 8),
          _buildTextButton(Icons.manage_accounts, "MANAGE STUDENT FEES"),
          const SizedBox(height: 8),
          _buildTextButton(Icons.add_circle_outline, "CREATE TICKET"),
        ],
      ),
    );
  }

  Widget _buildTextButton(IconData icon, String label) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton.icon(
        onPressed: () {},
        icon: Icon(icon, size: 16, color: Colors.white70),
        label: Text(label, style: const TextStyle(color: Colors.white70, fontSize: 12)),
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.white10),
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }

  Widget _buildProfileCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: cardBg, borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          const Text("Profile Overview", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          const CircleAvatar(
            radius: 35,
            backgroundColor: Colors.grey,
            child: Icon(Icons.person, size: 45, color: Colors.white),
          ),
          const SizedBox(height: 12),
          const Text("Rohit Kumar", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
          const Text("Senior Accountant", style: TextStyle(color: Colors.white54, fontSize: 12)),
          const SizedBox(height: 16),
          _buildProfileInfo(Icons.email_outlined, "rohit@eduphin.com"),
          _buildProfileInfo(Icons.phone_outlined, "9876543210"),
          _buildProfileInfo(Icons.location_city, "Admin Department"),
        ],
      ),
    );
  }

  Widget _buildProfileInfo(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white38, size: 14),
          const SizedBox(width: 8),
          Text(text, style: const TextStyle(color: Colors.white70, fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildSalaryCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [accentPurple.withOpacity(0.3), accentBlue.withOpacity(0.3)]),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        children: [
          const Text("₹54,000.00", style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold)),
          const Text("Last paid: October 2025", style: TextStyle(color: Colors.white70, fontSize: 12)),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildSalaryDetail("Status", "Paid", Colors.green),
              _buildSalaryDetail("Payment Date", "10 Nov 2025", Colors.white70),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSalaryDetail(String label, String value, Color valueColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.white38, fontSize: 10)),
        Text(value, style: TextStyle(color: valueColor, fontSize: 12, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildManagementGrid() {
    final List<Map<String, dynamic>> items = [
      {"title": "Fee Information", "icon": Icons.payment},
      {"title": "Library", "icon": Icons.library_books},
      {"title": "Examinations", "icon": Icons.assignment},
      {"title": "Event Management", "icon": Icons.event},
      {"title": "Support Ticket", "icon": Icons.support_agent},
      {"title": "Employee Detail", "icon": Icons.badge},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        mainAxisSpacing: 8,
        childAspectRatio: 6,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(color: cardBg, borderRadius: BorderRadius.circular(10)),
          child: ListTile(
            leading: Icon(items[index]['icon'], color: Colors.white70, size: 20),
            title: Text(items[index]['title'], style: const TextStyle(color: Colors.white, fontSize: 13)),
            trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white24, size: 14),
            onTap: () {},
          ),
        );
      },
    );
  }

  Widget _buildSalaryRecords() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: cardBg, borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          _buildSalaryRow("November 2025", "₹55,000.00"),
          _buildSalaryRow("September 2025", "₹51,500.00"),
          _buildSalaryRow("October 2025", "₹54,000.00"),
          const SizedBox(height: 8),
          const Text("+2 more records", style: TextStyle(color: Colors.white38, fontSize: 10)),
        ],
      ),
    );
  }

  Widget _buildSalaryRow(String month, String amount) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(month, style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold)),
              const Text("Salary Record", style: TextStyle(color: Colors.white54, fontSize: 10)),
            ],
          ),
          Text(amount, style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildRecentPayments() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: cardBg, borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          _buildPaymentRow("22 Oct 2025", "₹12,500.00", "Payment Received"),
          _buildPaymentRow("05 Oct 2025", "₹8,000.00", "Payment Received"),
        ],
      ),
    );
  }

  Widget _buildPaymentRow(String date, String amount, String type) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(date, style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold)),
              Text(type, style: const TextStyle(color: Colors.white54, fontSize: 10)),
            ],
          ),
          Text(amount, style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildFinesSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: cardBg, borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          _buildFineRow("Without Uniform", "₹500.00", "20 Oct 2025"),
          _buildFineRow("Damage to Prop", "₹1,200.00", "15 Oct 2025"),
        ],
      ),
    );
  }

  Widget _buildFineRow(String reason, String amount, String date) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(reason, style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold)),
              Text(date, style: const TextStyle(color: Colors.white54, fontSize: 10)),
            ],
          ),
          Text(amount, style: const TextStyle(color: Colors.redAccent, fontSize: 13, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
