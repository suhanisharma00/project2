import 'package:flutter/material.dart';

class CounselorProfilePage extends StatefulWidget {
  const CounselorProfilePage({super.key});

  @override
  State<CounselorProfilePage> createState() => _CounselorProfilePageState();
}

class _CounselorProfilePageState extends State<CounselorProfilePage> {
  static const bgColor = Color(0xff0b1330);
  static const cardColor = Color(0xff2f3a5f);
  static const fieldColor = Color(0xff5b6b73);
  static const buttonColor = Color(0xff4f5d75);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(14),
          child: Column(
            children: [

              /// PROFILE TOP CARD
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Column(
                  children: const [
                    CircleAvatar(
                      radius: 28,
                      backgroundColor: Colors.white24,
                      child: Icon(Icons.person, size: 30, color: Colors.white),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Ananya R. Singh",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "ananya@iias.com",
                      style: TextStyle(color: Colors.white70, fontSize: 12),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              buildSection(
                title: "Personal Information",
                editable: true,
                children: [
                  buildField("Gender", "MALE"),
                  buildDateField("Date of Birth", "12-08-1985"),
                  buildField("Phone", "9812344567"),
                  buildField("Alternate Phone", "9418055678"),
                  buildField("Relationship Status", "Married"),
                  buildFileField("Update Photo"),
                ],
              ),

              buildSection(
                title: "Address Information",
                editable: true,
                children: [
                  buildField("Address", "Flat No. 101, Lotus Heights, Sector 14"),
                  buildField("City", "Lucknow"),
                  buildField("State", "Uttar Pradesh"),
                  buildField("Pincode", "226017"),
                ],
              ),

              buildSection(
                title: "Banking Information",
                editable: true,
                children: [
                  buildField("Bank Account Number", "560012340987"),
                  buildField("IFSC Code", "HDFC0007890"),
                  buildField("Bank Name", "HDFC Bank"),
                  buildField("Branch Name", "Gomti Nagar, Lucknow"),
                ],
              ),

              buildSection(
                title: "Security Settings",
                editable: true,
                children: [
                  buildField("New Password", ""),
                ],
              ),

              buildSection(
                title: "Account Details",
                readOnly: true,
                children: [
                  buildField("User Name", "Ananya R. Singh"),
                  buildField("Email Address", "ananya@iias.com"),
                ],
              ),

              buildSection(
                title: "Employment Details",
                readOnly: true,
                children: [
                  buildField("Position", "Senior Student Counselor"),
                  buildField("Employment Type", "Full-time"),
                  buildField("Joining Date", "Jun 20, 2017"),
                  buildField("Experience", "8 years"),
                  buildStatusField("Status", "Live"),
                ],
              ),

              buildSection(
                title: "Education & Documents",
                readOnly: true,
                children: [
                  buildField("Qualification", "M.A. Counselling Psychology"),
                  Row(
                    children: [
                      Expanded(child: buildField("X Marks", "92%")),
                      const SizedBox(width: 10),
                      Expanded(child: buildField("XII Marks", "94%")),
                    ],
                  ),
                  buildField("Aadhaar Number", "XXXX XXXX 6543"),
                ],
              ),

              const SizedBox(height: 20),

              /// SAVE BUTTON
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: buttonColor,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text("SAVE CHANGES"),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  /// SECTION CARD
  Widget buildSection({
    required String title,
    bool editable = false,
    bool readOnly = false,
    required List<Widget> children,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
              const Spacer(),
              if (editable)
                chip("Editable"),
              if (readOnly)
                chip("Read only"),
            ],
          ),
          const SizedBox(height: 12),
          ...children,
        ],
      ),
    );
  }

  Widget chip(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: fieldColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(text,
          style: const TextStyle(color: Colors.white, fontSize: 10)),
    );
  }

  Widget buildField(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(color: Colors.white70)),
          const SizedBox(height: 4),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            decoration: BoxDecoration(
              color: fieldColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(value,
                style: const TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget buildDateField(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(color: Colors.white70)),
          const SizedBox(height: 4),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            decoration: BoxDecoration(
              color: fieldColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Text(value,
                    style: const TextStyle(color: Colors.white)),
                const Spacer(),
                const Icon(Icons.calendar_month,
                    color: Colors.white70, size: 18),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFileField(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(color: Colors.white70)),
          const SizedBox(height: 4),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: fieldColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Row(
              children: [
                Text("Choose File", style: TextStyle(color: Colors.white)),
                Spacer(),
                Text("No File Chosen",
                    style: TextStyle(color: Colors.white70)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildStatusField(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(color: Colors.white70)),
          const SizedBox(height: 4),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(value,
                style: const TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
