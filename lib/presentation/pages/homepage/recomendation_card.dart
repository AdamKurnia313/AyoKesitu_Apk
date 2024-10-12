import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../pemesanan/pemesanan_page.dart';

class RecomendationCard extends StatelessWidget {
  const RecomendationCard({
    super.key,
    required this.recommendation,
  });

  final Map<String, String> recommendation;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(const PemesananPage(), arguments: recommendation);
      },
      child: Container(
        width: 210,
        height: 249,
        margin: EdgeInsets.only(right: 16),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Color(0xfeD9D9D9),
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      recommendation["image"]!,
                      width: 186,
                      height: 132,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  recommendation["title"]!,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Image.asset('assets/img/Map Pin.png'),
                    SizedBox(width: 4),
                    Text(
                      recommendation["location"]!,
                      style: TextStyle(
                          color: const Color.fromARGB(255, 0, 0, 0),
                          fontFamily: 'Conamore',
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    SvgPicture.asset('assets/img/star.svg'),
                    Text(
                      recommendation['rating']!,
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            // Lingkaran dengan ikon di atasnya
            Positioned(
              top: 10, // Jarak dari atas
              right: 10, // Jarak dari kanan
              child: Stack(
                alignment:
                    Alignment.center, // Agar ikon berada di tengah lingkaran
                children: [
                  // Lingkaran
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            spreadRadius: 0,
                            blurRadius: 4,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Ikon di atas lingkaran
                  SvgPicture.asset(
                    'assets/img/favorite.svg',
                    width: 24,
                    height: 24,
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