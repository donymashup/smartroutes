import 'package:flutter/material.dart';
import 'package:smart_routes/admin/add_driver.dart';
import 'package:smart_routes/admin/add_routes.dart';
import 'package:smart_routes/admin/assign_routes.dart';
import 'package:smart_routes/admin/view_feedback.dart';

class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<_DashboardOption> options = [
      _DashboardOption("Driver requests", Icons.person_add, const DriverRequestScreen()),
      _DashboardOption("Add Route", Icons.alt_route, const AddRouteScreen()),
      _DashboardOption("Assign Route", Icons.assignment_turned_in, const AssignRouteScreen()),
      _DashboardOption("View Feedbacks", Icons.feedback_outlined, const ViewFeedbackScreen()),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin Dashboard"),
        centerTitle: true,
        backgroundColor: Colors.lightBlue[300],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: options.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 cards per row
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 4 / 3,
        ),
        itemBuilder: (context, index) {
          final option = options[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => option.screen),
              );
            },
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              elevation: 4,
              color: Colors.lightBlue[50],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(option.icon, size: 40, color: Colors.blueAccent),
                  const SizedBox(height: 12),
                  Text(
                    option.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _DashboardOption {
  final String title;
  final IconData icon;
  final Widget screen;

  _DashboardOption(this.title, this.icon, this.screen);
}
