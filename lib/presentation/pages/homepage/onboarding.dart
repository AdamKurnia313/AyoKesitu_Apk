import 'package:flutter/material.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bromo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const BromoPage(),
    );
  }
}

class BromoPage extends StatelessWidget {
  const BromoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.network(
            'https://storyblok-image.ef.com/unsafe/1500x750/filters:focal(960x375:961x376):quality(70)/f/78828/dd7b752616/ef-id-blog-top-banner-6-tips-wisata-ke-bromo-dari-malang.jpg', // Replace with actual image URL
            fit: BoxFit.cover,
          ),
          // Overlay Content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  const Text(
                    'BROMO',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'The procurement of Jeeps for the purpose of crossing Mount Bromo is very '
                    'important, because the rugged landscape requires durable vehicles and '
                    'skilled operators. Furthermore, regulations set by the Bromo Tengger '
                    'Semeru National Park further support the use of Jeeps to facilitate safer and '
                    'more effective exploration.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      // Add functionality for CONTINUE button
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    child: const Text('CONTINUE'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
