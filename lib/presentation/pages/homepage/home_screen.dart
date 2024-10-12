import 'dart:io'; // untuk File
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_flutter/presentation/pages/pemesanan/pemesanan_page.dart';
import 'package:provider/provider.dart'; // Import provider
import 'package:get/get.dart';

import '../profiles/profile/profile.dart';
import 'popular_card.dart';
import 'recomendation_card.dart'; //

void main() => runApp(const AyoKesitu());

class AyoKesitu extends StatelessWidget {
  const AyoKesitu({super.key});

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
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    HomeScreenBody(),
    const Placeholder(),
    const Placeholder(),
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
      body: SafeArea(
        child: Stack(
          children: [
            _widgetOptions.elementAt(_selectedIndex),
            Positioned(
              bottom: 0,
              left: (MediaQuery.of(context).size.width - 372) / 2,
              child: Container(
                width: 372,
                height: 70, // Sesuaikan tinggi berdasarkan ukuran layar
                margin: const EdgeInsets.only(bottom: 30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, -5),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: BottomNavigationBar(
                    items: [
                      BottomNavigationBarItem(
                        icon: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            color: _selectedIndex == 0
                                ? const Color(0xfe00A550)
                                : Colors.transparent,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              'assets/img/Home.svg',
                              color: _selectedIndex == 0
                                  ? Colors.black
                                  : Colors
                                      .grey, // Warna ikon saat dipilih dan tidak dipilih
                              width: 32,
                            ),
                          ),
                        ),
                        label: '', // Tidak ada label
                      ),
                      BottomNavigationBarItem(
                        icon: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            color: _selectedIndex == 1
                                ? const Color(0xfe00A550)
                                : Colors.transparent, // Warna saat dipilih
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              'assets/img/Heart.svg',
                              color: _selectedIndex == 1
                                  ? Colors.black
                                  : Colors
                                      .grey, // Warna ikon saat dipilih dan tidak dipilih
                              width: 32,
                            ),
                          ),
                        ),
                        label: '', // Tidak ada label
                      ),
                      BottomNavigationBarItem(
                        icon: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            color: _selectedIndex == 2
                                ? const Color(0xfe00A550)
                                : Colors.transparent, // Warna saat dipilih
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              'assets/img/Send.svg',
                              color: _selectedIndex == 2
                                  ? Colors.black
                                  : Colors.grey,
                              width: 32,
                            ),
                          ),
                        ),
                        label: '', // Tidak ada label
                      ),
                      BottomNavigationBarItem(
                        icon: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            color: _selectedIndex == 3
                                ? const Color(0xfe00A550)
                                : Colors.transparent, // Warna saat dipilih
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              'assets/img/User.svg',
                              color: _selectedIndex == 3
                                  ? Colors.black
                                  : Colors.grey,
                              width: 32,
                            ),
                          ),
                        ),
                        label: '', // Tidak ada label
                      ),
                    ],
                    currentIndex: _selectedIndex,
                    selectedItemColor: const Color.fromARGB(
                        255, 0, 0, 0), // Warna ikon saat dipilih
                    unselectedItemColor:
                        Colors.grey, // Warna ikon tidak dipilih
                    onTap: _onItemTapped,
                    showSelectedLabels: false, // Sembunyikan label terpilih
                    showUnselectedLabels:
                        false, // Sembunyikan label tidak terpilih
                    backgroundColor: Colors
                        .transparent, // Warna latar belakang navigation bar
                    elevation: 0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const SizedBox(
            height: 30,
          ),
          _buildSearch(),
          const SizedBox(height: 20),
          _buildSectionTitle("Recommended", "Explore"),
          const SizedBox(height: 10),
          _buildHorizontalList(),
          const SizedBox(height: 10),
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
            const SizedBox(
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
                      decoration: const InputDecoration(
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

  Widget _buildSectionTitle(String title, String actionText) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        Text(
          actionText,
          style: const TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
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
          return RecomendationCard(recommendation: recommendations[index]);
        },
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
      physics: const NeverScrollableScrollPhysics(),
      itemCount: popularActivities.length,
      itemBuilder: (context, index) {
        return PopularCard(activity: popularActivities[index]);
      },
    );
  }
}

class Order extends StatelessWidget {
  const Order({super.key});

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
