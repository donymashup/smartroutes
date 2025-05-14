import 'package:flutter/material.dart';

class ViewFeedbackScreen extends StatelessWidget {
  const ViewFeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> feedbacks = [
      {'user': 'Passenger A', 'feedback': 'Very convenient ride.'},
      {'user': 'Passenger B', 'feedback': 'Bus was late by 10 mins.'},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Passenger Feedbacks')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: feedbacks.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(feedbacks[index]['user']!),
              subtitle: Text(feedbacks[index]['feedback']!),
              leading: const Icon(Icons.feedback_outlined, color: Colors.blue),
            ),
          );
        },
      ),
    );
  }
}
