import 'package:flutter/material.dart';

class Power extends StatelessWidget {
  const Power({super.key});

  @override
  Widget build(BuildContext context) {
    return Powers();
  }
}

class Powers extends StatefulWidget {
  const Powers({super.key});

  @override
  State<Powers> createState() => _PowersState();
}

class _PowersState extends State<Powers> {
  double inputValue = 0.0;
  double resultValue = 0.0;
  String fromPowerUnit = 'Watt';
  String toPowerUnit = 'Kilowatt';

  final List<String> powerUnits = [
    'Watt',
    'Kilowatt',
    'Horsepower',
    'Megawatt'
  ];
  double valueInMeters = 0.0;
  void convertLength() {
    switch (fromPowerUnit) {
      case 'Watt':
        valueInMeters = inputValue * 1.0;
        break;
      case 'Kilowatt':
        valueInMeters = inputValue * 0.001;
        break;
      case 'Horsepower':
        valueInMeters = inputValue * 0.00134;
        break;
      case 'Megawatt':
        valueInMeters = inputValue * 1e-6;
        break;
    }
    switch (toPowerUnit) {
      case 'Watt':
        resultValue = valueInMeters * 1.0;
        break;
      case 'Kilowatt':
        resultValue = valueInMeters * 0.001;
        break;
      case 'Horsepower':
        resultValue = valueInMeters * 0.00134;
        break;
      case 'Megawatt':
        resultValue = valueInMeters * 1e-6;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Power Converter",
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
                value: fromPowerUnit,
                onChanged: (String? newValue) {
                  setState(() {
                    fromPowerUnit = newValue!;
                    convertLength();
                  });
                },
                items: powerUnits.map<DropdownMenuItem<String>>((String value) {
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
                    convertLength();
                  });
                },
                decoration: InputDecoration(
                  labelText: "$fromPowerUnit",
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
                  hintText: "Enter : $fromPowerUnit",
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
                value: toPowerUnit,
                onChanged: (String? newValue) {
                  setState(() {
                    toPowerUnit = newValue!;
                    convertLength();
                  });
                },
                items: powerUnits.map<DropdownMenuItem<String>>((String value) {
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
                  "Result: $resultValue $toPowerUnit",
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
