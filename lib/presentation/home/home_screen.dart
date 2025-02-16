import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isDarkMode = false;
  int selectedIndex = 0;

  final List<Widget> _screens = [
    HomeContent(),
    Center(child: Text("Add Screen")),
    Center(child: Text("Reports Screen")),
    Center(child: Text("Settings Screen")),
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Bus Ledger"),
        actions: [
          IconButton(
            icon: Icon(isDarkMode ? Icons.dark_mode : Icons.light_mode),
            onPressed: () {
              setState(() {
                isDarkMode = !isDarkMode;
              });
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: _screens[selectedIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "Add"),
          BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart), label: "Reports"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Good Morning, Thilshan!",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 30),
          SizedBox(
            height: 250,
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: 25000,
                barGroups: [
                  BarChartGroupData(x: 1, barRods: [
                    BarChartRodData(
                      toY: 5000,
                      color: Colors.red,
                      width: 20,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ]),
                  BarChartGroupData(x: 2, barRods: [
                    BarChartRodData(
                      toY: 16000,
                      color: Colors.orange,
                      width: 20,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ]),
                  BarChartGroupData(x: 3, barRods: [
                    BarChartRodData(
                      toY: 6000,
                      color: Colors.orange,
                      width: 20,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ]),
                  BarChartGroupData(x: 4, barRods: [
                    BarChartRodData(
                      toY: 22000,
                      color: Colors.green,
                      width: 20,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ]),
                  BarChartGroupData(x: 5, barRods: [
                    BarChartRodData(
                      toY: 8000,
                      color: Colors.green,
                      width: 20,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ]),
                ],
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40,
                      getTitlesWidget: (value, meta) {
                        if (value == 5000 ||
                            value == 10000 ||
                            value == 15000 ||
                            value == 20000) {
                          return Padding(
                            padding: EdgeInsets.only(right: 4.0),
                            child: Text(
                              '${(value / 1000).toInt()}K',
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          );
                        }
                        return Container();
                      },
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        switch (value.toInt()) {
                          case 1:
                            return Text("Mon",
                                style: TextStyle(fontWeight: FontWeight.bold));
                          case 2:
                            return Text("Tue",
                                style: TextStyle(fontWeight: FontWeight.bold));
                          case 3:
                            return Text("Wed",
                                style: TextStyle(fontWeight: FontWeight.bold));
                          case 4:
                            return Text("Thu",
                                style: TextStyle(fontWeight: FontWeight.bold));
                          case 5:
                            return Text("Fri",
                                style: TextStyle(fontWeight: FontWeight.bold));
                          default:
                            return Text("");
                        }
                      },
                    ),
                  ),
                  rightTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  topTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                ),
                borderData: FlBorderData(
                  show: false,
                ),
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  horizontalInterval: 5000,
                  getDrawingHorizontalLine: (value) {
                    return FlLine(
                      color: Colors.grey.withOpacity(0.3),
                      strokeWidth: 1,
                      dashArray: [5, 5],
                    );
                  },
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
          Center(
            child: Text(
              "Total KM: 1200 KM",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SummaryCard(
                  title: "Income", amount: "₹12,000", color: Color(0xFF2ECC71)),
              SummaryCard(
                  title: "Expenses",
                  amount: "₹5,000",
                  color: Color(0xFFE74C3C)),
              SummaryCard(
                  title: "Balance", amount: "₹7,000", color: Color(0xFF3498DB)),
            ],
          ),
        ],
      ),
    );
  }
}

class SummaryCard extends StatelessWidget {
  final String title;
  final String amount;
  final Color color;

  SummaryCard({required this.title, required this.amount, required this.color});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color.withOpacity(0.2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            Text(title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text(amount,
                style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold, color: color)),
          ],
        ),
      ),
    );
  }
}
