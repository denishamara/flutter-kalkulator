import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'main.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: GestureDetector(
          onTap: () {
            // Navigasi ke halaman kalkulator saat ditekan
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CalculatorPage()),
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('logo.png', width: 150),
              SizedBox(height: 20),
              Text(
                "Kalkulator Imut",
                style: GoogleFonts.pacifico(fontSize: 28, color: Colors.pink[700]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
