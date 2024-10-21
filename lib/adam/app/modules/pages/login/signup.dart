import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignUpScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/img/image.png'), // Background image path
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Content
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              // Logo and Slogan
              SizedBox(height: 50), // Tambahkan sedikit jarak dari atas
              Image.asset(
                'assets/img/logo.png', // Logo image path
                width: 150,
                height: 150,
              ),
              SizedBox(height: 0), // Tambahkan jarak antara logo dan slogan
              Text(
                'Travel with ease, Discover with Dave',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w300, // Lebih ringan untuk slogan
                ),
              ),
              Spacer(), // Adds space to push the next section to the center
              // Centralized Sign-up Section
              Center(
                child: Column(
                  children: [
                    Text(
                      'Sign up now',
                      style: TextStyle(
                        fontSize: 28, // Ukuran yang lebih proporsional
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Please fill the details and create account',
                      style: TextStyle(
                        fontSize: 16, // Ukuran teks sedikit lebih besar
                        color: Colors.white70,
                      ),
                    ),
                    SizedBox(height: 25),
                    // Name Input
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9), // Lebih terang
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Bruno', // Example Name
                            prefixIcon: Icon(Icons.person, color: Colors.grey),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                          ),
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    // Email Input
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9), // Lebih terang
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'www.teting@gmail.com', // Example Email
                            prefixIcon: Icon(Icons.email, color: Colors.grey),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                          ),
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    // Password Input
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9), // Lebih terang
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '**********',
                            prefixIcon: Icon(Icons.lock, color: Colors.grey),
                            suffixIcon: Icon(Icons.visibility_off, color: Colors.grey),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                          ),
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 40.0),
                        child: Text(
                          'Password must be 8 characters',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(), // Adds space to ensure the Sign Up part stays central
              SizedBox(height: 20),
              // Create Account Button
              ElevatedButton(
                onPressed: () {
                  // Add your navigation or sign-up action here
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  backgroundColor: Colors.green, // Warna hijau yang diinginkan
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'Create Account',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              SizedBox(height: 10),
              // Sign In Button
              ElevatedButton(
                onPressed: () {
                  // Add sign-in navigation here
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                  backgroundColor: Color(0xFF008440),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'Sign In',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              SizedBox(height: 10),
              // Google Sign In Button
              ElevatedButton.icon(
                onPressed: () {
                  // Add Google Sign-in action
                },
                icon: Icon(Icons.login, color: Colors.grey),
                label: Text('Sign In With Google Account'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  minimumSize: Size(250, 50),
                  foregroundColor: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              // Terms of Service
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  "By creating an account or signing up, you agree to our Terms of Service and Privacy Policy",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                  ),
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ],
      ),
    );
  }
}
