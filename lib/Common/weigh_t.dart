import 'package:flutter/material.dart';

class Weight extends StatefulWidget {
  const Weight({super.key});

  @override
  State<Weight> createState() => _WeightState();
}

class _WeightState extends State<Weight> {
  @override
  Widget build(BuildContext context) {
    return Weights();
  }
}

class Weights extends StatefulWidget {
  const Weights({super.key});

  @override
  State<Weights> createState() => _LengthsState();
}

class _LengthsState extends State<Weights> {
  double inputValue = 0.0;
  double convertedValue = 0.0;
  String fromUnit = 'Grams';
  String toUnit = 'Kilograms';

  final List<String> units = ['Grams', 'Kilograms', 'Pounds', 'Ounces'];

  Map<String, double> unitValues = {
    'Grams': 1.0,
    'Kilograms': 0.001,
    'Pounds': 0.00220462,
    'Ounces': 0.035274,
  };

  void convertWeight() {
    double inGrams = inputValue / unitValues[fromUnit]!;
    convertedValue = inGrams * unitValues[toUnit]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Weight Converter",
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
                value: fromUnit,
                onChanged: (String? newValue) {
                  setState(() {
                    fromUnit = newValue!;
                    convertWeight();
                  });
                },
                items: units.map<DropdownMenuItem<String>>((String value) {
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
                    convertWeight();
                  });
                },
                decoration: InputDecoration(
                  labelText: "$fromUnit",
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
                  hintText: "Enter : $fromUnit",
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
                value: toUnit,
                onChanged: (String? newValue) {
                  setState(() {
                    toUnit = newValue!;
                    convertWeight();
                  });
                },
                items: units.map<DropdownMenuItem<String>>((String value) {
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
                  "Result: $convertedValue $toUnit",
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
