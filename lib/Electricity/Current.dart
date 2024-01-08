import 'package:flutter/material.dart';

class Current extends StatelessWidget {
  const Current({super.key});

  @override
  Widget build(BuildContext context) {
    return const Currents();
  }
}

class Currents extends StatefulWidget {
  const Currents({super.key});

  @override
  State<Currents> createState() => _CurrentsState();
}

class _CurrentsState extends State<Currents> {
  double inputValue = 0.0;
  double resultValue = 0.0;
  String fromCurrentUit = 'Ampere';
  String toCurrentUnit = 'Milliampere';

  final List<String> currentUnits = [
    'Ampere',
    'Milliampere',
    'Microampere',
    'Kiloampere'
  ];
  double valueInMeters = 0.0;
  void convertCurrent() {
    switch (fromCurrentUit) {
      case 'Ampere':
        valueInMeters = inputValue * 1.0;
        break;
      case 'Milliampere':
        valueInMeters = inputValue * 1000.0;
        break;
      case 'Microampere':
        valueInMeters = inputValue * 1e-6;
        break;
      case 'Kiloampere':
        valueInMeters = inputValue * 0.001;
        break;
    }
    switch (toCurrentUnit) {
      case 'Ampere':
        resultValue = valueInMeters * 1.0;
        break;
      case 'Milliampere':
        resultValue = valueInMeters * 1000.0;
        break;
      case 'Microampere':
        resultValue = valueInMeters * 1e-6;
        break;
      case 'Kiloampere':
        resultValue = valueInMeters * 0.001;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Current Converter",
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
                value: fromCurrentUit,
                onChanged: (String? newValue) {
                  setState(() {
                    fromCurrentUit = newValue!;
                    convertCurrent();
                  });
                },
                items:
                    currentUnits.map<DropdownMenuItem<String>>((String value) {
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
                    convertCurrent();
                  });
                },
                decoration: InputDecoration(
                  labelText: "$fromCurrentUit",
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
                  hintText: "Enter : $fromCurrentUit",
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
                value: toCurrentUnit,
                onChanged: (String? newValue) {
                  setState(() {
                    toCurrentUnit = newValue!;
                    convertCurrent();
                  });
                },
                items:
                    currentUnits.map<DropdownMenuItem<String>>((String value) {
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
                  "Result: $resultValue $toCurrentUnit",
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
