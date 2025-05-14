import 'package:flutter/material.dart';
import 'package:smart_routes/driverlogin.dart'; // Make sure this file exists

class RoleSelectionPage extends StatelessWidget {
  final Color primaryBlue = Color(0xFF1E88E5); // Modern blue

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Logo at top
                Image.asset(
                  'assets/busroute.png', // Ensure this image exists in assets
                  height: 300,
                ),

                // Title
                Text(
                  'SELECT YOUR ROLE',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                    color: primaryBlue,
                    shadows: [
                      Shadow(
                        blurRadius: 4.0,
                        color: Colors.black12,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),

                // Admin Button
                _buildVerticalButton(
                  icon: Icons.admin_panel_settings,
                  label: 'Admin',
                  color: Colors.deepPurple,
                  iconColor: Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DriverLoginPage()),
                    );
                  },
                ),
                SizedBox(height: 20),

                // Driver Button
                _buildVerticalButton(
                  icon: Icons.local_shipping,
                  label: 'Driver',
                  color: primaryBlue,
                  iconColor: Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DriverLoginPage()),
                    );
                  },
                ),
                SizedBox(height: 20),

                // Passenger Button
                _buildVerticalButton(
                  icon: Icons.directions_bus,
                  label: 'Passenger',
                  color: Colors.teal,
                  iconColor: Colors.white,
                  onPressed: () {
                    // TODO: Navigate to Passenger login screen
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildVerticalButton({
    required IconData icon,
    required String label,
    required Color color,
    required Color iconColor,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: color,
          padding: EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 4,
        ),
        onPressed: onPressed,
        child: Column(
          children: [
            Icon(icon, size: 32, color: iconColor),
            SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: RoleSelectionPage(),
  ));
}
