import 'package:flutter/material.dart';
import 'package:fruit_app/fruit.dart';
import 'package:fruit_app/fruitList.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final String title;
  late final Future<List<Fruit>> products;

  Future<List<Fruit>> fetchFruit() async {
    final response = await http.get(url);
  }

  String url = "https://fruit-api.apilot.io/api/fruits";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF4CAF50),
        title: Text("Fruit App with Rest API"),
      ),
      body: Center(
        child: FutureBuilder<List<Fruit>>(
          future: products,
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? FruitList(
                    items: snapshot.data,
                    key: null,
                  )
                : Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
