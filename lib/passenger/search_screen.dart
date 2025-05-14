import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_routes/passenger/location_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final fromController = TextEditingController();
  final toController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Smart Routes"),
        backgroundColor: Colors.lightBlue[200],
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 40),
            Text(
              'Find Your Route',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.lightBlue[800],
              ),
            ),
            const SizedBox(height: 30),
            _buildTextField(
              controller: fromController,
              label: "From",
              icon: Icons.location_on_outlined,
            ),
            const SizedBox(height: 20),
            _buildTextField(
              controller: toController,
              label: "To",
              icon: Icons.flag_outlined,
            ),
            const SizedBox(height: 40),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: isLoading
                  ? const CircularProgressIndicator(
                      color: Colors.lightBlue,
                    )
                  : SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton.icon(
                        key: const ValueKey("search_button"),
                        icon: const Icon(Icons.search),
                        label: const Text(
                          "Search Route",
                          style:
                              TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        onPressed: _handleSearch,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightBlue[400],
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.lightBlue[400]),
        filled: true,
        fillColor: Colors.lightBlue[50],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  void _handleSearch() async {
  final from = fromController.text.trim();
  final to = toController.text.trim();

  if (from.isEmpty || to.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Please enter both locations'),
        backgroundColor: Colors.redAccent,
      ),
    );
    return;
  }

  setState(() => isLoading = true);

  // Simulate loading for 2 seconds
  await Future.delayed(const Duration(seconds: 2));

  setState(() => isLoading = false);

  // Navigate to the search results screen and pass data
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => SearchResultsScreen(from: from, to: to),
    ),
  );
}

}
