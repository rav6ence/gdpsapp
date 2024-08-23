import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PwccdetailScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PwccdetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        title: Text(
          'PWCC',
          style: TextStyle(
            color: Color(0xff313564),
            fontWeight: FontWeight.bold,
            fontFamily: 'Inter',
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
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
          image: AssetImage('assets/background.png'),
          fit: BoxFit.cover
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Room Info Container
              Container(
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
              ),
              SizedBox(height: 10),
              // Schedule Container
              Container(
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: Color(0xff0254BA),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Colors.black.withOpacity(0.25),
                    width: 3,
                  ),
                ),
                child: Image.network(
                  'https://via.placeholder.com/200',
                  width: 350,
                  height: 140,
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "PWCC Hari Ini:",
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
              SizedBox(height: 8),
              // Checklist Items
              checklistItem("Object", "Method", "Tanggal", Icons.check, Color(0xff20F90D)),
              checklistItem("Object", "Method", "Tanggal", Icons.close, Color(0xffDC0C0C)),
              checklistItem("Object", "Method", "Tanggal", Icons.circle_outlined, Color(0xff21F8F8)),
            ],
          ),
        ),
      ),
    );
  }

  Widget checklistItem(String object, String method, String date, IconData icon, Color iconColor) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(vertical: 8),
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
        border: Border.all(
          color: Colors.black.withOpacity(0.25),
          width: 3,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            object,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            method,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            date,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
            decoration: BoxDecoration(
              color: iconColor,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  blurRadius: 8,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                Icon(
                  icon,
                  size: 20,
                ),
                SizedBox(width: 5),
                Icon(Icons.arrow_drop_down_outlined, color: Colors.black),
              ],
            ),
          ),
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
