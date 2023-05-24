import 'package:bitcoin_ticker/coin_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'coin_data.dart';
import 'dart:io' show Platform;
import 'Function/cyrptoCard.dart';

// late String updatedCurrencyPrice;
String cryptoPrice = '';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';
  List<CoinInfo> lstCoins = [];

  DropdownButton<String> androidDropdown() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropdownItems.add(newItem);
    }

    return DropdownButton<String>(
      value: selectedCurrency,
      items: dropdownItems,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value!;
          // updatedCurrencyPrice = selectedCurrency;
          // for (String crypto in cryptoList) {
          // cryptoPrice = crypto;
          getUpdatedData();
          // }
        });
      },
    );
  }

  CupertinoPicker iOSPicker() {
    List<Text> pickerItems = [];
    for (String currency in currenciesList) {
      pickerItems.add(Text(currency));
    }

    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        print(selectedIndex);
      },
      children: pickerItems,
    );
  }

  // List<String> cryptoList() {
  //   List<String> listItems = [];
  //   for (String crypto in cryptoList) {
  //     var newItem = listItems.add(newItem);
  //   }

  //   return listItems;
  // }

  String bitcoinValue = '?';

  void getData() async {
    if (lstCoins.isEmpty) {
      for (String crypto in cryptoList) {
        lstCoins.add(CoinInfo(lable: crypto, value: 0.0));
      }
    } else {      
      try {
        lstCoins = await CoinData().getCoinData(selectedCurrency);
      } catch (e) {
        print(e);
      }
    }
  }

  void getUpdatedData() {
    getData();
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    print('In build..');
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            children: [
              for (CoinInfo info in lstCoins)
                CyrptoCard(
                    cyrpto: info.lable,
                    bitcoinValue: info.value.toStringAsFixed(2),
                    selectedCurrency: selectedCurrency),
            ],
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS ? iOSPicker() : androidDropdown(),
          ),
        ],
      ),
    );
  }
}
