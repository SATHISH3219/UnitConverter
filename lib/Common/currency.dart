import 'package:flutter/material.dart';

class Currency extends StatefulWidget {
  const Currency({super.key});

  @override
  State<Currency> createState() => _CurrencyState();
}

class _CurrencyState extends State<Currency> {
  @override
  Widget build(BuildContext context) {
    return const Currencys();
  }
}

class Currencys extends StatefulWidget {
  const Currencys({super.key});

  @override
  State<Currencys> createState() => _LengthsState();
}

class _LengthsState extends State<Currencys> {
  double inputValue = 0.0;
  double resultValue = 0.0;
  String fromCurrency = 'Indian Rupee';
  String toCurrency = 'US Dollar';

  final List<String> currencies = [
    'Euro',
    'Indian Rupee',
    'US Dollar',
    'Japanese Yen'
  ];

  Map<String, double> conversionRates = {};

  @override
  void initState() {
    super.initState();
    initializeConversionRates();
  }

  void initializeConversionRates() {
    conversionRates = {
      'Euro': 1.0,
      'Indian Rupee': 88.85,
      'US Dollar': 1.18,
      'Japanese Yen': 130.42,
    };
    convertCurrency();
  }

  void convertCurrency() {
    double valueInEuro = inputValue / conversionRates[fromCurrency]!;

    switch (toCurrency) {
      case 'Euro':
        resultValue = valueInEuro;
        break;
      case 'Indian Rupee':
        resultValue = valueInEuro * conversionRates['Indian Rupee']!;
        break;
      case 'US Dollar':
        resultValue = valueInEuro * conversionRates['US Dollar']!;
        break;
      case 'Japanese Yen':
        resultValue = valueInEuro * conversionRates['Japanese Yen']!;
        break;
      default:
        resultValue = 0.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Currency Converter",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w900, fontSize: 25),
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
                value: fromCurrency,
                onChanged: (String? newValue) {
                  setState(() {
                    fromCurrency = newValue!;
                    convertCurrency();
                  });
                },
                items: currencies.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
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
                    convertCurrency();
                  });
                },
                decoration: InputDecoration(
                  labelText: "$fromCurrency",
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
                  hintText: "Enter : $fromCurrency",
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
                value: toCurrency,
                onChanged: (String? newValue) {
                  setState(() {
                    toCurrency = newValue!;
                    convertCurrency();
                  });
                },
                items: currencies.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Result: $resultValue $toCurrency",
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
