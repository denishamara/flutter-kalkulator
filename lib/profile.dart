import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tentang Aplikasi", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.pink[300],
      ),
      backgroundColor: Colors.pink[50],
      body: Center(
        child: Container(
          width: 350,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset("logo.png", width: 100), // Gunakan logo tanpa "assets/"
              SizedBox(height: 10),
              Text(
                "Aplikasi Kalkulator Coquette",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.pink[700]),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                "Aplikasi kalkulator ini dibuat dengan Flutter dan dirancang dengan nuansa pink baby yang lucu dan imut. "
                "Dilengkapi dengan fitur perhitungan dasar, riwayat, dan tampilan menarik untuk pengguna.",
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text("Versi: 1.0.0", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text("Dibuat oleh: Denisha Amara", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}
