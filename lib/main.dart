import 'package:flutter/material.dart';
import 'package:tempat_wisata/detail_screen.dart';

void main() {
  runApp(const WisataApp());
}

class WisataApp extends StatelessWidget {
  const WisataApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tempat Wisata Indonesia",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Tempat Wisata Indonesia"),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Center(
            child: Text("Welcome, This Page Under Construction"),
          ),
          ElevatedButton(
            child: const Text('Generate Image'),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const DetailScreen();
              }));
            },
          )
        ]));
  }
}
