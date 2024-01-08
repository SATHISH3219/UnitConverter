import 'package:flutter/material.dart';

class Length extends StatelessWidget {
  const Length({super.key});

  @override
  Widget build(BuildContext context) {
    return const Lengths();
  }
}

class Lengths extends StatefulWidget {
  const Lengths({super.key});

  @override
  State<Lengths> createState() => _LengthsState();
}

class _LengthsState extends State<Lengths> {
  double inputValue = 0.0;
  double resultValue = 0.0;
  String fromUnit = 'Meters';
  String toUnit = 'Meters';
  double valueInMeters = 0.0;
  void convertLength() {
    switch (fromUnit) {
      case 'Meters':
        valueInMeters = inputValue;
        break;
      case 'Centimeters':
        valueInMeters = inputValue / 100;
        break;
      case 'Inches':
        valueInMeters = inputValue * 0.0254;
        break;
      case 'KiloMeters':
        valueInMeters = inputValue * 100;
        break;
    }
    switch (toUnit) {
      case 'Meters':
        resultValue = valueInMeters;
        break;
      case 'Centimeters':
        resultValue = valueInMeters * 100;
        break;
      case 'Inches':
        resultValue = valueInMeters * 0.0254;
        break;
      case 'KiloMeters':
        resultValue = valueInMeters / 1000;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Length Converter",
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
          const SizedBox(
            height: 30,
          ),
          const Column(
            children: [
              Text(
                "From: Choose your Choice to convert",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Column(
            children: [
              DropdownButton<String>(
                value: fromUnit,
                onChanged: (String? newValue) {
                  setState(() {
                    fromUnit = newValue!;
                    convertLength();
                  });
                },
                items: <String>['Meters', 'Centimeters', 'Inches', 'KiloMeters']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: const TextStyle(fontSize: 20),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextField(
                onChanged: (value1) {
                  setState(() {
                    inputValue = double.tryParse(value1) ?? 0.0;
                    convertLength();
                  });
                },
                decoration: InputDecoration(
                  labelText: "$fromUnit",
                  labelStyle: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w500),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(20)),
                  hintText: "Enter : $fromUnit",
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Column(
            children: [
              Text(
                "To: Choose your Choice to convert",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Column(
            children: [
              DropdownButton<String>(
                value: toUnit,
                onChanged: (String? newValue) {
                  setState(() {
                    toUnit = newValue!;
                    convertLength();
                  });
                },
                items: <String>['Meters', 'Centimeters', 'Inches', 'KiloMeters']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: const TextStyle(fontSize: 20),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Result: $resultValue $toUnit",
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
              )
            ],
          ),
        ],
      ),
    );
  }
}
