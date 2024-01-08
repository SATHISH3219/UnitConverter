import 'package:flutter/material.dart';
import 'package:unitconverter/Common/currency.dart';

import 'Common/length.dart';
import 'Common/speed.dart';
import 'Common/weigh_t.dart';

class MyGridView extends StatelessWidget {
  const MyGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return MyGridViews();
  }
}

class MyGridViews extends StatefulWidget {
  const MyGridViews({super.key});

  @override
  State<MyGridViews> createState() => _MyGridViewsState();
}

class _MyGridViewsState extends State<MyGridViews> {
  final List<String> image = [
    'images/Currency.png',
    'images/Length.png',
    'images/Speed.png',
    'images/Weight.png',
  ];
  final List<String> text = [
    'Currency',
    'Length',
    'Speed',
    'Weight',
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              navigateToPage(context, index);
            },
            child: Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black, spreadRadius: 0, blurRadius: 4),
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Center(
                      child: Image.asset(
                        image[index],
                        width: 80.0,
                        height: 80.0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(text[index]),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void navigateToPage(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Currency()));
        break;
      case 1:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Length()));
        break;
      case 2:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Speed()));
        break;
      case 3:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Weight()));
        break;
      default:
        break;
    }
  }
}
