import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:smart_routes/passenger/bus_stops.dart';
import 'package:smart_routes/passenger/feedback.dart';

class SearchResultsScreen extends StatefulWidget {
  final String from;
  final String to;

  const SearchResultsScreen({super.key, required this.from, required this.to});

  @override
  State<SearchResultsScreen> createState() => _SearchResultsScreenState();
}

class _SearchResultsScreenState extends State<SearchResultsScreen> {
  GoogleMapController? _mapController;

  // Dummy vehicle location (Kochi area)
  LatLng _dummyVehicleLocation = const LatLng(10.0159, 76.3419);

  // Simulated distance (in km) and fare rate
  double _dummyDistanceKm = 12.5;
  double _farePerKm = 6.0;

  double get estimatedFare => _dummyDistanceKm * _farePerKm;

  @override
  Widget build(BuildContext context) {
    final from = widget.from;
    final to = widget.to;

    return Scaffold(
      appBar: AppBar(
        title: Text('Route: $from → $to'),
        backgroundColor: Colors.lightBlue[200],
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // Google Map to show bus location and route
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: _dummyVehicleLocation,
              zoom: 14,
            ),
            markers: {
              Marker(
                markerId: const MarkerId("dummy_bus"),
                position: _dummyVehicleLocation,
                icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
                infoWindow: const InfoWindow(title: "Bus Location"),
              ),
            },
            onMapCreated: (controller) {
              _mapController = controller;
            },
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
          ),

          // Fare Card to show the estimated fare
          Positioned(
            top: 20,
            left: 20,
            right: 20,
            child: Card(
              color: Colors.lightBlue[50],
              elevation: 5,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Estimated Fare",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "₹${estimatedFare.toStringAsFixed(2)}",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Action Buttons (Feedback and Bus Stops)
          Positioned(
            bottom: 30,
            left: 20,
            right: 20,
            child: Column(
              children: [
                _buildActionButton(
                  icon: Icons.feedback_outlined,
                  text: "Give Feedback",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const FeedbackScreen()),
                    );
                  },
                ),
                const SizedBox(height: 10),
                _buildActionButton(
                  icon: Icons.map_outlined,
                  text: "View All Bus Stops",
                  onPressed: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BusStopsScreen(from: widget.from, to: widget.to),
                    ),
                  );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper function for building action buttons
  Widget _buildActionButton({
    required IconData icon,
    required String text,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton.icon(
        icon: Icon(icon),
        label: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.lightBlue[400],
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
