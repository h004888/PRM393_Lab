import 'package:lab5/Views/Widgets/ProductList.dart';
import 'package:flutter/material.dart';
import 'package:lab5/Views/Widgets/ButtonBar.dart';
import 'package:lab5/Views/Widgets/Product_Widget.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Center(child: Text("About Page")),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) => Container(
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue, width: 2),
          ),
          child: GridView.count(
            crossAxisCount: MediaQuery.of(context).size.width < 700 ? 1 : 2,
            children: [
              _buildInfoCard(Icons.person, "Column 1", "Author Information"),
              _buildInfoCard(Icons.school, "Column 2", "Education Details"),
              _buildInfoCard(Icons.work, "Column 3", "Work Experience"),
              _buildInfoCard(Icons.contact_mail, "Column 4", "Contact Info"),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const Buttonbar(),
    );
  }

  Widget _buildInfoCard(IconData icon, String title, String subtitle) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48, color: Colors.blue),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(subtitle),
          ],
        ),
      ),
    );
  }
}
