import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../pemesanan/pemesanan_page.dart';

class RecomendationCard extends StatelessWidget {
  const RecomendationCard({
    super.key,
    required this.recommendation,
  });

  final Map<String, String?> recommendation;

  @override
  Widget build(BuildContext context) {
    // Variabel untuk menyimpan status favorit
    bool isFavorite = false;

    return GestureDetector(
      onTap: () {
        Get.to(() => PemesananPage(), arguments: recommendation);
      },
      child: Container(
        margin: const EdgeInsets.only(right: 16),
        width: 207,
        height: 249,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey[200],
        ),
        child: Stack(
          children: [
            // Gambar utama
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: recommendation["image"] != null
                  ? Image.asset(
                      recommendation["image"]!,
                      width: 210,
                      height: 249,
                      fit: BoxFit.cover,
                    )
                  : Container(
                      width: 210,
                      height: 249,
                      color: Colors.grey,
                      child: const Icon(Icons.image),
                    ),
            ),

            // Overlay untuk teks di bagian bawah
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius:
                      const BorderRadius.vertical(bottom: Radius.circular(12)),
                ),
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Judul
                    Text(
                      recommendation["title"] ?? "Unknown",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),

                    // Lokasi
                    Row(
                      children: [
                        Image.asset('assets/img/Map Pin.png',
                            width: 12, height: 12),
                        const SizedBox(width: 4),
                        Text(
                          recommendation["location"] ?? "Unknown",
                          style: const TextStyle(
                              color: Colors.white, fontSize: 12),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),

                    // Rating
                    Row(
                      children: [
                        SvgPicture.asset('assets/img/star.svg',
                            width: 12, height: 12),
                        const SizedBox(width: 4),
                        Text(
                          recommendation['rating'] ?? "0.0",
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Lingkaran dengan ikon favorit di atas gambar
            Positioned(
              top: 10,
              right: 10,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Lingkaran
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 4,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                  ),
                  // Ikon favorit
                  SvgPicture.asset(
                    'assets/img/favorite.svg',
                    width: 24,
                    height: 24,
                    color: isFavorite
                        ? Colors.red
                        : Colors
                            .black, // Mengubah warna berdasarkan status favorit
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
