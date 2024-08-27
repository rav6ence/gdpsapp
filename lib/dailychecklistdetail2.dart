import 'package:flutter/material.dart';

class DailyChecklist2Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
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
            Navigator.pop(context);
          },
        ),
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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: DropdownButton<String>(
              value: '20 June 2023',
              underline: Container(),
              items: <String>['20 June 2023', '21 June 2023'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                // Handle date change
              },
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildRoomDetailsCard(),
            SizedBox(height: 6.0),
            Text(
              'Bila sesi sudah 5/5 maka baru bisa posting / proposed approval',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
            ),
            SizedBox(height: 10.0),
            _buildChecklistGrid(),
            SizedBox(height: 16.0),
            _buildActionButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildRoomDetailsCard() {
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

  Widget _buildChecklistGrid() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.blue.shade700,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: _buildChecklistField('Object')),
              SizedBox(width: 16.0),
              Expanded(child: _buildChecklistField('Method')),
            ],
          ),
          SizedBox(height: 16.0),
          Row(
            children: [
              Expanded(child: _buildChecklistField('Object')),
              SizedBox(width: 16.0),
              Expanded(child: _buildChecklistField('Method')),
            ],
          ),
          SizedBox(height: 16.0),
          Row(
            children: [
              Expanded(child: _buildChecklistField('Object')),
              SizedBox(width: 16.0),
              Expanded(child: _buildChecklistField('Method')),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildChecklistField(String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(height: 8.0),
        TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () {
            // Handle submit action
          },
          child: Text('Submit'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            minimumSize: Size(150, 50),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            // Handle edit action
          },
          child: Text('Edit'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            minimumSize: Size(150, 50),
          ),
        ),
      ],
    );
  }
}
