import 'package:flutter/material.dart';
import 'dailychecklist.dart';
import 'approval.dart';
import 'mastercleaningprogram.dart';
import 'pwcc.dart';
import 'report.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GDPS App',
      theme: ThemeData(
        primaryColor: Colors.transparent,
      ),
      home: MyHomePage(title: 'GDPS App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/gdpshd.png', // Path to your logo
              fit: BoxFit.contain,
              height: 32, // Adjust the height as needed
            ),
            SizedBox(width: 30), // Optional spacing between logo and title
            Image.asset(
              'assets/garudahd.png', // Path to your logo
              fit: BoxFit.contain,
              height: 90, // Adjust the height as needed
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_active_outlined, size: 30),onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.png'),
                fit: BoxFit.cover, //background
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: _buildProfileCard(), // Add Profile Card here
              ),
              SizedBox(height: 2),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Pilih Gedung :',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF2A3D6D),
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            //spreadRadius: 1,
                            blurRadius: 5,
                            offset: Offset(0,3),
                            color: Colors.black.withOpacity(0.25),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: Offset(0,3),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'GSO',
                            style: TextStyle(
                              color: Color(0xFF2A3D6D), // Use the same color as the label
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 8),
                          Icon(
                            Icons.arrow_drop_down,
                            color: Color(0xFF2A3D6D), // Use the same color as the text
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              Container(
                width: 370,
                child: Text(
                  'Dashboard',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    fontSize: 15,
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
              SizedBox(height: 4),
              _buildDashboardItem('Housekeeping'),
              SizedBox(height: 14),
              _buildEngineerItem('Engineer'),
              SizedBox(height: 16),
              Container(
                width: 370,
                child: Text(
                  'Reminder Service Hari ini',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    fontSize: 15,
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
              SizedBox(height: 7),
              Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                width: 375,
                height: 165,
                decoration: BoxDecoration(
                  color: Color(0xff0159B2),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 3,
                      blurRadius: 2,
                      offset: Offset(-3,3),
                    ),
                  ],
                  border: Border.all(
                    color: Colors.black.withOpacity(0.35),
                    width: 3,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildTopButton(context, 'Housekeeping', true),
                        SizedBox(width: 20),
                        _buildTopButton(context, 'Engineer', false),
                      ],
                    ),
                    //SizedBox(height: 3),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Reminder Service Hari Ini',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(right: 2, left: 10, top: 2, bottom: 2),
                          decoration: BoxDecoration(
                            color: Color(0xff2A3D6D),
                            borderRadius: BorderRadius.circular(7), // Adjust to match the rounded corners
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 4,
                                offset: Offset(2, 3),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Text(
                                "20 - 01 - 2024", // Example date, replace with dynamic data
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 8,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 8), // Spacing between text and dropdown
                              Icon(
                                Icons.arrow_drop_down, // Dropdown icon
                                color: Colors.white,
                                size: 15,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    //SizedBox(height: 5),
                    Divider(
                      color: Colors.white,
                      height: 10,
                      thickness: 1,),
                    _buildReminderItem('Ruangan', 'Object/Item', 'Status'),
                    Divider(
                      color: Colors.white,
                      height: 10,
                      thickness: 1,),
                    _buildReminderItem('Ruangan', 'Object/Item', 'Status'),
                    Divider(
                      color: Colors.white,
                      height: 10,
                      thickness: 1,),
                    _buildReminderItem('Ruangan', 'Object/Item', 'Status'),
                  ],
                ),
              ),
              //SizedBox(height: 16),
            ],
          ),
        ],
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
                _buildNavBarItem(Icons.home_outlined, 'Home', 0),
                _buildNavBarItem(Icons.history_outlined, 'History', 1),
                SizedBox(width: 60),
                _buildNavBarReportItem(Icons.report_outlined, 'Report', 2),
                _buildNavBarItem(Icons.person, 'User', 3),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileCard() {
    return Padding(
      padding: const EdgeInsets.only(right: 60), // Shift the container 100px to the right
      child: Stack(
        clipBehavior: Clip.none, // Allow overflow to show the floating effect
        children: [
          Container(
            padding: EdgeInsets.only(left: 20),
            width: 280,
            height: 70,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff0254BA), Color(0xff1BC19F)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 3,
                  blurRadius: 2,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 34), // Adjust left padding to make space for the floating avatar
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5), // Add top padding to align text with the floating avatar
                  Text(
                    'Hello, RAJABANNISA AIRO WAHYUNI',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 2),
                  Row(
                    children: [
                      Icon(
                        Icons.apartment,
                        color: Colors.white,
                        size: 14,
                      ),
                      SizedBox(width: 4),
                      Text(
                        'PT. Garuda Daya Pratama Sejahtera',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0, // Adjust top position for floating effect
            left: -20, // Adjust left position relative to the container
            child: CircleAvatar(
              radius: 35,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.person,
                size: 60,
                color: Colors.black,
              ),
            ),
          ),
          Positioned(
            top: 48, // Adjust top position for floating effect
            left: 55, // Adjust left position for floating effect
            child: Container(
              width: 200,
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 3,
                    blurRadius: 2,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.person,
                    color: Colors.grey,
                    size: 18,
                  ),
                  SizedBox(width: 4),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'IT Analyst',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 8),
                        Text(
                          'NRP 9500154',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildTopButton(BuildContext context, String title, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 0.0), // Adjust the top padding to move the button up
      child: ElevatedButton(
        onPressed: () {
          // Handle button press
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xff2A3D6D),
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          minimumSize: Size(100, 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 5,
        ),
        child: Text(title, style: TextStyle(fontSize: 12)),
      ),
    );
  }

  Widget _buildReminderItem(String ruang, String object, String status) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0), // Sesuaikan nilai padding
          child: Text(
            ruang,
            style: TextStyle(color: Color(0xff22C3A4), fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.0), // Sesuaikan nilai padding
          child: Text(
            object,
            style: TextStyle(color: Color(0xff22C3A4), fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.0), // Sesuaikan nilai padding
          child: Text(
            status,
            style: TextStyle(color: Color(0xff22C3A4), fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget _buildDashboardItem(String title) {
    return Container(
      padding: EdgeInsets.all(10),
      width: 375,
      height: 140,
      decoration: BoxDecoration(
        color: Color(0xff313564),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.black.withOpacity(0.25),
          width: 3.0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft, // Atur lebar Center menjadi setengah dari lebar parent
            child: Text(
              'Housekeeping',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildDailyChecklistButton('Daily\nChecklist', Icons.checklist_outlined, context),
              _buildApprovalButton('Approval\n', Icons.check_circle_outline, context),
              _buildMCPButton('MCP\n', Icons.computer, context),
              _buildPWCCButton('PWCC\n', Icons.checklist, context),
              _buildDashboardItemButton('HK Service\n', Icons.settings),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDailyChecklistButton(String label, IconData icon, BuildContext context) {
    return InkWell(
      onTap: () {
        if (label == 'Daily\nChecklist') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DailyChecklistScreen()),
          );
        }
        // Add more conditions if you have other buttons to navigate to different screens
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              color: Colors.blueGrey[900],
            ),
          ),
          SizedBox(height: 5),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xffD7D7D7),
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildApprovalButton(String title, IconData icon, BuildContext context) {
    return InkWell(
      onTap: () {
        if (title == 'Approval\n') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ApprovalPage()),
          );
        }
        // Add more conditions if you have other buttons to navigate to different screens
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              color: Colors.blueGrey[900],
            ),
          ),
          SizedBox(height: 5),
          Text(
            title,
            style: TextStyle(
              color: Color(0xffD7D7D7),
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMCPButton(String title, IconData icon, BuildContext context) {
    return InkWell(
      onTap: () {
        if (title == 'MCP\n') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MCPReport()),
          );
        }
        // Add more conditions if you have other buttons to navigate to different screens
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              color: Colors.blueGrey[900],
            ),
          ),
          SizedBox(height: 5),
          Text(
            title,
            style: TextStyle(
              color: Color(0xffD7D7D7),
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPWCCButton(String title, IconData icon, BuildContext context) {
    return InkWell(
      onTap: () {
        if (title == 'PWCC\n') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PWCCScreen()),
          );
        }
        // Add more conditions if you have other buttons to navigate to different screens
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              color: Colors.blueGrey[900],
            ),
          ),
          SizedBox(height: 5),
          Text(
            title,
            style: TextStyle(
              color: Color(0xffD7D7D7),
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEngineerItem(String title) {
    return Container(
      padding: EdgeInsets.all(10),
      width: 375,
      height: 140,
      decoration: BoxDecoration(
        color: Color(0xff22C3A4),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.black.withOpacity(0.25),
          width: 3.0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft, // Atur lebar Center menjadi setengah dari lebar parent
            child: Text(
              'Engineer',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildDashboardItemButton('Inventory\nMaintenance', Icons.checklist),
              _buildDashboardItemButton('Maintenance\nServices', Icons.check_circle),
              _buildDashboardItemButton('Maintenance\nSchedule', Icons.computer),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDashboardItemButton(String title, IconData icon) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            icon,
            color: Colors.blueGrey[900],
          ),
        ),
        SizedBox(height: 5),
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 10,
          ),
        ),
      ],
    );
  }

  Widget _buildNavBarItem(IconData icon, String label, int index) {
    return GestureDetector(
      onTap: () => _onItemTapped(index),
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

  Widget _buildNavBarReportItem(IconData icon, String label, int index) {
    return GestureDetector(
      onTap: () {
        if (index == 2) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ReportPage()),
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
