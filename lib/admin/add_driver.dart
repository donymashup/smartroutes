import 'package:flutter/material.dart';

class DriverRequestScreen extends StatefulWidget {
  const DriverRequestScreen({super.key});

  @override
  State<DriverRequestScreen> createState() => _DriverRequestScreenState();
}

class _DriverRequestScreenState extends State<DriverRequestScreen> {
  // List of dummy data representing new driver requests with additional details
  final List<Map<String, String>> driverRequests = [
    {
      'name': 'John Doe',
      'phone': '123-456-7890',
      'license': 'AB12345',
      'location': 'City Center',
      'status': 'Pending',
    },
    {
      'name': 'Priya Sharma',
      'phone': '987-654-3210',
      'license': 'XY98765',
      'location': 'North Gate',
      'status': 'Pending',
    },
    {
      'name': 'Amit Kumar',
      'phone': '555-123-4567',
      'license': 'MN56789',
      'location': 'Tech Park',
      'status': 'Pending',
    },
  ];

  // Function to handle the acceptance of a driver request
  void acceptRequest(int index) {
    setState(() {
      driverRequests[index]['status'] = 'Accepted';
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${driverRequests[index]['name']} accepted!')),
    );
  }

  // Function to handle the rejection of a driver request
  void rejectRequest(int index) {
    setState(() {
      driverRequests[index]['status'] = 'Rejected';
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${driverRequests[index]['name']} rejected!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Driver Requests'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: driverRequests.length,
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 5,
              child: ListTile(
                contentPadding: const EdgeInsets.all(16.0),
                title: Text(driverRequests[index]['name']!),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Phone: ${driverRequests[index]['phone']}'),
                    Text('License: ${driverRequests[index]['license']}'),
                    Text('Location: ${driverRequests[index]['location']}'),
                  ],
                ),
                trailing: Text(
                  driverRequests[index]['status']!,
                  style: TextStyle(
                    color: driverRequests[index]['status'] == 'Accepted'
                        ? Colors.green
                        : driverRequests[index]['status'] == 'Rejected'
                            ? Colors.red
                            : Colors.orange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                isThreeLine: true,
                leading: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.blueAccent,
                  child: const Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                titleTextStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                subtitleTextStyle: TextStyle(fontSize: 14, color: Colors.black54),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton.icon(
          onPressed: () {
            // Code to view all the approved drivers (or other functionality)
          },
          icon: const Icon(Icons.check_circle_outline),
          label: const Text('View Approved Drivers'),
          style: ElevatedButton.styleFrom(
            iconColor: Colors.blueAccent,
            padding: const EdgeInsets.symmetric(vertical: 14),
            textStyle: const TextStyle(fontSize: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ),
    );
  }
}
