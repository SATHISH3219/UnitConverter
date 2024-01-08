import 'package:flutter/material.dart';

class pressure extends StatelessWidget {
  const pressure({super.key});

  @override
  Widget build(BuildContext context) {
    return pressures();
  }
}

class pressures extends StatefulWidget {
  const pressures({super.key});

  @override
  State<pressures> createState() => _pressuresState();
}

class _pressuresState extends State<pressures> {
  double inputValue = 0.0;
  double resultValue = 0.0;
  String fromPressureUnit = 'Pascal (Pa)';
  String toPressureUnit = 'Kilopascal (kPa)';

  final List<String> pressureUnits = [
    'Pascal (Pa)',
    'Kilopascal (kPa)',
    'Bar',
    'Atmosphere (atm)'
  ];
  double valueInMeters = 0.0;
  void convertCurrent() {
    switch (fromPressureUnit) {
      case 'Pascal (Pa)':
        valueInMeters = inputValue * 1.0;
        break;
      case 'Kilopascal (kPa)':
        valueInMeters = inputValue * 0.001;
        break;
      case 'Bar':
        valueInMeters = inputValue * 1e-5;
        break;
      case 'Atmosphere (atm)':
        valueInMeters = inputValue * 9.8692 - 6;
        break;
    }
    switch (toPressureUnit) {
      case 'Pascal (Pa)':
        resultValue = valueInMeters * 1.0;
        break;
      case 'Kilopascal (kPa)':
        resultValue = valueInMeters * 0.001;
        break;
      case 'Bar':
        resultValue = valueInMeters * 1e-5;
        break;
      case 'Atmosphere (atm)':
        resultValue = valueInMeters * 9.8692 - 6;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Pressure Converter",
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
                value: fromPressureUnit,
                onChanged: (String? newValue) {
                  setState(() {
                    fromPressureUnit = newValue!;
                    convertCurrent();
                  });
                },
                items:
                    pressureUnits.map<DropdownMenuItem<String>>((String value) {
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
                  labelText: "$fromPressureUnit",
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
                  hintText: "Enter : $fromPressureUnit",
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
                value: toPressureUnit,
                onChanged: (String? newValue) {
                  setState(() {
                    toPressureUnit = newValue!;
                    convertCurrent();
                  });
                },
                items:
                    pressureUnits.map<DropdownMenuItem<String>>((String value) {
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
                  "Result: $resultValue $toPressureUnit",
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
