import 'package:flutter/material.dart';

class AddInstituteScreen extends StatelessWidget {
  const AddInstituteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D1127),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2B3354),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("Institute Information", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Text("Fill in the details below to register a new institute.", style: TextStyle(fontSize: 12, color: Colors.white70)),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionHeader("Basic Details", Icons.info_outline),
            _buildTextField("Institute Name *", "e.g., ABC college of Technology", Icons.business),
            _buildTextField("Institute Code *", "e.g., INST001", Icons.tag),
            _buildFilePicker("Institute Logo *"),
            _buildTextField("Established Year *", "2026", Icons.calendar_today),
            
            const SizedBox(height: 24),
            _buildSectionHeader("Location & Contact", null),
            _buildTextField("Address *", "Enter full institute address", Icons.location_on, maxLines: 3),
            _buildTextField("City *", "e.g., jaipur", Icons.location_city),
            _buildTextField("State *", "Rajasthan", Icons.map),
            _buildTextField("Pincode *", "302001", Icons.pin_drop),
            _buildTextField("Contact Email *", "info@example.com", Icons.email),
            _buildTextField("Contact Phone *", "9876543210", Icons.phone),
            _buildTextField("Website (Optional)", "https://www.example.com", Icons.language),

            const SizedBox(height: 24),
            _buildSectionHeader("Additional Information", null),
            _buildTextField("Chairman Name *", "Dr. Jain Due", Icons.person),
            _buildTextField("Affiliation Details *", "Provide Details About Affiliation", Icons.handshake, maxLines: 3),
            _buildTextField("GST Number *", "07ABCDE1234F1Z5", Icons.receipt_long),
            _buildTextField("PAN Number *", "ABCDE1234F", Icons.badge),
            
            const SizedBox(height: 16),
            const Text("Institute Status", style: TextStyle(color: Colors.white, fontSize: 13)),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(color: const Color(0xFF2B3354), borderRadius: BorderRadius.circular(8)),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: "Active",
                  dropdownColor: const Color(0xFF2B3354),
                  style: const TextStyle(color: Colors.white),
                  items: ["Active", "Inactive"].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                  onChanged: (v) {},
                ),
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.send, size: 18),
                label: const Text("CREATE INSTITUTE"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3F51B5),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, IconData? icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Text(title, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
          if (icon != null) ...[const SizedBox(width: 8), Icon(icon, color: Colors.white, size: 16)],
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
              Text(label, style: const TextStyle(color: Colors.white, fontSize: 13)),
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

  Widget _buildFilePicker(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.image, color: Colors.white, size: 16),
              const SizedBox(width: 8),
              Text(label, style: const TextStyle(color: Colors.white, fontSize: 13)),
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
                  child: const Text("choose file", style: TextStyle(color: Colors.white, fontSize: 13)),
                ),
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 12),
                    child: Text("No file chosen", style: TextStyle(color: Colors.white38, fontSize: 13)),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          const Text("Accepts image files (JPG, PNG, GIF).", style: TextStyle(color: Colors.white54, fontSize: 11)),
        ],
      ),
    );
  }
}
