import 'package:flutter/material.dart';
import 'dailychecklistdetail.dart';

void main() {
  runApp(MaterialApp(home: DailyChecklistScreen()));
}

class DailyChecklistScreen extends StatelessWidget {
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
          'Daily Checklist',
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
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.png'), // Replace with your image path
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Content
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Scan QR Code Button
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xff0254BA), Color(0xff1BC19F)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 125),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                      ),
                      onPressed: () {},
                      child: Text(
                        'Scan QR Code Area',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24),
                // Today Date Section
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
                SizedBox(height: 24),
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
                SizedBox(height: 8),
                // Checklist Items
                Expanded(
                  child: ListView(
                    children: [
                      _buildChecklistItem(context, 'Lobby', '4/5', 'Not Finished Yet', 'Tanggal', Color(0xffFBA14F)),
                      _buildChecklistItem(context, 'Ruang Merapi', '2/5', 'Not Finished Yet', 'Tanggal', Color(0xffFBA14F)),
                      _buildChecklistItem(context, 'Ruang Rinjani', '5/5', 'Propose Approval', 'Tanggal', Color(0xffEDFF7C)),
                      _buildChecklistItem(context, 'Toilet', '5/5', 'Approved', 'Tanggal', Color(0xffA3E89C)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChecklistItem(BuildContext context, String area, String sesi, String status, String tanggal, Color statusColor) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>
            DailyChecklistPage()),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 12),
        padding: EdgeInsets.only(top: 12, bottom: 14, left: 20, right: 16),
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
                  'Area : $area',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
                //SizedBox(height: 4),
                Text(
                  'Sesi : $sesi',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
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
                    '$tanggal',
                    style: TextStyle(
                      color: Color(0xff313564),
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 2), // Berikan jarak antara container tanggal dan status
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
}
