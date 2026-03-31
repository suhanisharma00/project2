import 'package:flutter/material.dart';

class FAQManagementScreen extends StatelessWidget {
  const FAQManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D1127),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("FAQ Management", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
            Text("Manage frequently asked questions", style: TextStyle(color: Colors.white70, fontSize: 12)),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add_circle, size: 16),
              label: const Text("CREATE NEW FAQ", style: TextStyle(fontSize: 10)),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2B3354),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(color: const Color(0xFF607D8B).withOpacity(0.3), borderRadius: BorderRadius.circular(8)),
              child: const Text("Total FAQs: 12", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 20),
            _buildFAQCard(
              "WHAT IS EDUPHIN ERP SOFTWARE?",
              "Eduphin ERP is an all-in-one School and College Management Software developed by Octopyder Services Pvt. Ltd. It helps educational institutions manage academic, administrative, and financial operations efficiently — including attendance, admissions, fee management, exams, communication, and more.",
              "Nov 22, 2025 at 09:53 AM",
            ),
            _buildFAQHeaderOnly("WHO CAN USE EDUPHIN ERP?"),
            _buildFAQHeaderOnly("WHAT MODULES ARE INCLUDED IN EDUPHIN ERP?"),
          ],
        ),
      ),
    );
  }

  Widget _buildFAQCard(String question, String answer, String updated) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF1C223D),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Text(question, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13))),
                Row(
                  children: [
                    _buildSmallIconBtn(Icons.edit, Colors.blue),
                    const SizedBox(width: 8),
                    _buildSmallIconBtn(Icons.delete, Colors.red),
                  ],
                ),
              ],
            ),
          ),
          const Divider(color: Colors.white24, height: 1),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(answer, style: const TextStyle(color: Colors.white70, fontSize: 13, height: 1.5)),
                const SizedBox(height: 16),
                const Divider(color: Colors.white24, height: 1),
                const SizedBox(height: 8),
                Text("Last updated: $updated", style: const TextStyle(color: Colors.white38, fontSize: 11)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFAQHeaderOnly(String question) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1C223D),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Text(question, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13))),
          Row(
            children: [
              _buildSmallIconBtn(Icons.edit, Colors.blue),
              const SizedBox(width: 8),
              _buildSmallIconBtn(Icons.delete, Colors.red),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSmallIconBtn(IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(color: color.withOpacity(0.2), borderRadius: BorderRadius.circular(4), border: Border.all(color: color)),
      child: Icon(icon, color: Colors.white, size: 14),
    );
  }
}

class CreateFAQModal extends StatelessWidget {
  const CreateFAQModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Color(0xFF0D1127), borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(color: Color(0xFF3F51B5), borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    Icon(Icons.add_circle, color: Colors.white, size: 20),
                    SizedBox(width: 8),
                    Text("Create New FAQ", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  ],
                ),
                IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.close, color: Colors.white)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Question *", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                _buildField("Enter your question here...."),
                const SizedBox(height: 20),
                const Text("Answer *", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                _buildField("Provide a detailed answer....", maxLines: 5),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(onPressed: () => Navigator.pop(context), child: const Text("CANCEL", style: TextStyle(color: Colors.white70))),
                    const SizedBox(width: 16),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.save, size: 16),
                      label: const Text("CREATE FAQ"),
                      style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF3F51B5)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildField(String hint, {int maxLines = 1}) {
    return TextField(
      maxLines: maxLines,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white38, fontSize: 13),
        filled: true,
        fillColor: const Color(0xFF2B3354),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
      ),
    );
  }
}
