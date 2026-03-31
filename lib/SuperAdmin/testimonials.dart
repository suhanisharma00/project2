import 'package:flutter/material.dart';

class TestimonialsManagementScreen extends StatelessWidget {
  const TestimonialsManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D1127),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Testimonials Management", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add, size: 16),
              label: const Text("ADD NEW TESTIMONIAL", style: TextStyle(fontSize: 10)),
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
          children: [
            _buildTestimonialDirectory(),
          ],
        ),
      ),
    );
  }

  Widget _buildTestimonialDirectory() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: const Color(0xFF1C223D), borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.list, color: Colors.white, size: 20),
              SizedBox(width: 8),
              Text("Testimonial Directory", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ],
          ),
          const Text("Manage all customer and user testimonials.", style: TextStyle(color: Colors.white60, fontSize: 12)),
          const SizedBox(height: 16),
          Row(
            children: [
              const Text("show entries", style: TextStyle(color: Colors.white, fontSize: 12)),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(color: const Color(0xFF2B3354), borderRadius: BorderRadius.circular(4)),
                child: const Text("10", style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(color: const Color(0xFF2B3354), borderRadius: BorderRadius.circular(8)),
            child: const Text("Search Remarks", style: TextStyle(color: Colors.white38, fontSize: 13)),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              _buildIconBtn(Icons.description, Colors.teal),
              const SizedBox(width: 8),
              _buildIconBtn(Icons.print, Colors.green),
              const SizedBox(width: 8),
              _buildIconBtn(Icons.picture_as_pdf, Colors.red),
              const SizedBox(width: 8),
              _buildIconBtn(Icons.copy, Colors.blue),
            ],
          ),
          const SizedBox(height: 16),
          _buildTable(),
        ],
      ),
    );
  }

  Widget _buildIconBtn(IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color),
      ),
      child: Icon(icon, color: Colors.white, size: 20),
    );
  }

  Widget _buildTable() {
    return Table(
      columnWidths: const {
        0: FlexColumnWidth(1),
        1: FlexColumnWidth(2),
        2: FlexColumnWidth(3),
      },
      children: [
        const TableRow(
          decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white24))),
          children: [
            Padding(padding: EdgeInsets.symmetric(vertical: 8), child: Text("#", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
            Padding(padding: EdgeInsets.symmetric(vertical: 8), child: Text("Image", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
            Padding(padding: EdgeInsets.symmetric(vertical: 8), child: Text("Name", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
          ],
        ),
        _buildTableRow("1", "Mr. Sandeep Rao'"),
      ],
    );
  }

  TableRow _buildTableRow(String id, String name) {
    return TableRow(
      decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white12))),
      children: [
        Padding(padding: const EdgeInsets.symmetric(vertical: 20), child: Text(id, style: const TextStyle(color: Colors.white70))),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.grey.shade400,
          ),
        ),
        Padding(padding: const EdgeInsets.symmetric(vertical: 20), child: Text(name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
      ],
    );
  }
}

class AddTestimonialScreen extends StatelessWidget {
  const AddTestimonialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D1127),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(icon: const Icon(Icons.add_circle, color: Colors.white), onPressed: () {}),
        title: const Text("Add New Testimonial", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        actions: [
          TextButton.icon(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back, color: Colors.white, size: 16),
            label: const Text("Back to Testimonials", style: TextStyle(color: Colors.white, fontSize: 12)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Container(
          decoration: BoxDecoration(color: const Color(0xFF1C223D), borderRadius: BorderRadius.circular(12)),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(color: Color(0xFFC2185B), borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12))),
                child: const Column(
                  children: [
                    Text("Testimonial Details", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                    Text("Fill in the details to add a new testimonial.", style: TextStyle(color: Colors.white70, fontSize: 12)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildLabel(Icons.person, "Full Name *"),
                    _buildTextField("e.g., John Doe"),
                    const SizedBox(height: 20),
                    _buildLabel(Icons.business_center, "Designation *"),
                    _buildTextField("e.g., Student, Parent, CEO"),
                    const SizedBox(height: 20),
                    _buildLabel(Icons.message, "Message *"),
                    _buildTextField("Write the Testimonial Message Here.....", maxLines: 5),
                    const SizedBox(height: 20),
                    _buildLabel(null, "Image *"),
                    _buildFilePicker(),
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.cancel, color: Colors.white),
                            label: const Text("CANCEL"),
                            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFD32F2F), padding: const EdgeInsets.symmetric(vertical: 12)),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.save, color: Colors.white),
                            label: const Text("SAVE TESTIMONIAL"),
                            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF3F51B5), padding: const EdgeInsets.symmetric(vertical: 12)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(IconData? icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          if (icon != null) ...[Icon(icon, color: Colors.white, size: 16), const SizedBox(width: 8)],
          Text(text, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  Widget _buildTextField(String hint, {int maxLines = 1}) {
    return TextField(
      maxLines: maxLines,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white38, fontSize: 13),
        filled: true,
        fillColor: const Color(0xFF454D66),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
      ),
    );
  }

  Widget _buildFilePicker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(color: const Color(0xFF454D66), borderRadius: BorderRadius.circular(8)),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(color: Colors.white12, borderRadius: BorderRadius.circular(8)),
                child: const Text("Choose File", style: TextStyle(color: Colors.white)),
              ),
              const Expanded(child: Padding(padding: EdgeInsets.only(left: 12), child: Text("No File Chosen", style: TextStyle(color: Colors.white38)))),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 4),
          child: Text("Accepts image files (JPG, PNG, GIF).", style: TextStyle(color: Colors.white54, fontSize: 11)),
        ),
      ],
    );
  }
}
