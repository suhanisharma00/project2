
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F172A),
        elevation: 0,
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _profileHeader(),
            const SizedBox(height: 16),
            _section(
              title: 'Personal Information',
              editable: true,
              child: Column(children: const [
                _Field(label: 'Gender', value: 'Male'),
                _Field(label: 'Date of Birth', value: '12-08-1985'),
                _Field(label: 'Phone', value: '9812344567'),
                _Field(label: 'Alternate Phone', value: '9418055678'),
                _Field(label: 'Relationship Status', value: 'Married'),
              ]),
            ),
            _section(
              title: 'Address Information',
              editable: true,
              child: Column(children: const [
                _Field(label: 'Address', value: 'Flat No.101, Lotus Heights, Sector 14'),
                _Field(label: 'City', value: 'Lucknow'),
                _Field(label: 'State', value: 'Uttar Pradesh'),
                _Field(label: 'Pincode', value: '226017'),
              ]),
            ),
            _section(
              title: 'Banking Information',
              editable: true,
              child: Column(children: const [
                _Field(label: 'Account Number', value: '560012340987'),
                _Field(label: 'IFSC Code', value: 'HDFC0007890'),
                _Field(label: 'Bank Name', value: 'HDFC Bank'),
                _Field(label: 'Branch', value: 'Gomti Nagar, Lucknow'),
              ]),
            ),
            _section(
              title: 'Employment Details',
              readOnly: true,
              child: Column(children: const [
                _Field(label: 'Position', value: 'Senior Mathematics Teacher'),
                _Field(label: 'Employment Type', value: 'Full-time'),
                _Field(label: 'Joining Date', value: '20 Jun 2017'),
                _Field(label: 'Experience', value: '8 Years'),
                _StatusChip(),
              ]),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF334155),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {},
                child: const Text('SAVE CHANGES'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget _profileHeader() {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: const Color(0xFF1E293B),
      borderRadius: BorderRadius.circular(16),
    ),
    child: Column(
      children: const [
        CircleAvatar(radius: 32, backgroundColor: Colors.white24, child: Icon(Icons.person, size: 40)),
        SizedBox(height: 8),
        Text('Devansh Mehra', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
        Text('Teachers', style: TextStyle(color: Colors.white70)),
        Text('devansh@iias.com', style: TextStyle(color: Colors.white54)),
      ],
    ),
  );
}

Widget _section({required String title, required Widget child, bool editable = false, bool readOnly = false}) {
  return Container(
    margin: const EdgeInsets.only(bottom: 16),
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: const Color(0xFF1E293B),
      borderRadius: BorderRadius.circular(16),
    ),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          if (editable)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(color: Colors.white24, borderRadius: BorderRadius.circular(12)),
              child: const Text('Editable', style: TextStyle(color: Colors.white, fontSize: 12)),
            ),
          if (readOnly)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(color: Colors.white24, borderRadius: BorderRadius.circular(12)),
              child: const Text('Read only', style: TextStyle(color: Colors.white, fontSize: 12)),
            ),
        ],
      ),
      const SizedBox(height: 12),
      child,
    ]),
  );
}

class _Field extends StatelessWidget {
  final String label;
  final String value;
  const _Field({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(label, style: const TextStyle(color: Colors.white70, fontSize: 12)),
        const SizedBox(height: 6),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          decoration: BoxDecoration(color: const Color(0xFF334155), borderRadius: BorderRadius.circular(10)),
          child: Text(value, style: const TextStyle(color: Colors.white)),
        ),
      ]),
    );
  }
}

class _StatusChip extends StatelessWidget {
  const _StatusChip();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Chip(
        backgroundColor: Colors.blue,
        label: const Text('Live', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
