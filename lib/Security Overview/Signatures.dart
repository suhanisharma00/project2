import 'package:flutter/material.dart';

class SignaturesPage extends StatefulWidget {
  const SignaturesPage({super.key});

  @override
  State<SignaturesPage> createState() => _SignaturesPageState();
}

class _SignaturesPageState extends State<SignaturesPage> {
  static const Color bgColor = Color(0xFF0B1221);
  static const Color cardColor = Color(0xFF1E293B);
  static const Color accentBlue = Colors.blue;
  static const Color accentRed = Colors.redAccent;
  static const Color accentYellow = Colors.orangeAccent;
  static const Color accentPurple = Colors.purpleAccent;
  static const Color accentGreen = Colors.tealAccent;

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
        title: const Text(
          "NexusEDR / Signatures",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.dark_mode_outlined, color: Colors.white70),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Malware Signatures",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "2,419,803 MD5 HASHES · VIRUSSHARE · CLAMAV · CUSTOM DATABASES",
                      style: TextStyle(color: Colors.white38, fontSize: 10),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),

            /// Action Buttons
            Row(
              children: [
                _topActionButton("Add Single", isFilled: false),
                const SizedBox(width: 12),
                _topActionButton("Import Database", isFilled: true),
              ],
            ),
            const SizedBox(height: 24),

            /// Stats Grid
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.6,
              children: const [
                StatBox(title: "Total Signatures", value: "2.4M", color: accentBlue, subtitle: "MD5 hashes"),
                StatBox(title: "Database Status", value: "Active", color: accentYellow, subtitle: "Real-time matching"),
                StatBox(title: "Last Updated", value: "2h", color: accentPurple, subtitle: "Virusshare updated"),
                StatBox(title: "Matches Today", value: "4", color: accentGreen, subtitle: "Files tagged"),
              ],
            ),
            const SizedBox(height: 24),

            /// Signature Sources
            _sectionHeader(Icons.hub_outlined, "Signature Sources"),
            const SizedBox(height: 16),
            _sourceItem("VirusShare", 0.7, "1,892,441"),
            _sourceItem("ClamAV Database", 0.4, "401,220"),
            _sourceItem("Custom / Manual", 0.2, "125,142"),
            const SizedBox(height: 24),

            /// Supported Formats
            _sectionHeader(Icons.folder_open_outlined, "Supported Formats"),
            const SizedBox(height: 16),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 2.2,
              children: [
                _formatCard("Plain MD5 list (.txt)"),
                _formatCard("hash:name (.csv)"),
                _formatCard("ClamAV .hdb"),
                _formatCard("VirusShare lists"),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.white10),
              ),
              child: const Text(
                "# Format examples:\na3f9b2c1d4e5f6g7h8c9d0e1f2a3b4c5\na3f9b2...: Trojan.GenericKD\na3f9b2...: d3-12345:Win.Malware.Agent",
                style: TextStyle(color: accentGreen, fontFamily: 'monospace', fontSize: 11),
              ),
            ),
            const SizedBox(height: 24),

            /// Search
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.white12),
              ),
              child: const TextField(
                style: TextStyle(color: Colors.white, fontSize: 13),
                decoration: InputDecoration(
                  icon: Icon(Icons.search, color: Colors.white38, size: 18),
                  hintText: "Search by MD5 hash or malware name...",
                  hintStyle: TextStyle(color: Colors.white38),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 12),
            _dropdownField("All Sources"),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: accentBlue, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                child: const Text("Search", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 32),

            /// Table Section
            _signatureTable(),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _topActionButton(String text, {required bool isFilled}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isFilled ? accentBlue : Colors.transparent,
        border: isFilled ? null : Border.all(color: Colors.white24),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
    );
  }

  Widget _sectionHeader(IconData icon, String title) {
    return Row(
      children: [
        Icon(icon, color: Colors.white54, size: 20),
        const SizedBox(width: 8),
        Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
      ],
    );
  }

  Widget _sourceItem(String title, double progress, String count) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: const TextStyle(color: Colors.white, fontSize: 12)),
              Text(count, style: const TextStyle(color: accentBlue, fontSize: 12)),
            ],
          ),
          const SizedBox(height: 6),
          LinearProgressIndicator(value: progress, color: accentBlue, backgroundColor: Colors.white12, minHeight: 4),
        ],
      ),
    );
  }

  Widget _formatCard(String label) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Format", style: TextStyle(color: Colors.white38, fontSize: 10)),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(color: Colors.white70, fontSize: 11, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _dropdownField(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text, style: const TextStyle(color: Colors.white70, fontSize: 13)),
          const Icon(Icons.keyboard_arrow_down, color: Colors.white38),
        ],
      ),
    );
  }

  Widget _signatureTable() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Header Row
          const Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(flex: 2, child: Text("MD5 Hash", style: TextStyle(color: Colors.white54, fontSize: 11))),
                Expanded(flex: 2, child: Text("Malware Name", style: TextStyle(color: Colors.white54, fontSize: 11))),
                Expanded(child: Text("Category", style: TextStyle(color: Colors.white54, fontSize: 11))),
                Expanded(child: Text("Source", style: TextStyle(color: Colors.white54, fontSize: 11))),
                Expanded(child: Text("Added", style: TextStyle(color: Colors.white54, fontSize: 11))),
              ],
            ),
          ),
          const Divider(color: Colors.white10, height: 1),

          /// Data Rows
          _tableRow(
            hash: "a3f9b2c1d4e5f6a7\nb8c9d0e1f2a3b4c5",
            name: "Trojan.GenericKD.\n46681520",
            category: "Trojan",
            catColor: Colors.red.withOpacity(0.2),
            source: "VirusShare",
            date: "09 Mar 2026",
            hashColor: accentRed,
          ),
          _tableRow(
            hash: "b7e1d4c2a5f6e3b8\nd5c4a3f2e1d0c9b8",
            name: "Miner.XMRig.\nGeneric",
            category: "Miner",
            catColor: Colors.orange.withOpacity(0.2),
            source: "VirusShare",
            date: "07 Mar 2026",
            hashColor: accentBlue,
          ),

          /// Pagination
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Showing 1-8 of 2,419,803 signatures", style: TextStyle(color: Colors.white38, fontSize: 10)),
                Row(
                  children: [
                    _pageBtn(Icons.chevron_left, isActive: false),
                    _pageBtnText("1", isActive: true),
                    _pageBtnText("...", isActive: false),
                    _pageBtnText("12", isActive: false),
                    _pageBtn(Icons.chevron_right, isActive: true),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _tableRow({
    required String hash,
    required String name,
    required String category,
    required Color catColor,
    required String source,
    required String date,
    required Color hashColor,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white10))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 2, child: Text(hash, style: TextStyle(color: hashColor, fontSize: 10, fontFamily: 'monospace'))),
          Expanded(flex: 2, child: Text(name, style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold))),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(color: catColor, borderRadius: BorderRadius.circular(4)),
              child: Text(category, style: TextStyle(color: catColor.withOpacity(1), fontSize: 9, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
            ),
          ),
          Expanded(child: Text(source, style: const TextStyle(color: Colors.white70, fontSize: 10), textAlign: TextAlign.center)),
          Expanded(child: Text(date, style: const TextStyle(color: Colors.white38, fontSize: 10), textAlign: TextAlign.center)),
        ],
      ),
    );
  }

  Widget _pageBtn(IconData icon, {required bool isActive}) {
    return Container(
      margin: const EdgeInsets.only(left: 4),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: isActive ? Colors.white12 : Colors.transparent,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Colors.white10),
      ),
      child: Icon(icon, color: Colors.white54, size: 16),
    );
  }

  Widget _pageBtnText(String text, {required bool isActive}) {
    return Container(
      margin: const EdgeInsets.only(left: 4),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: isActive ? accentBlue : Colors.transparent,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Colors.white10),
      ),
      child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 10)),
    );
  }
}

class StatBox extends StatelessWidget {
  final String title, value, subtitle;
  final Color color;

  const StatBox({super.key, required this.title, required this.value, required this.color, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(10),
        border: Border(top: BorderSide(color: color, width: 2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(color: Colors.white54, fontSize: 11)),
          const Spacer(),
          Text(value, style: TextStyle(color: color, fontSize: 24, fontWeight: FontWeight.bold)),
          Text(subtitle, style: const TextStyle(color: Colors.white24, fontSize: 9)),
        ],
      ),
    );
  }
}
