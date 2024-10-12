import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';

class PemesananPage extends StatelessWidget {
  const PemesananPage({super.key});

  @override
  Widget build(BuildContext context) {
    final recommendation = Get.arguments as Map<String, String>;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Image and overlay
            Stack(
              children: [
                Image.asset(
                  'assets/img/image_pemesanan.png',
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 40,
                  left: 20,
                  child: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(Icons.arrow_back, color: Colors.white)),
                ),
                const Positioned(
                  top: 40,
                  right: 20,
                  child: Icon(Icons.favorite_border, color: Colors.white),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title and location
                  Text(
                    recommendation['title'].toString(),
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Row(
                    children: [
                      Icon(Icons.location_on, size: 16),
                      SizedBox(width: 4),
                      Text('Sumba Island, East Nusa Tenggara'),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // Rating
                  const Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow, size: 16),
                      SizedBox(width: 4),
                      Text('4.9 (69 Reviews)'),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Amenities
                  const Text('Amenities',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      _buildChip('Breakfast, Lunch & Dinner'),
                      _buildChip('Hotel AC'),
                      _buildChip('Guide/Tour Leader'),
                      _buildChip('Transportation AC'),
                      _buildChip('Tour Tickets'),
                      _buildChip('Documentation'),
                      _buildChip('Airport Shuttle'),
                      _buildChip('Mineral Water'),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Self Check-in and Clean Accommodation
                  _buildInfoRow(Icons.phone_android, 'Self Check-in',
                      'Check yourself in with our mobile app'),
                  const SizedBox(height: 8),
                  _buildInfoRow(Icons.cleaning_services, 'Clean Accommodation',
                      'CHSE-certified accommodations for applying hygiene protocol'),
                  const SizedBox(height: 16),
                  // Price and Booking
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Price starts from'),
                          Text(
                            '\$196,46',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                          Text('/ 4 Day 3 Night'),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32, vertical: 16),
                        ),
                        child: Text('Booking'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChip(String label) {
    return Chip(
      label: Text(label, style: const TextStyle(fontSize: 12)),
      backgroundColor: Colors.grey[200],
    );
  }

  Widget _buildInfoRow(IconData icon, String title, String subtitle) {
    return Row(
      children: [
        Icon(icon),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(
              width: Get.width * 0.8,
              child: Text(
                subtitle,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
