import 'package:bus_ledger/common/widgets/card/custom_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Good Morning, Thilshan!",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 250, // Increased for better spacing
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: 25000, // Adjust max value if needed
                  barGroups: [
                    BarChartGroupData(x: 1, barRods: [
                      BarChartRodData(
                        toY: 5000,
                        color: Colors.red, // Low value → Red
                        width: 20,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ]),
                    BarChartGroupData(x: 2, barRods: [
                      BarChartRodData(
                        toY: 16000,
                        color: Colors.orange, // Medium value → Orange
                        width: 20,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ]),
                    BarChartGroupData(x: 3, barRods: [
                      BarChartRodData(
                        toY: 6000,
                        color: Colors.orange, // Medium value → Orange
                        width: 20,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ]),
                    BarChartGroupData(x: 4, barRods: [
                      BarChartRodData(
                        toY: 22000,
                        color: Colors.green, // High value → Green
                        width: 20,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ]),
                    BarChartGroupData(x: 5, barRods: [
                      BarChartRodData(
                        toY: 8000,
                        color: Colors.green, // High value → Green
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
                              padding: const EdgeInsets.only(right: 4.0),
                              child: Text(
                                '${(value / 1000).toInt()}K',
                                style: const TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                            );
                          }
                          return Container(); // Hide other labels
                        },
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          switch (value.toInt()) {
                            case 1:
                              return const Text("Mon",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold));
                            case 2:
                              return const Text("Tue",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold));
                            case 3:
                              return const Text("Wed",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold));
                            case 4:
                              return const Text("Thu",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold));
                            case 5:
                              return const Text("Fri",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold));
                            default:
                              return const Text("");
                          }
                        },
                      ),
                    ),
                    rightTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false)),
                    topTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false)),
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
            const SizedBox(height: 16),
            const Center(
              child: Text(
                "Total KM: 1200 KM",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SummaryCard(
                    title: "Income",
                    amount: "₹12,000",
                    color: const Color(0xFF2ECC71)),
                SummaryCard(
                    title: "Expenses",
                    amount: "₹5,000",
                    color: const Color(0xFFE74C3C)),
                SummaryCard(
                    title: "Balance",
                    amount: "₹7,000",
                    color: const Color(0xFF3498DB)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SummaryCard(
                    title: "Debt",
                    amount: "₹3,000",
                    color: const Color(0xFFE67E22)),
                SummaryCard(
                    title: "Reminders",
                    amount: "₹3,000",
                    color: const Color(0xFFE67E22)),
                SummaryCard(
                    title: "Others",
                    amount: "₹3,000",
                    color: const Color(0xFFE67E22)),
              ],
            ),
            const SizedBox(height: 10),
            const CustomCardWidget(
                icon: Icons.safety_check,
                description: 'Tyre pressure is low',
                heading: 'Change Tyre')
          ],
        ),
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
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            Text(amount,
                style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold, color: color)),
          ],
        ),
      ),
    );
  }
}
