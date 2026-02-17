import 'package:flutter/material.dart';

class VirtualIdCardPage extends StatelessWidget {
  const VirtualIdCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B1220),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B1220),
        elevation: 0,
        title: const Text("Employee ID"),
      ),
      body: Center(
        child: Container(
          width: 360,
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFF1E293B),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              /// HEADER
              Column(
                children: const [
                  Text(
                    "Indian Institute of Applied Sciences (IIAS)",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Iot No. 88, Knowledge Park, Mock Industrial Estate,\nDelhi\nNew Delhi 102030",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              /// PROFILE ICON
              const CircleAvatar(
                radius: 40,
                backgroundColor: Color(0xFF334155),
                child: Icon(Icons.person, size: 40, color: Colors.white),
              ),

              const SizedBox(height: 12),

              const Text(
                "EMPLOYEE ID",
                style: TextStyle(color: Colors.grey),
              ),

              const SizedBox(height: 12),

              /// DETAILS CARD
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: const Color(0xFF475569),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Column(
                  children: const [
                    Text(
                      "Devansh Mehra",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    SizedBox(height: 12),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        info("Position", "Senior Mathematics Teacher"),
                        info("Employee ID", "EMP0005"),
                      ],
                    ),

                    SizedBox(height: 8),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        info("Employment Type", "Full-time"),
                        info("Joining Date", "20 Jun 2017"),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              /// SIGNATURE
              Container(
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color(0xFF334155),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  "Authorized Signature",
                  style: TextStyle(color: Colors.white),
                ),
              ),

              const SizedBox(height: 20),

              /// BUTTONS
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.print),
                      label: const Text("PRINT ID CARD"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2563EB),
                      ),
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.picture_as_pdf),
                      label: const Text("DOWNLOAD PDF"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2563EB),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              /// FLIP
              OutlinedButton(
                onPressed: () {},
                child: const Text("FLIP CARD"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

/// SMALL INFO WIDGET
class info extends StatelessWidget {
  final String title;
  final String value;

  const info(this.title, this.value, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(color: Colors.grey, fontSize: 12)),
          const SizedBox(height: 2),
          Text(value,
              style: const TextStyle(color: Colors.white, fontSize: 13)),
        ],
      ),
    );
  }
}
