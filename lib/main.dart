import 'package:flutter/material.dart';
import 'package:unitconverter/my_grid_viewe.dart';

import 'my_grid_view.dart';
import 'my_grid_viewee.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApps(),
    );
  }
}

class MyApps extends StatefulWidget {
  const MyApps({super.key});

  @override
  State<MyApps> createState() => _MyAppsState();
}

class _MyAppsState extends State<MyApps> {
  final List<String> image = [
    'images/Currency.png',
    'images/Length.png',
    'images/Speed.png',
    'images/Weight.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Unit Converter",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w900, fontSize: 30),
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: const Color.fromARGB(255, 35, 165, 221),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(30),
              bottomLeft: Radius.circular(30)),
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            const UserAccountsDrawerHeader(
              accountName: Text("User"),
              accountEmail: Text("User321@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
              ),
              decoration: BoxDecoration(color: Colors.grey),
            ),
            ListTile(
              title: const Text("Common"),
              leading: const Icon(Icons.line_weight_rounded),
              onTap: () {},
            ),
            ListTile(
              title: const Text("Engineering"),
              leading: const Icon(Icons.engineering),
              onTap: () {},
            ),
            ListTile(
              title: const Text("Electricity"),
              leading: const Icon(Icons.electric_bike_rounded),
              onTap: () {},
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: const [
            Text(
              "Common",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
            ),
            MyGridView(),
            Divider(
              height: 20,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            Text(
              "Electricity",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
            ),
            MyGridViewe(),
            Divider(
              height: 20,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            Text(
              "Engineering",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
            ),
            MyGridViewee()
            // Add other widgets here if needed
          ],
        ),
      ),
    );
  }
}
