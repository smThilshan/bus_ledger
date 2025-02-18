import 'package:bus_ledger/common/widgets/appbar/custom_appbar.dart';
import 'package:bus_ledger/common/widgets/bottombar/bottom_navigation_bar.dart';
import 'package:bus_ledger/presentation/add/pages/add_menu_screen.dart';
import 'package:bus_ledger/presentation/home/pages/home_screen.dart.dart';
import 'package:bus_ledger/presentation/log/pages/log_screen.dart';
import 'package:bus_ledger/presentation/reports/pages/report_screen.dart';
import 'package:bus_ledger/presentation/settings/settings_screen.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool isDarkMode = false;
  int selectedIndex = 0;

  final List<Widget> _screens = [
    Center(child: HomeScreen()),
    Center(child: LogScreen()),
    Center(child: ReportScreen()),
    Center(child: SettingsScreen()),
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void _toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        isDarkMode: isDarkMode,
        onThemeToggle: _toggleTheme,
      ),
      body: _screens[selectedIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the add screen
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddMenuScreen()));
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: selectedIndex,
        onItemTapped: _onItemTapped,
        isDarkMode: isDarkMode,
        onThemeToggle: _toggleTheme,
      ),
    );
  }
}
