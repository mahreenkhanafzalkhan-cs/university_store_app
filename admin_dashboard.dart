import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../project/add_members_screen.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  Future<void> logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Navigator.pushReplacementNamed(context, '/');
  }

  Widget dashboardCard(
    BuildContext context,
    String title,
    IconData icon,
    String route,
    Color color,
  ) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, route),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: color,
        elevation: 6,
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Row(
            children: [
              Icon(icon, size: 40, color: Colors.white),
              const SizedBox(width: 20),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin Dashboard"),
        backgroundColor: Colors.indigo,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => logout(context),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            dashboardCard(
              context,
              "Manage Items",
              Icons.inventory,
              '/admin-items',
              Colors.indigo,
            ),

            dashboardCard(
              context,
              "All Requests",
              Icons.list_alt,
              '/admin-requests',
              Colors.blueAccent,
            ),

            dashboardCard(
              context,
              "Issued Items",
              Icons.assignment_turned_in,
              '/admin-issued',
              Colors.teal,
            ),

            dashboardCard(
              context,
              "Reports",
              Icons.bar_chart,
              '/admin-reports',
              Colors.deepPurple,
            ),
          ],
        ),
      ),
    );
  }
}