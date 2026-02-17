import 'package:flutter/material.dart';
import 'app_drawer.dart';

class ClassManagementPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Classes Details"),
      ),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: [
            DataColumn(label: Text('#')),
            DataColumn(label: Text('Class Name')),
            DataColumn(label: Text('Code')),
            DataColumn(label: Text('Description')),
            DataColumn(label: Text('Level')),
            DataColumn(label: Text('Sections')),
          ],
          rows: [
            DataRow(cells: [
              DataCell(Text('1')),
              DataCell(Text('Financial Accounting Basics')),
              DataCell(Container(
                padding: EdgeInsets.all(6),
                color: Colors.grey[300],
                child: Text('FAB101'),
              )),
              DataCell(Text(
                  'Introduction to fundamental accounting principles...')),
              DataCell(Container(
                padding: EdgeInsets.all(6),
                color: Colors.green[200],
                child: Text('Graduation'),
              )),
              DataCell(ElevatedButton(
                onPressed: () {},
                child: Text("View"),
              )),
            ]),

            DataRow(cells: [
              DataCell(Text('2')),
              DataCell(Text('Cost Analysis and Management')),
              DataCell(Container(
                padding: EdgeInsets.all(6),
                color: Colors.grey[300],
                child: Text('CAM204'),
              )),
              DataCell(Text(
                  'Study of methods for analyzing, controlling, and managing costs...')),
              DataCell(Container(
                padding: EdgeInsets.all(6),
                color: Colors.green[200],
                child: Text('Graduation'),
              )),
              DataCell(ElevatedButton(
                onPressed: () {},
                child: Text("View"),
              )),
            ]),
          ],
        ),
      ),
    );
  }
}
