import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bitcoin_ticker/price_screen.dart';
import 'coin_info.dart';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const String apikeyvalue = 'E5B03BE8-5D29-43A8-B63F-8C7E0E82BB0C';
const String coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';

class CoinData {
  Future<List<CoinInfo>> getCoinData(String updatedCurrencyCoin) async {
    List<CoinInfo> lstResults = [];
    for (String crypto in cryptoList) {
      var result = {crypto};
      String requestURL =
          '$coinAPIURL/$crypto/$updatedCurrencyCoin?apikey=$apikeyvalue';
      print('Url : ' + requestURL);
      http.Response response = await http.get(Uri.parse(requestURL));

      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        lstResults.add(CoinInfo(lable: crypto, value: decodedData['rate']));
      } else {
        print(response.statusCode);
        lstResults.add(CoinInfo(lable: 'No Data', value: 0.0));
        //throw 'Problem with the get request';
      }
    }

    return lstResults;
  }
}
