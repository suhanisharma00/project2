import 'package:flutter/material.dart';

class ViewClassSchedulePage extends StatefulWidget {
  const ViewClassSchedulePage({super.key});

  @override
  State<ViewClassSchedulePage> createState() => _ViewClassSchedulePageState();
}

class _ViewClassSchedulePageState extends State<ViewClassSchedulePage> {

  String? selectedClass;
  String? selectedSection;

  final List<String> classList = [
    "BBA",
    "BCA",
    "BCom",
    "MBA"
  ];

  final List<String> sectionList = [
    "A",
    "B",
    "C"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B1220),

      appBar: AppBar(
        backgroundColor: const Color(0xFF2E3A59),
        elevation: 0,
        title: const Row(
          children: [
            Icon(Icons.calendar_today, color: Colors.white),
            SizedBox(width: 10),
            Text(
              "View Class Schedule",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),

      body: Center(
        child: Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xFF3B4668),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// Class Label
              const Text(
                "Class *",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              /// Class Dropdown
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: const Color(0xFF5E6A75),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    dropdownColor: const Color(0xFF5E6A75),
                    value: selectedClass,
                    hint: const Text(
                      "Select Class",
                      style: TextStyle(color: Colors.white70),
                    ),
                    icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white),
                    isExpanded: true,
                    items: classList.map((value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(value, style: const TextStyle(color: Colors.white)),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedClass = value;
                      });
                    },
                  ),
                ),
              ),

              const SizedBox(height: 20),

              /// Section Label
              const Text(
                "Section *",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              /// Section Dropdown
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: const Color(0xFF5E6A75),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    dropdownColor: const Color(0xFF5E6A75),
                    value: selectedSection,
                    hint: const Text(
                      "Select Section",
                      style: TextStyle(color: Colors.white70),
                    ),
                    icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white),
                    isExpanded: true,
                    items: sectionList.map((value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(value, style: const TextStyle(color: Colors.white)),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedSection = value;
                      });
                    },
                  ),
                ),
              ),

              const SizedBox(height: 30),

              /// SHOW Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3D63A8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () {
                    print("Class: $selectedClass");
                    print("Section: $selectedSection");
                  },
                  icon: const Icon(Icons.search, color: Colors.white),
                  label: const Text(
                    "SHOW",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
