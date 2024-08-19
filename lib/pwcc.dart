import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PWCCScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PWCCScreen extends StatefulWidget {
  @override
  _PWCCScreenState createState() => _PWCCScreenState();
}

class _PWCCScreenState extends State<PWCCScreen> {
  String selectedArea = 'Area 1';
  String selectedMonth = 'Month';
  String selectedYear = 'Year';

  final List<String> areaItems = ['Area 1', 'Area 2', 'Area 3'];
  final List<String> monthItems = ['Month', 'January', 'February', 'March'];
  final List<String> yearItems = ['Year', '2021', '2022', '2023'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PWCC"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DropdownButton<String>(
                  value: selectedArea,
                  items: areaItems.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      selectedArea = newValue!;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DropdownButton<String>(
                  value: selectedMonth,
                  items: monthItems.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      selectedMonth = newValue!;
                    });
                  },
                ),
                DropdownButton<String>(
                  value: selectedYear,
                  items: yearItems.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      selectedYear = newValue!;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  checklistItem("Area", "Bulan / Tahun"),
                  checklistItem("Area", "Bulan / Tahun"),
                  checklistItem("Area", "Bulan / Tahun"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget checklistItem(String area, String date) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xff0254BA), Color(0xff1BC19F)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            area,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Text(
            date,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
