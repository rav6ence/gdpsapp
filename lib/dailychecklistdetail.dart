import 'dart:ui';
import 'dailychecklistvp.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DailyChecklistPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class DailyChecklistPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Daily Checklist',
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
            image: AssetImage('assets/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top card with room info and map
              buildChecklistDetailCard(context),
              SizedBox(height: 10),
              // Daily Checklist Header
              Container(
                width: 180,
                child: Text(
                  'Riwayat Daily Checklist',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(1.0, 2.0),
                        blurRadius: 6.0,
                        color: Colors.grey.withOpacity(1),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              // Checklist items
              Expanded(
                child: ListView(
                  children: [
                    checklistItem('Shift 1 (06:00 - 08:00)', '1/5', 'Tanggal', 'Done', Color(0xffA3E89C)),
                    checklistItem('Shift 1 (09:00 - 12:00)', '2/5', 'Tanggal', 'Done', Color(0xffA3E89C)),
                    checklistItem('Shift 1 (13:00 - 15:00)', '3/5', 'Tanggal', 'Done', Color(0xffA3E89C)),
                    checklistItem('Shift 1 (06:00 - 08:00)', '4/5', 'Tanggal', 'Done', Color(0xffA3E89C)),
                    checklistItem('Shift 1 (06:00 - 08:00)', '5/5', 'Tanggal', 'Pending', Color(0xffFBA14F)),
                  ],
                ),
              ),
              SizedBox(height: 10),
              // View Progress Button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DailyChecklistReport()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 110, vertical: 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                  ),
                  child: Ink(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xff0254BA), Color(0xff1BC19F)], // Ganti dengan warna gradient yang diinginkan
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      constraints: BoxConstraints(minWidth: 10.0, minHeight: 50.0),
                      alignment: Alignment.center,
                      child: Text(
                        'View Progress',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Roboto',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget checklistItem(String shift, String session, String tanggal, String status, Color statusColor) {
    return InkWell(
      /*onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>
              DailyChecklistPage()),
        );
      },*/
      child: Container(
        margin: EdgeInsets.only(bottom: 12),
        padding: EdgeInsets.only(top: 8, bottom: 10, left: 20, right: 16),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black.withOpacity(0.35),
            width: 3,
          ),
          gradient: LinearGradient(
            colors: [Color(0xff0254BA), Color(0xff1BC19F)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 3,
              offset: Offset(0, 3),
            )
          ],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Shift Ke : $shift',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
                //SizedBox(height: 4),
                Text(
                  'Sesi       : $session',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 4, vertical: 0),
                  child: Text(
                    '$tanggal',
                    style: TextStyle(
                      color: Color(0xff313564),
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 1), // Berikan jarak antara container tanggal dan status
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
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

  Widget buildChecklistDetailCard(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14),
      width: 380,
      decoration: BoxDecoration(
        color: Color(0xFF0159B2),
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: Colors.black.withOpacity(0.35),
          width: 3,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDetailText("Room Code", "GSO001", Color(0xff22C3A4)),
          SizedBox(height: 4),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _buildDetailText("Coordinate", "", Colors.black),
              ),
              //SizedBox(width: 10),
              Container(
                width: 257,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(2),
                  child: Image.network(
                    'https://maps.googleapis.com/maps/api/staticmap?center=-6.200000,106.816666&zoom=15&size=200x100&key=YOUR_API_KEY', // Replace with your map image
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          _buildDetailText("Building", "GSO", Color(0xff22C3A4)),
          _buildDetailText("Area", "Lobby & Resepsionist", Color(0xff22C3A4)),
          _buildDetailText("Shift Ke-", "Shift 1 (06:00 - 08:00)", Color(0xff22C3A4)),
          _buildDetailText("Sesi", "1/5", Color(0xff22C3A4)),
        ],
      ),
    );
  }

  Widget _buildDetailText(String label, String value, Color valueColor) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$label : ",
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
              color: valueColor,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
