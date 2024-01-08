import 'package:flutter/material.dart';

class Speed extends StatefulWidget {
  const Speed({super.key});

  @override
  State<Speed> createState() => _SpeedState();
}

class _SpeedState extends State<Speed> {
  @override
  Widget build(BuildContext context) {
    return const Speeds();
  }
}

class Speeds extends StatefulWidget {
  const Speeds({super.key});

  @override
  State<Speeds> createState() => _LengthsState();
}

class _LengthsState extends State<Speeds> {
  double inputValue = 0.0;
  double resultValue = 0.0;
  String fromSpeed = "Miles per Hour";
  String toSpeed = "Kilometers per Hour";

  final List<String> speeds = [
    'Miles per Hour',
    'Kilometers per Hour',
    'Meters per Second',
    'Feet per Second'
  ];
  Map<String, double> conversionFactors = {
    'Miles per Hour': 1.0,
    'Kilometers per Hour': 1.60934,
    'Meters per Second': 0.44704,
    'Feet per Second': 1.46667,
  };
  @override
  void initState() {
    super.initState();
    convertSpeed();
  }

  void convertSpeed() {
    double valueInMilesPerHour = inputValue / conversionFactors[fromSpeed]!;
    resultValue = valueInMilesPerHour * conversionFactors[toSpeed]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Speed Converter",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w800, fontSize: 25),
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
      body: ListView(
        children: [
          SizedBox(
            height: 30,
          ),
          Column(
            children: [
              Text(
                "From: Choose your Choice to convert",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Column(
            children: [
              DropdownButton<String>(
                value: fromSpeed,
                onChanged: (String? newValue) {
                  setState(() {
                    fromSpeed = newValue!;
                    convertSpeed();
                  });
                },
                items: speeds.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(fontSize: 20),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.all(18.0),
              child: TextField(
                onChanged: (value1) {
                  setState(() {
                    inputValue = double.tryParse(value1) ?? 0.0;
                    convertSpeed();
                  });
                },
                decoration: InputDecoration(
                  labelText: "$fromSpeed",
                  labelStyle: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w500),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(20)),
                  hintText: "Enter : $fromSpeed",
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Column(
            children: [
              Text(
                "To: Choose your Choice to convert",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Column(
            children: [
              DropdownButton<String>(
                value: toSpeed,
                onChanged: (String? newValue) {
                  setState(() {
                    toSpeed = newValue!;
                    convertSpeed();
                  });
                },
                items: speeds.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(fontSize: 20),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Result: $resultValue $toSpeed",
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.w900),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
