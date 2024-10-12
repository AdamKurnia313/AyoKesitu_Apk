import 'dart:io'; // untuk File
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_flutter/presentation/pages/homeprofile/profile/profile.dart';
import 'package:project_flutter/presentation/pages/pemesanan/pemesanan_page.dart';
import 'package:provider/provider.dart'; // Import provider
import 'package:get/get.dart';

import 'popular_card.dart';
import 'recomendation_card.dart'; //

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProfileImage(), // Inisialisasi Provider
      child: MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}

// Model untuk menyimpan status gambar profil
class ProfileImage with ChangeNotifier {
  File? _image;

  File? get image => _image;

  void updateImage(File? image) {
    _image = image;
    notifyListeners(); // Beritahu pendengar bahwa ada perubahan
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    HomeScreenBody(),
    Placeholder(),
    Placeholder(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
Widget build(BuildContext context) {
  return Scaffold(
    body: Stack(
      children: [
        // Konten utama
        _widgetOptions[_selectedIndex],
        // Bottom Navigation Bar
        Positioned(
          bottom: 20, // Mengatur jarak dari bawah layar
          left: 0,
          right: 0,
          child: SafeArea(
            child: Container(
              width: 372,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.circular(30.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, -4),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
                child: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  currentIndex: _selectedIndex,
                  onTap: _onItemTapped,
                  items: [
                    BottomNavigationBarItem(
                      icon: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: _selectedIndex == 0 ? Color(0xfe00A550) : Colors.transparent,
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset(
                          'assets/img/Home.svg',
                          color: _selectedIndex == 0 ? const Color.fromARGB(255, 0, 0, 0) : Colors.grey,
                          height: 24,
                        ),
                      ),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: _selectedIndex == 1 ? Color(0xfe00A550) : Colors.transparent,
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset(
                          'assets/img/Heart.svg',
                          color: _selectedIndex == 1 ? const Color.fromARGB(255, 0, 0, 0) : Colors.grey,
                          height: 24,
                        ),
                      ),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: _selectedIndex == 2 ? Color(0xfe00A550) : Colors.transparent,
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset(
                          'assets/img/Send.svg',
                          color: _selectedIndex == 2 ? const Color.fromARGB(255, 0, 0, 0) : Colors.grey,
                          height: 24,
                        ),
                      ),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: _selectedIndex == 3 ? Color(0xfe00A550) : Colors.transparent,
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset(
                          'assets/img/User.svg',
                          color: _selectedIndex == 3 ? const Color.fromARGB(255, 0, 0, 0) : Colors.grey,
                          height: 24,
                        ),
                      ),
                      label: '',
                    ),
                  ],
                  selectedItemColor: const Color.fromARGB(255, 0, 0, 0),
                  unselectedItemColor: Colors.grey,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
}

class HomeScreenBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          SizedBox(
            height: 30,
          ),
          _buildSearch(),
          SizedBox(height: 10),
          _buildRecomendationSearch(),
          SizedBox(height: 20),
          _buildSectionTitle("Recommended", "Explore"),
          SizedBox(height: 10),
          _buildHorizontalList(),
          SizedBox(height: 10),
          _buildSectionTitle("Popular Activities", "see All"),
          _buildPopularActivities(),
        ],
      ),
    );
  }

  Widget _buildSearch() {
    return Center(
      child: Center(
        child: Row(
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
              width: 355,
              height: 45,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset('assets/img/Search.svg'),
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "",
                        border: InputBorder.none, // Hilangkan border default
                        contentPadding: EdgeInsets.symmetric(vertical: 8),
                      ),
                      onChanged: (value) {
                        // Tangkap teks yang diketik di sini
                        print("User is typing: $value");
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecomendationSearch() {
    return Row(
      children: [
        Container(
          width: 80,
          height: 35,
          decoration: BoxDecoration(
            color: Color(0xfe00A550),
            border: Border.all(
              color: Color(0xfe00A550),
            ),
            borderRadius: BorderRadius.circular(15),
          
          ),
          child: Row(
            children: [
              Image.asset("assets/img/beach.png")
              ,Text("Beach",style: TextStyle(
                color: Colors.white,
                fontSize: 12
              ),)
            ],
          ),
        ),
        
        Spacer(),
        Container(
          width: 80,
          height: 35,
          decoration: BoxDecoration(
            color: Color(0xfe00A550),
            border: Border.all(
              color: Color(0xfe00A550),
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Image.asset("assets/img/forest.png")
              ,Text("Forest",style: TextStyle(
                color: Colors.white,
                fontSize: 12
              ),)
            ],
          ),
        ),
        Spacer(),
        Container(
          width: 95,
          height: 35,
          decoration: BoxDecoration(
            color: Color(0xfe00A550),
            border: Border.all(
              color: Color(0xfe00A550),
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Image.asset("assets/img/mountain.png")
              ,Text("Mountain",style: TextStyle(
                color: Colors.white,
                fontSize: 12
              ),)
            ],
          ),
        ),
        Spacer(),
        Container(
          width: 80,
          height: 35,
          decoration: BoxDecoration(
            color: Color(0xfe00A550),
            border: Border.all(
              color: Color(0xfe00A550),
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Image.asset("assets/img/ride.png")
              ,Text("Ride",style: TextStyle(
                color: Colors.white,
                fontSize: 12
              ),)
            ],
          ),
        )
      ],
    );
  }

  Widget _buildSectionTitle(String title, String actionText) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Spacer(),
        Text(
          actionText,
          style: TextStyle(
              color: const Color.fromARGB(255, 0, 0, 0),
              fontSize: 12,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildHorizontalList() {
    final recommendations = [
      {
        "image":
            "assets/img/Ratenggaro-village-in-Sumba-Explore-Sumba-island-villages-in-Indonesia-10.jpg",
        "title": "Sumba Island",
        "location": "East Nusa Tenggara",
        "rating": "4.9",
      },
      {
        "image": "assets/img/bali.png",
        "title": "            Bali Island",
        "location": "Bali",
        "rating": "4.8",
      },
      {
        "image": "assets/img/lombok.jpg",
        "title": "Lombok Island",
        "location": "West Nusa Tenggara",
        "rating": "4.7",
      },
    ];

    return SizedBox(
      height: 220, // Sesuaikan ukuran ini dengan kebutuhan
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: recommendations.length,
        itemBuilder: (context, index) {
          return _buildRecommendationCard(recommendations[index]);
        },
      ),
    );
  }

   Widget _buildRecommendationCard(Map<String, String> recommendation) {
 
  return GestureDetector(
   onTap: () {
  print("Clicked on: ${recommendation["title"]}");
  switch (recommendation["title"]) {
    case "Sumba Island":
      Get.to(() => PemesananPage());
      break;
    case "Bali Island":
      // Navigasi ke halaman Bali
      break;
    case "Lombok Island":
      // Navigasi ke halaman Lombok
      break;
  }
},
      child: Container(
        margin: EdgeInsets.only(right: 16),
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
              child: Image.asset(
                recommendation["image"]!,
                width: 210,
                height: 249,
                fit: BoxFit.cover,
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
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
                ),
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Judul
                    Text(
                      recommendation["title"]!,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 4),

                    // Lokasi
                    Row(
                      children: [
                        Image.asset('assets/img/Map Pin.png', width: 12, height: 12),
                        SizedBox(width: 4),
                        Text(
                          recommendation["location"]!,
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),

                    // Rating
                    Row(
                      children: [
                        SvgPicture.asset('assets/img/star.svg', width: 12, height: 12),
                        SizedBox(width: 4),
                        Text(
                          recommendation['rating']!,
                          style: TextStyle(
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
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                  ),
                  // Ikon favorit
                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildPopularActivities() {
    final popularActivities = [
      {
        "image": "assets/img/91.png",
        "title": "Raja Ampat",
        "location": "West Papua",
        "rating": "5.0",
        "price": "\$250.00",
      },
      {
        "image":
            "assets/img/Lombok-to-Komodo-Island-4-Days-3-Night-Amazing-Trip.png",
        "title": "Komodo Island",
        "location": "East Nusa Tenggara",
        "rating": "4.9",
        "price": "\$300.00",
      },
      {
        "image": "assets/img/gili-islands-digital-nomads.png",
        "title": "Gili Islands",
        "location": "Lombok",
        "rating": "4.8",
        "price": "\$180.00",
      },
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: popularActivities.length,
      itemBuilder: (context, index) {
        return _buildPopularActivityCard(popularActivities[index]);
      },
    );
  }

  Widget _buildPopularActivityCard(Map<String, String> activity) {
    return Container(
      width: 355,
      height: 160,
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              spreadRadius: 0,
              blurRadius: 4,
              offset: Offset(0, 4),
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
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Mulai dari kiri
              children: [
                Row(
                  children: [
                    Text(
                      activity["title"]!,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    SvgPicture.asset(
                      'assets/img/favorite.svg',
                      width: 24,
                      height: 24,
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    SvgPicture.asset('assets/img/star.svg'),
                    Text(
                      activity['rating']!,
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Text(
                  activity["price"]!,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
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

class Order extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            "assets/img/91.png",
            width: 393,
            height: 400,
          ),
          Container(
            width: 71,
            height: 15,
            color: Colors.green,
          )
        ],
      ),
    );
  }
}