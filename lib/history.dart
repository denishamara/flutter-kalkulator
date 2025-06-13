import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  final List<String> history;

  const HistoryPage({Key? key, required this.history}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("History", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.pink[300],
      ),
      backgroundColor: Colors.pink[50],
      body: history.isEmpty
          ? Center(
              child: Text(
                "Belum ada history",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.pink[700]),
              ),
            )
          : ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: history.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  color: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    leading: Icon(Icons.history, color: Colors.pink[300]),
                    title: Text(
                      history[index],
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.pink[700]),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
