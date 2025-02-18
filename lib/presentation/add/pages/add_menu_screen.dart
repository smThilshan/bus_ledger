import 'package:flutter/material.dart';

class AddMenuScreen extends StatelessWidget {
  final List<Map<String, dynamic>> menuItems = [
    {
      "title": "Route",
      "icon": Icons.route,
      "color": Color(0xFF16A085),
      "bgColor": Color(0xFFD0F0E0)
    },
    {
      "title": "Hire",
      "icon": Icons.directions_bus,
      "color": Color(0xFF007BFF),
      "bgColor": Color(0xFFE3F2FD)
    },
    {
      "title": "Expenses",
      "icon": Icons.attach_money,
      "color": Color(0xFF8E44AD),
      "bgColor": Color(0xFFE8DAEF)
    },
    {
      "title": "Fuel",
      "icon": Icons.local_gas_station,
      "color": Color(0xFFC0392B),
      "bgColor": Color(0xFFF5B7B1)
    },
    {
      "title": "Maintenance",
      "icon": Icons.build,
      "color": Color(0xFF8E44AD),
      "bgColor": Color(0xFFE8DAEF)
    },
    {
      "title": "Debt",
      "icon": Icons.money_off,
      "color": Color(0xFFD35400),
      "bgColor": Color(0xFFFDEBD0)
    },
  ];

  void _navigateToAddScreen(BuildContext context, String title) {
    print("Navigate to Add $title Screen");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Menu", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 0, // No shadow for clean design
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 columns
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: menuItems.length,
          itemBuilder: (context, index) {
            var item = menuItems[index];
            return GestureDetector(
              onTap: () => _navigateToAddScreen(context, item["title"]),
              child: Container(
                decoration: BoxDecoration(
                  color: item["bgColor"],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(item["icon"], size: 40, color: item["color"]),
                    SizedBox(height: 10),
                    Text(
                      item["title"],
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: item["color"]),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
