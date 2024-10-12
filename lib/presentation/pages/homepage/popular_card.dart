import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PopularCard extends StatelessWidget {
  const PopularCard({
    super.key,
    required this.activity,
  });

  final Map<String, String> activity;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 355,
      height: 160,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              spreadRadius: 0,
              blurRadius: 4,
              offset: const Offset(0, 4),
            ),
          ]),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              activity["image"]!,
              fit: BoxFit.cover,
              width: 111,
              height: 135, // Sesuaikan ukuran sesuai kebutuhan
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Mulai dari kiri
              children: [
                Row(
                  children: [
                    Text(
                      activity["title"]!,
                      style:
                          const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    SvgPicture.asset(
                      'assets/img/favorite.svg',
                      width: 24,
                      height: 24,
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    SvgPicture.asset('assets/img/star.svg'),
                    Text(
                      activity['rating']!,
                      style:
                          const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Text(
                  activity["price"]!,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                const Text(
                  "A resort is a place used for vacation, relaxation, or as a day....",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
