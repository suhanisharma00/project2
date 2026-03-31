import 'package:flutter/material.dart';

class AddModeratorScreen extends StatelessWidget {
  const AddModeratorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D1127),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2B3354),
        title: const Text("👤 Register New Moderator", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildSection(
              title: "Account Information",
              subtitle: "Set up login credentials for the moderator.",
              color: const Color(0xFF2B3354),
              children: [
                _buildTextField("User Name *", "e.g., jhon_doe", Icons.person_outline),
                _buildTextField("Email *", "e.g., john.doe@example.com", Icons.email_outlined),
                _buildTextField("Password *", "Enter Password", Icons.lock_outline),
                const Padding(
                  padding: EdgeInsets.only(top: 4),
                  child: Text("Min. 8 characters, be sure to use numbers.", style: TextStyle(color: Colors.white54, fontSize: 11)),
                ),
              ],
            ),
            _buildSection(
              title: "Personal Information",
              subtitle: "Provide the moderator's personal details.",
              color: const Color(0xFF3F51B5),
              children: [
                _buildDropdown("Gender *", "Select Gender", Icons.people_outline),
                _buildTextField("Date of Birth *", "dd-mm-yyyy", Icons.calendar_today),
                _buildTextField("Phone *", "8976451230", Icons.phone_android),
                _buildTextField("Whatsapp Phone", "8976451230", Icons.chat_outlined),
                _buildTextField("Blood Group", "e.g., O+", Icons.favorite_border),
                _buildFilePicker("Moderator Photo", "Accepts image in JPG, PNG, GIF."),
              ],
            ),
            _buildSection(
              title: "Address Information",
              subtitle: "Provide the moderator's physical address.",
              color: const Color(0xFF0097A7),
              children: [
                _buildTextField("Address *", "Enter Full Address", Icons.location_on_outlined, maxLines: 2),
                _buildTextField("City *", "e.g., Jaipur", Icons.location_city),
                _buildTextField("State *", "e.g., Rajasthan", Icons.map_outlined),
                _buildTextField("Pincode *", "e.g., 302001", Icons.pin_drop_outlined),
              ],
            ),
            _buildSection(
              title: "Employment Information",
              subtitle: "Details about the moderator's employment with the system.",
              color: const Color(0xFF2E7D32),
              children: [
                _buildTextField("Position *", "e.g., Senior Moderator", Icons.work_outline),
                _buildDropdown("Employment Type *", "Select", Icons.badge_outlined),
                _buildTextField("Joining Date *", "dd-mm-yyyy", Icons.calendar_today),
                _buildTextField("Experience (in years) *", "e.g., 5", Icons.history_edu),
                _buildTextField("Salary", "e.g., 50000", Icons.payments_outlined),
                _buildTextField("Reference", "e.g., John Smith", Icons.person_search),
              ],
            ),
            _buildSection(
              title: "Educational Information",
              subtitle: "Academic qualifications and associated documents.",
              color: const Color(0xFF6D4C41),
              children: [
                _buildTextField("Qualification", "e.g., B.Tech, MBA", Icons.school_outlined),
                _buildTextField("X Marks", "e.g., 90", Icons.description_outlined),
                _buildFilePicker("X Marksheet Photo", ""),
                _buildTextField("XII Marks", "e.g., 85", Icons.description_outlined),
                _buildFilePicker("XII Marksheet Photo", ""),
                _buildFilePicker("Resume (PDF, DOC, DOCX)", "Upload doc to see magic."),
              ],
            ),
            _buildSection(
              title: "Documents & Identification",
              subtitle: "Important identification details for verification purposes.",
              color: const Color(0xFFD32F2F),
              children: [
                _buildTextField("Aadhar Number *", "e.g., 1234 5678 9101", Icons.fingerprint),
                _buildFilePicker("Aadhar Photo *", ""),
              ],
            ),
            _buildSection(
              title: "Banking Information",
              subtitle: "Bank details for salary and other transactions.",
              color: const Color(0xFFC2185B),
              children: [
                _buildTextField("Bank Account Number", "e.g., 123456789012", Icons.account_balance_outlined),
                _buildTextField("IFSC Code", "e.g., SBIN0001234", Icons.code),
                _buildTextField("Bank Name", "e.g., State Bank of India", Icons.apartment),
                _buildTextField("Branch Name", "e.g., Main Branch", Icons.location_on_outlined),
              ],
            ),
            _buildSection(
              title: "Emergency Contact",
              subtitle: "Contact details of a person to call in case of emergency.",
              color: const Color(0xFF7B1FA2),
              children: [
                _buildTextField("Emergency Contact Name", "e.g., Jhon Doe", Icons.person_outline),
                _buildTextField("Emergency Contact Number", "9876543210", Icons.phone_outlined),
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
                    child: const Text("ADD MODERATOR DETAILS", style: TextStyle(fontWeight: FontWeight.bold)),
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
                hint: Text(hint, style: const TextStyle(color: Colors.white38, fontSize: 13)),
                dropdownColor: const Color(0xFF2B3354),
                items: [],
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
