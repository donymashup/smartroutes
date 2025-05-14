import 'package:flutter/material.dart';

class AssignRouteScreen extends StatefulWidget {
  const AssignRouteScreen({super.key});

  @override
  State<AssignRouteScreen> createState() => _AssignRouteScreenState();
}

class _AssignRouteScreenState extends State<AssignRouteScreen> {
  String? selectedDriver;
  String? selectedRoute;

  final List<String> drivers = ['John Doe', 'Priya Sharma', 'Amit Kumar'];
  final List<String> routes = [
    'Route 1 - City Center to East End',
    'Route 2 - North Gate to Airport',
    'Route 3 - Tech Park to Market Square'
  ];

  // Method to assign a route
  void assignRoute() {
    if (selectedDriver == null || selectedRoute == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select both driver and route')),
      );
      return;
    }

    // Simulate success message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Assigned "$selectedRoute" to "$selectedDriver"')),
    );

    setState(() {
      selectedDriver = null;
      selectedRoute = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Assign Route'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              const Text(
                'Please select a driver and a route to assign',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black54),
              ),
              const SizedBox(height: 24),

              // Driver Dropdown
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.blueAccent, width: 1.5),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: DropdownButtonFormField<String>(
                    value: selectedDriver,
                    items: drivers
                        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                    onChanged: (val) => setState(() => selectedDriver = val),
                    decoration: const InputDecoration(
                      labelText: 'Select Driver',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Route Dropdown
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.blueAccent, width: 1.5),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: DropdownButtonFormField<String>(
                    value: selectedRoute,
                    items: routes
                        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                    onChanged: (val) => setState(() => selectedRoute = val),
                    decoration: const InputDecoration(
                      labelText: 'Select Route',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),

              // Assign Button
              Center(
                child: ElevatedButton.icon(
                  onPressed: assignRoute,
                  icon: const Icon(Icons.assignment_turned_in, size: 18),
                  label: const Text('Assign Route'),
                  style: ElevatedButton.styleFrom(
                    iconColor: Colors.blueAccent,
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                    textStyle: const TextStyle(fontSize: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
