import 'package:flutter/material.dart';
import 'Super_Admin_Profile.dart';
import 'insitute_managment/institude_list.dart';
import 'insitute_managment/Add_institude.dart';
import 'Moderators_Managment/Moderate_list.dart';
import 'Moderators_Managment/Add_moderators.dart';
import 'system_logs/audit_logs.dart';
import 'system_logs/database_logs.dart';
import 'testimonials.dart';
import 'FAQ\'s.dart';
import 'customer_contact.dart';
import 'privacy_policy.dart';
import 'cancellation_policy.dart';

class SuperAdminDashboard extends StatelessWidget {
  const SuperAdminDashboard({super.key});

  static const Color primaryBg = Color(0xFF0D1127);
  static const Color cardBg = Color(0xFF1C223D);

  void _navigateTo(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBg,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("Super Admin Dashboard 🌐", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
            Text("Complete platform oversight and management control", style: TextStyle(color: Colors.white70, fontSize: 12)),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle("⚡ Quick Actions"),
            _buildQuickActions(context),
            const SizedBox(height: 20),
            _buildSectionTitle("📊 Key Metrics"),
            _buildStatsGrid(context),
            const SizedBox(height: 20),
            _buildSectionTitle("👤 Profile"),
            _buildProfileOverview(context),
            const SizedBox(height: 20),
            _buildSectionTitle("🏫 Institute Management"),
            _buildNavigationCard(context, "Institute List", Icons.list, const InstituteListScreen()),
            _buildNavigationCard(context, "Add Institute", Icons.add_business, const AddInstituteScreen()),
            const SizedBox(height: 20),
            _buildSectionTitle("👥 Moderators Management"),
            _buildNavigationCard(context, "Moderate List", Icons.people_outline, const ModeratorListScreen()),
            _buildNavigationCard(context, "Add Moderate", Icons.person_add_alt, const AddModeratorScreen()),
            const SizedBox(height: 20),
            _buildSectionTitle("📂 System Logs"),
            _buildNavigationCard(context, "Audit Logs", Icons.history, const AuditLogsScreen()),
            _buildNavigationCard(context, "Database Logs", Icons.storage, const DatabaseLogsScreen()),
            const SizedBox(height: 20),
            _buildSectionTitle("📜 Policies & Support"),
            _buildPolicyGrid(context),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0, left: 4),
      child: Text(title, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: cardBg, borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          _buildActionButton(Icons.person_add, "ADD MODERATORS", () => _navigateTo(context, const AddModeratorScreen())),
          const SizedBox(height: 8),
          _buildActionButton(Icons.business, "ADD INSTITUTES", () => _navigateTo(context, const AddInstituteScreen())),
          const SizedBox(height: 8),
          _buildActionButton(Icons.rate_review, "ADD TESTIMONIALS", () => _navigateTo(context, const AddTestimonialScreen())),
        ],
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label, VoidCallback onTap) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: onTap,
        icon: Icon(icon, size: 18, color: Colors.white),
        label: Text(label, style: const TextStyle(color: Colors.white, fontSize: 13)),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF2B3354),
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }

  Widget _buildStatsGrid(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      childAspectRatio: 1.4,
      children: [
        _buildStatCard(context, Icons.group, "29", "Total Accounts", const ModeratorListScreen()),
        _buildStatCard(context, Icons.apartment, "2", "Active Institutes", const InstituteListScreen()),
        _buildStatCard(context, Icons.school, "10", "Total Students", const InstituteListScreen()),
        _buildStatCard(context, Icons.class_, "123", "Classes/Sections", const InstituteListScreen()),
      ],
    );
  }

  Widget _buildStatCard(BuildContext context, IconData icon, String value, String label, Widget target) {
    return InkWell(
      onTap: () => _navigateTo(context, target),
      child: Container(
        decoration: BoxDecoration(color: cardBg, borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white70, size: 24),
            const SizedBox(height: 4),
            Text(value, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
            Text(label, style: const TextStyle(color: Colors.white60, fontSize: 11)),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileOverview(BuildContext context) {
    return InkWell(
      onTap: () => _navigateTo(context, const ManageProfileScreen()),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(color: cardBg, borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 30,
              backgroundColor: Colors.grey,
              child: Icon(Icons.person, size: 40, color: Colors.white),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("Umang Goyal", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                Text("Super Admin", style: TextStyle(color: Colors.white70, fontSize: 13)),
                Text("View Profile Details", style: TextStyle(color: Colors.blueAccent, fontSize: 11)),
              ],
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios, color: Colors.white24, size: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigationCard(BuildContext context, String title, IconData icon, Widget screen) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(color: cardBg, borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        onTap: () => _navigateTo(context, screen),
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(color: Colors.white.withOpacity(0.05), borderRadius: BorderRadius.circular(8)),
          child: Icon(icon, color: Colors.white70, size: 20),
        ),
        title: Text(title, style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500)),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white24, size: 14),
      ),
    );
  }

  Widget _buildPolicyGrid(BuildContext context) {
    final List<Map<String, dynamic>> items = [
      {"name": "Testimonials", "icon": Icons.rate_review, "screen": const TestimonialsManagementScreen()},
      {"name": "Customer Contact", "icon": Icons.contact_mail, "screen": const CustomerContactScreen()},
      {"name": "Privacy Policy", "icon": Icons.privacy_tip, "screen": const PrivacyPolicyScreen()},
      {"name": "Cancellation Policy", "icon": Icons.cancel, "screen": const CancellationPolicyScreen()},
      {"name": "Terms of Service", "icon": Icons.description, "screen": const PrivacyPolicyScreen()},
      {"name": "FAQ's", "icon": Icons.help, "screen": const FAQManagementScreen()},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 2.2,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () => _navigateTo(context, items[index]['screen']),
          child: Container(
            decoration: BoxDecoration(color: cardBg, borderRadius: BorderRadius.circular(12)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(items[index]['icon'], color: Colors.white70, size: 18),
                const SizedBox(width: 8),
                Flexible(child: Text(items[index]['name'], style: const TextStyle(color: Colors.white, fontSize: 11), overflow: TextOverflow.ellipsis)),
              ],
            ),
          ),
        );
      },
    );
  }
}
