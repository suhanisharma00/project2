import 'package:flutter/material.dart';

class EditModeratorScreen extends StatelessWidget {
  final String moderatorName;
  const EditModeratorScreen({super.key, this.moderatorName = "Priya S. Verma"});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D1127),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2B3354),
        title: Text("👤 Edit Moderator: $moderatorName", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildSection(
              title: "Account Information",
              subtitle: "Update login credentials for the moderator.",
              color: const Color(0xFF2B3354),
              children: [
                _buildTextField("User Name *", "priya_verma", Icons.person_outline),
                _buildTextField("Email *", "priya.v@example.com", Icons.email_outlined),
                _buildTextField("Password *", "********", Icons.lock_outline),
                const Padding(
                  padding: EdgeInsets.only(top: 4),
                  child: Text("Min. 8 characters, be sure to use numbers.", style: TextStyle(color: Colors.white54, fontSize: 11)),
                ),
              ],
            ),
            _buildSection(
              title: "Personal Information",
              subtitle: "Update the moderator's personal details.",
              color: const Color(0xFF3F51B5),
              children: [
                _buildDropdown("Gender *", "Female", Icons.people_outline),
                _buildTextField("Date of Birth *", "12-05-1995", Icons.calendar_today),
                _buildTextField("Phone *", "9876543210", Icons.phone_android),
                _buildTextField("Whatsapp Phone", "9876543210", Icons.chat_outlined),
                _buildTextField("Blood Group", "B+", Icons.favorite_border),
                _buildFilePicker("Moderator Photo", "Accepts image in JPG, PNG, GIF."),
              ],
            ),
            _buildSection(
              title: "Address Information",
              subtitle: "Update the moderator's school/home address.",
              color: const Color(0xFF0097A7),
              children: [
                _buildTextField("Address *", "123, Street Name, Area", Icons.location_on_outlined, maxLines: 2),
                _buildTextField("City *", "New Delhi", Icons.location_city),
                _buildTextField("State *", "Delhi", Icons.map_outlined),
                _buildTextField("Pincode *", "110001", Icons.pin_drop_outlined),
              ],
            ),
            _buildSection(
              title: "Employment Information",
              subtitle: "Update the moderator's employment details.",
              color: const Color(0xFF2E7D32),
              children: [
                _buildTextField("Position *", "Assistant", Icons.work_outline),
                _buildDropdown("Employment Type *", "Full-time", Icons.badge_outlined),
                _buildTextField("Joining Date *", "10-01-2023", Icons.calendar_today),
                _buildTextField("Experience (in years) *", "3", Icons.history_edu),
                _buildTextField("Salary", "35000", Icons.payments_outlined),
                _buildTextField("Reference", "Dr. Mehta", Icons.person_search),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3F51B5),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: const Text("UPDATE MODERATOR DETAILS", style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back, size: 16),
                    label: const Text("BACK"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFD32F2F),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({required String title, required String subtitle, required Color color, required List<Widget> children}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(color: const Color(0xFF1C223D), borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.white10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: color, borderRadius: const BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                Text(subtitle, style: const TextStyle(color: Colors.white70, fontSize: 11), textAlign: TextAlign.center),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(children: children),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, String hint, IconData icon, {int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.white, size: 16),
              const SizedBox(width: 8),
              Text(label, style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 8),
          TextField(
            maxLines: maxLines,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(color: Colors.white38, fontSize: 13),
              filled: true,
              fillColor: const Color(0xFF2B3354),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdown(String label, String hint, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.white, size: 16),
              const SizedBox(width: 8),
              Text(label, style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(color: const Color(0xFF2B3354), borderRadius: BorderRadius.circular(8)),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                isExpanded: true,
                hint: Text(hint, style: const TextStyle(color: Colors.white, fontSize: 13)),
                dropdownColor: const Color(0xFF2B3354),
                items: [hint].map((e) => DropdownMenuItem(value: e, child: Text(e, style: const TextStyle(color: Colors.white)))).toList(),
                onChanged: (v) {},
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilePicker(String label, String info) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.attachment, color: Colors.white, size: 16),
              const SizedBox(width: 8),
              Text(label, style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(color: const Color(0xFF2B3354), borderRadius: BorderRadius.circular(8)),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: const BoxDecoration(color: Color(0xFF1C223D), borderRadius: BorderRadius.only(topLeft: Radius.circular(8), bottomLeft: Radius.circular(8))),
                  child: const Text("Choose File", style: TextStyle(color: Colors.white, fontSize: 12)),
                ),
                const Expanded(child: Padding(padding: EdgeInsets.only(left: 12), child: Text("No File Chosen", style: TextStyle(color: Colors.white38, fontSize: 12)))),
              ],
            ),
          ),
          if (info.isNotEmpty) Padding(padding: const EdgeInsets.only(top: 4), child: Text(info, style: const TextStyle(color: Colors.white54, fontSize: 11))),
        ],
      ),
    );
  }
}
