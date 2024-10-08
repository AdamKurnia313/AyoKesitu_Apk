import 'dart:io'; // untuk File
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart'; // Import provider
import 'profile.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/img/Home.svg',
              color: _selectedIndex == 0 ? Colors.black : Colors.grey,
              width: 24,
            ),
            label: '', // Berikan label kosong
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/img/Heart.svg',
              color: _selectedIndex == 1 ? Colors.black : Colors.grey,
              width: 24,
            ),
            label: '', // Berikan label kosong
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/img/Calendar.svg',
              color: _selectedIndex == 2 ? Colors.black : Colors.grey,
              width: 24,
            ),
            label: '', // Berikan label kosong
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/img/User.svg',
              color: _selectedIndex == 3 ? Colors.black : Colors.grey,
              width: 24,
            ),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        showSelectedLabels: false, 
        showUnselectedLabels: false, 
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
            height: 60,
          ),
          _buildSearch(),
          SizedBox(height: 10),
          _buildRecomendationSearch(),
          SizedBox(height: 20),
          _buildSectionTitle("Recommended", "Explore"),
          SizedBox(height: 10),
          _buildHorizontalList(),
          SizedBox(height: 10),
          _buildSectionTitle("Popular Activities","see All"),
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
                color: Color(0xfeD9D9D9),
                border: Border.all(
                  color: Color(0xfeD9D9D9),
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
            color: Color(0xfeD9D9D9),
            border: Border.all(
              color: Color(0xfeD9D9D9),
            ),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        Spacer(),
        Container(
          width: 80,
          height: 35,
          decoration: BoxDecoration(
            color: Color(0xfeD9D9D9),
            border: Border.all(
              color: Color(0xfeD9D9D9),
            ),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        Spacer(),
        Container(
          width: 80,
          height: 35,
          decoration: BoxDecoration(
            color: Color(0xfeD9D9D9),
            border: Border.all(
              color: Color(0xfeD9D9D9),
            ),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        Spacer(),
        Container(
          width: 80,
          height: 35,
          decoration: BoxDecoration(
            color: Color(0xfeD9D9D9),
            border: Border.all(
              color: Color(0xfeD9D9D9),
            ),
            borderRadius: BorderRadius.circular(15),
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
          style: TextStyle(color: Colors.blue),
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
        "title": "Bali Island",
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
  return Container(
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
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
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
            alignment: Alignment.center, // Agar ikon berada di tengah lingkaran
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
                      spreadRadius: 0,
                      blurRadius: 4,
                      offset: Offset(0, 4),
                    ),
                  ],
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
        color: Color(0xfeD9D9D9),
      ),
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
