import 'package:flutter/material.dart';

class LibrarianProfilePage extends StatefulWidget {
  const LibrarianProfilePage({super.key});

  @override
  State<LibrarianProfilePage> createState() => _LibrarianProfilePageState();
}

class _LibrarianProfilePageState extends State<LibrarianProfilePage> {
  static const Color bgColor = Color(0xFF0B0D18);
  static const Color cardColor = Color(0xFF1B2238);
  static const Color fieldColor = Color(0xFF323B5C);
  static const Color accentBlue = Color(0xFF4A89FF);

  String selectedGender = "MALE";
  String selectedDob = "12-08-1985";

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(1985, 8, 12),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.dark(
              primary: accentBlue,
              onPrimary: Colors.white,
              surface: cardColor,
              onSurface: Colors.white,
            ),
            dialogBackgroundColor: bgColor,
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        selectedDob = "${picked.day.toString().padLeft(2, '0')}-${picked.month.toString().padLeft(2, '0')}-${picked.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Profile", style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            /// TOP PROFILE CARD
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white24,
                    child: Text("NK", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Neelam Kapoor",
                    style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Librarian",
                    style: TextStyle(color: Colors.white60, fontSize: 14),
                  ),
                  Text(
                    "EMP-LIB-789",
                    style: TextStyle(color: Colors.white38, fontSize: 12),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// PERSONAL INFORMATION
            buildSection(
              title: "Personal Information",
              icon: Icons.person_outline,
              color: Colors.blueAccent,
              children: [
                buildDropdownField("Gender *", selectedGender, ["MALE", "FEMALE", "OTHER"], (val) {
                  setState(() => selectedGender = val!);
                }),
                buildDateField("Date of Birth *", selectedDob, () => _selectDate(context)),
                buildTextField("Phone", "98123-45678"),
                buildTextField("Alternate Phone", "94180-55678"),
                buildTextField("Relationship Status", "Married"),
                buildFileField("Update Photo"),
              ],
            ),

            /// ADDRESS INFORMATION
            buildSection(
              title: "Address Information",
              icon: Icons.location_on_outlined,
              color: Colors.greenAccent,
              children: [
                buildTextField("Address *", "Flat No. 101, Lotus Heights, Sector 14", maxLines: 2),
                buildTextField("City *", "Lucknow"),
                buildTextField("State *", "Uttar Pradesh"),
                buildTextField("PINCODE *", "226017"),
              ],
            ),

            /// BANKING INFORMATION
            buildSection(
              title: "Banking Information",
              icon: Icons.account_balance_outlined,
              color: Colors.orangeAccent,
              children: [
                buildTextField("Bank Account Number", "560012340987"),
                buildTextField("IFSC Code", "HDFC0007890"),
                buildTextField("Bank Name", "HDFC Bank"),
                buildTextField("Branch Name", "Gomti Nagar, Lucknow"),
              ],
            ),

            /// EMERGENCY CONTACT
            buildSection(
              title: "Emergency Contact",
              icon: Icons.phone_android_outlined,
              color: Colors.redAccent,
              children: [
                buildTextField("Emergency Contact Name", "Ramesh Kapoor"),
                buildTextField("Emergency Contact Number", "98765-43210"),
              ],
            ),

            /// SECURITY SETTINGS
            buildSection(
              title: "Security Settings",
              icon: Icons.lock_outline,
              color: Colors.purpleAccent,
              children: [
                buildTextField("New Password", "", isPassword: true),
              ],
            ),

            /// ACCOUNT DETAILS
            buildSection(
              title: "Account Details",
              icon: Icons.account_circle_outlined,
              color: Colors.tealAccent,
              isReadOnly: true,
              children: [
                buildTextField("USER NAME", "Neelam Kapoor"),
                buildTextField("EMAIL ADDRESS", "neelam@iias.com"),
              ],
            ),

            /// EMPLOYMENT DETAILS
            buildSection(
              title: "Employment Details",
              icon: Icons.badge_outlined,
              color: Colors.amberAccent,
              isReadOnly: true,
              children: [
                buildTextField("POSITION", "Librarian"),
                buildTextField("EMPLOYMENT TYPE", "Full-time"),
                buildTextField("JOINING DATE", "20 Jun 2017"),
                buildTextField("EXPERIENCE", "8 years"),
                buildStatusField("STATUS", "LIVE"),
              ],
            ),

            /// EDUCATION & DOCUMENTS
            buildSection(
              title: "Education & Documents",
              icon: Icons.school_outlined,
              color: Colors.indigoAccent,
              isReadOnly: true,
              children: [
                buildTextField("QUALIFICATION", "M.Lib.I.Sc. (Master of Library and Information Science)"),
                buildTextField("X MARKS", "92%"),
                buildTextField("XII MARKS", "94%"),
                buildTextField("AADHAAR NUMBER", "XXXX XXXX 6543"),
              ],
            ),

            const SizedBox(height: 30),

            /// SAVE BUTTON
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.save, color: Colors.white),
                label: const Text("SAVE CHANGES", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: accentBlue,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget buildSection({
    required String title,
    required IconData icon,
    required Color color,
    required List<Widget> children,
    bool isReadOnly = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 20),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              if (isReadOnly)
                const Text("READ ONLY", style: TextStyle(color: Colors.white24, fontSize: 10, fontWeight: FontWeight.bold)),
            ],
          ),
          const Divider(color: Colors.white10, height: 24),
          ...children,
        ],
      ),
    );
  }

  Widget buildTextField(String label, String value, {bool isPassword = false, int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(color: Colors.white70, fontSize: 13)),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            decoration: BoxDecoration(
              color: fieldColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              isPassword ? "********" : value,
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDropdownField(String label, String value, List<String> items, Function(String?) onChanged) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(color: Colors.white70, fontSize: 13)),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: fieldColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: items.contains(value) ? value : items.first,
                dropdownColor: fieldColor,
                icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white38),
                style: const TextStyle(color: Colors.white, fontSize: 14),
                items: items.map((String item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                onChanged: onChanged,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDateField(String label, String value, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(color: Colors.white70, fontSize: 13)),
          const SizedBox(height: 8),
          InkWell(
            onTap: onTap,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              decoration: BoxDecoration(
                color: fieldColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      value,
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                  const Icon(Icons.calendar_today, color: Colors.white38, size: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFileField(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(color: Colors.white70, fontSize: 13)),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: fieldColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Text("Choose File", style: TextStyle(color: Colors.white, fontSize: 12)),
                ),
                const SizedBox(width: 12),
                const Text("No File Chosen", style: TextStyle(color: Colors.white38, fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildStatusField(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(color: Colors.white70, fontSize: 13)),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.orange.withOpacity(0.2),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(value, style: const TextStyle(color: Colors.orangeAccent, fontSize: 12, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
