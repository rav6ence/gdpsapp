import 'package:flutter/material.dart';
import 'approvalvp.dart';
import 'reportdc.dart';
import 'reportpwcc.dart';
import 'main.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ReportPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ReportPage extends StatefulWidget {
  @override
  _ApprovalPageState createState() => _ApprovalPageState();
}

class _ApprovalPageState extends State<ReportPage> {
  bool showChecklist = false;
  String selectedArea = 'Area 1';
  String selectedMonth = 'Month';
  String selectedYear = 'Year';

  final List<String> areaItems = ['Area 1', 'Area 2', 'Area 3'];
  final List<String> monthItems = ['Month', 'January', 'February', 'March', 'April', 'Mei', 'Juni'];
  final List<String> yearItems = ['Year', '2021', '2022', '2023'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Report',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
            color: Color(0xff313564),
            shadows: <Shadow>[
              Shadow(
                offset: Offset(1.0, 3.0),
                blurRadius: 9.0,
                color: Colors.grey.withOpacity(1),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xff313564),
            size: 30,
            shadows: <Shadow>[
              Shadow(
                offset: Offset(1.0, 3.0),
                blurRadius: 9.0,
                color: Colors.grey.withOpacity(1),
              ),
            ],
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'), // Replace with your background image path
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState((){
                      showChecklist = true;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                  ),
                  child: Ink(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xff0254BA), Color(0xff1BC19F)], // Example gradient colors
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: [
                        BoxShadow (
                          offset: Offset(1.0, 1.0),
                          blurRadius: 3.0,
                          color: Colors.grey.withOpacity(1),
                        ),
                      ],
                    ),
                    child: Container(
                      constraints: BoxConstraints(minWidth: 120.0, minHeight: 30.0),
                      alignment: Alignment.center,
                      child: Text(
                        'Daily Checklist',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 40),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      showChecklist = false;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                  ),
                  child: Ink(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xff0254BA), Color(0xff1BC19F)], // Example gradient colors
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: [
                        BoxShadow (
                          offset: Offset(1.0, 1.0),
                          blurRadius: 3.0,
                          color: Colors.grey.withOpacity(1),
                        ),
                      ],
                    ),
                    child: Container(
                      constraints: BoxConstraints(minWidth: 120.0, minHeight: 30.0),
                      alignment: Alignment.center,
                      child: Text(
                        'PWCC',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            if (showChecklist) ...[
              // Dropdown Menu
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
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.arrow_left, size: 28),
                  SizedBox(width: 60),
                  Column(
                    children: [
                      Text(
                        'Today',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff313564),
                          shadows: <Shadow>[
                            Shadow(
                              offset: Offset(0.0, 1.5),
                              blurRadius: 5.0,
                              color: Colors.grey.withOpacity(1),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Wednesday, 19 Month 2023',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff313564),
                          fontWeight: FontWeight.w400,
                          shadows: <Shadow>[
                            Shadow(
                              offset: Offset(0.0, 1.5),
                              blurRadius: 5.0,
                              color: Colors.grey.withOpacity(1),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 60),
                  Icon(Icons.arrow_right, size: 28),
                ],
              ),
              SizedBox(height: 20),
              Column(
                children: [
                  ListView(
                    shrinkWrap: true, // Prevent ListView from taking up all available space
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      checklistCard("Daily Checklist", "Area", "Tanggal", "Approved", Color(0xffA3E89C)),
                      checklistCard("Daily Checklist", "Area", "Tanggal", "Approved", Color(0xffA3E89C)),
                      checklistCard("Daily Checklist", "Area", "Tanggal", "Approved", Color(0xffA3E89C)),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>
                            DCReport()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 125, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                    ),
                    child: Ink(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xff0254BA), Color(0xff1BC19F)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Container(
                        constraints: BoxConstraints(minWidth: 100.0, minHeight: 55.0),
                        alignment: Alignment.center,
                        child: Text(
                          'Download Report',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Roboto',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ] else ...[
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
              Column(
                children: [
                  ListView(
                    shrinkWrap: true, // Prevent ListView from taking up all available space
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      checklistItem("PWCC", "Area", "Bulan / Tahun", "Approved", Color(0xffA3E89C)),
                      checklistItem("PWCC", "Area", "Bulan / Tahun", "Approved", Color(0xffA3E89C)),
                      checklistItem("PWCC", "Area", "Bulan / Tahun", "Approved", Color(0xffA3E89C)),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>
                            PWCCReport()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 125, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                    ),
                    child: Ink(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xff0254BA), Color(0xff1BC19F)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Container(
                        constraints: BoxConstraints(minWidth: 100.0, minHeight: 55.0),
                        alignment: Alignment.center,
                        child: Text(
                          'Download Report',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Roboto',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: FloatingActionButton.extended(
          onPressed: () {
            // qr code
          },
          label: Icon(
            Icons.qr_code_scanner,
            size: 30,
          ),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(
              color: Color(0xff00809C),
              width: 5.0,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft:Radius.circular(0.0),
              topRight: Radius.circular(0.0),
            ),
            child: Container(
              height: 70.0,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xff00A787), Color(0xff0159B2)], // Your gradient colors
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
            ),
          ),
          Container(
            height: 70.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _buildNavBarItem(context, Icons.home_outlined, 'Home', 0),
                _buildNavBarItem(context, Icons.history_outlined, 'History', 1),
                SizedBox(width: 60),
                _buildNavBarItem(context, Icons.report_outlined, 'Report', 2),
                _buildNavBarItem(context, Icons.person, 'User', 3),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget checklistCard(String title, String area, String date, String status, Color statusColor) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>
              ApprovalReport()),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        padding: EdgeInsets.only(top: 12, bottom: 14, left: 20, right: 16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff0254BA), Color(0xff1BC19F)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          border: Border.all(
            color: Colors.black.withOpacity(0.35),
            width: 3,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 3,
              offset: Offset(0, 3),
            )
          ],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  area,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                  child: Text(
                    date,
                    style: TextStyle(
                      color: Color(0xff313564),
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                  decoration: BoxDecoration(
                    color: statusColor,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      spreadRadius: (0.25),
                      blurRadius: (0.5),
                      offset: Offset(0, 2),
                    ),
                    ],
                  ),
                  child: Text(
                    status,
                    style: TextStyle(
                      color: Color(0xff585926),
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget checklistItem(String title, String area, String date, String status, Color statusColor) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: EdgeInsets.only(top: 12, bottom: 14, left: 20, right: 16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xff0254BA), Color(0xff1BC19F)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        border: Border.all(
          color: Colors.black.withOpacity(0.35),
          width: 3,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 3),
          )
        ],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                area,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 1, vertical: 1),
                child: Text(
                  date,
                  style: TextStyle(
                    color: Color(0xff313564),
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                decoration: BoxDecoration(
                  color: statusColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    spreadRadius: (0.25),
                    blurRadius: (0.5),
                    offset: Offset(0, 2),
                  ),
                  ],
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    color: Color(0xff585926),
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNavBarItem(BuildContext context, IconData icon, String label, int index) {
    return GestureDetector(
      onTap: () {
        if (index == 0) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyHomePage(title: '',)),
          );
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 10.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
