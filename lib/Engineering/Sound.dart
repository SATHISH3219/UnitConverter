import 'package:flutter/material.dart';

class Sound extends StatelessWidget {
  const Sound({super.key});

  @override
  Widget build(BuildContext context) {
    return Sounds();
  }
}

class Sounds extends StatefulWidget {
  const Sounds({super.key});

  @override
  State<Sounds> createState() => _SoundsState();
}

class _SoundsState extends State<Sounds> {
  double inputValue = 0.0;
  double resultValue = 0.0;
  String fromSoundLevelUnit = 'Decibel (dB)';
  String toSoundLevelUnit = 'Bel (B)';

  final List<String> soundLevelUnits = [
    'Decibel (dB)',
    'Bel (B)',
    'Neper (Np)',
    'Sone'
  ];
  double valueInMeters = 0.0;
  void convertCurrent() {
    switch (fromSoundLevelUnit) {
      case 'Decibel (dB)':
        valueInMeters = inputValue * 1.0;
        break;
      case 'Bel (B)':
        valueInMeters = inputValue * 0.001;
        break;
      case 'Neper (Np)':
        valueInMeters = inputValue * 1e-5;
        break;
      case 'Sone':
        valueInMeters = inputValue * 9.8692 - 6;
        break;
    }
    switch (toSoundLevelUnit) {
      case 'Decibel (dB)':
        resultValue = valueInMeters * 1.0;
        break;
      case 'Bel (B)':
        resultValue = valueInMeters * 0.001;
        break;
      case 'Neper (Np)':
        resultValue = valueInMeters * 1e-5;
        break;
      case 'Sone':
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
            "Sound Converter",
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
                value: fromSoundLevelUnit,
                onChanged: (String? newValue) {
                  setState(() {
                    fromSoundLevelUnit = newValue!;
                    convertCurrent();
                  });
                },
                items: soundLevelUnits
                    .map<DropdownMenuItem<String>>((String value) {
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
                  labelText: "$fromSoundLevelUnit",
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
                  hintText: "Enter : $fromSoundLevelUnit",
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
                value: toSoundLevelUnit,
                onChanged: (String? newValue) {
                  setState(() {
                    toSoundLevelUnit = newValue!;
                    convertCurrent();
                  });
                },
                items: soundLevelUnits
                    .map<DropdownMenuItem<String>>((String value) {
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
                  "Result: $resultValue $toSoundLevelUnit",
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
