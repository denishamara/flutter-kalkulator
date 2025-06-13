import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'history.dart';
import 'profile.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kalkulator Imut',
      theme: ThemeData(primarySwatch: Colors.blue), // 💙 Ubah pink ke biru
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50], // 💙
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) => CalculatorPage())
            );
          },
          child: Bounce(
            infinite: true,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('logo.png', width: 150),
                SizedBox(height: 20),
                Text(
                  "Kalkulator Imut",
                  style: GoogleFonts.pacifico(
                    fontSize: 28, 
                    color: Colors.blue[700] // 💙
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String expression = "";
  String result = "0";
  List<String> history = []; // List untuk menyimpan history

  void onButtonPressed(String value) {
    setState(() {
      if (value == "C") {
        expression = "";
        result = "0";
      } else if (value == "=") {
        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);
          ContextModel cm = ContextModel();
          String evaluatedResult =
              "${exp.evaluate(EvaluationType.REAL, cm)}";
          
          history.add("$expression = $evaluatedResult"); // Simpan
          if (history.length > 10) history.removeAt(0);
          
          result = evaluatedResult;
        } catch (e) {
          result = "Error";
        }
      } else {
        expression += value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kalkulator", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue[300], // 💙
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue[300]), // 💙
              child: Center(
                child: Text("Menu",
                  style: TextStyle(color: Colors.white, fontSize: 24)),
              ),
            ),
            ListTile(
              title: Text("Kalkulator"),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              title: Text("History"),
              onTap: () async {
                await Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context) => HistoryPage(
                      history: List.from(history)
                    )
                  )
                );
                setState(() {});
              },
            ),
            ListTile(
              title: Text("Profile"),
              onTap: () => Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => ProfilePage())
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.blue[50], // 💙
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
              Container(
                alignment: Alignment.centerRight,
                padding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      expression,
                      style: TextStyle(
                        fontSize: 24, 
                        color: Colors.blue[900] // 💙
                      ),
                    ),
                    Text(
                      result,
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[700] // 💙
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 1.3,
                ),
                itemCount: buttons.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => onButtonPressed(buttons[index]),
                    child: Container(
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.blue[200], // 💙
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          buttons[index],
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

const List<String> buttons = [
  "7", "8", "9", "/",
  "4", "5", "6", "*",
  "1", "2", "3", "-",
  "C", "0", "=", "+",
];

class HistoryPage extends StatelessWidget {
  final List<String> history;

  HistoryPage({required this.history});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("History", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue[300], // 💙
      ),
      backgroundColor: Colors.blue[50], // 💙
      body: history.isEmpty
          ? Center(
              child: Text(
                "Belum ada history",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[700] // 💙
                ),
              ),
            )
          : ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: history.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: ListTile(
                    title: Text(
                      history[index],
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[700] // 💙
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
