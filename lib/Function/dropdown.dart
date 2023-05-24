// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:bitcoin_ticker/coin_data.dart';
// import 'dart:io' show Platform;

// class DropDown extends StatefulWidget {
//   _MyWidgetState widgetState = _MyWidgetState();
//   selectDropDown() {
//     if (Platform.isAndroid) {
//       return widgetState.androidDropDown();
//     } else if (Platform.isIOS) {
//       return widgetState.ISOCupertinoDropDown();
//     } else if (Platform.isWindows) {
//       widgetState.androidDropDown();
//     } else {
//       return widgetState;
//     }
//   }

//   @override
//   State<DropDown> createState() => _MyWidgetState();
// }

// class _MyWidgetState extends State<DropDown> {
//   String selectedCurrency = 'USD';
//   late double rate;
//   late String price;
//   late String coinName;

// // AndroidDropDown
//   DropdownButton<String> androidDropDown() {
//     List<DropdownMenuItem<String>> dropdown = [];
//     for (int i = 0; i < currenciesList.length; i++) {
//       String currency = currenciesList[i];
//       var newItem = DropdownMenuItem(
//         child: Text(currency),
//         value: currency,
//       );
//       dropdown.add(newItem);
//       print(newItem);
//     }
//     return DropdownButton<String>(
//       value: selectedCurrency,
//       items: dropdown,
//       onChanged: (value) {
//         setState(() {
//           selectedCurrency = value!;
//         });
//         coinName = value!;
//         print(coinName);
//       },
//     );
//   }

// // ISOCupertinoDropDown
//   CupertinoPicker ISOCupertinoDropDown() {
//     List<Widget> CupertinoWidget = [];

//     for (String currency in currenciesList) {
//       CupertinoWidget.add(Text(currency));
//     }

//     return CupertinoPicker(
//       backgroundColor: Colors.lightBlue,
//       itemExtent: 32.0,
//       onSelectedItemChanged: null,
//       children: CupertinoWidget,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold();
//   }
// }
