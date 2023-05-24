// import 'package:bitcoin_ticker/coin_data.dart';

// const String apikeyvalue = '109A3F7F-B7C5-43AF-824A-3218C51E407F';
// const String url = 'https://rest.coinapi.io/v1/exchangerate';

// class CoinDataRate {
//   Future<dynamic> getCustumCoinData(String cityName) async {
//     CoinData apiget =
//         CoinData('$url?q=$cityName&appid=$apikeyvalue&units=metric');

//     var coinData = await apiget.getData();
//     return coinData;
//   }

//   Future<dynamic> startPageCoinData() async {
//     CoinData apiget = CoinData('$url/BTC/USD?apikey=$apikeyvalue');

//     var coinData = await apiget.getData();
//     print(coinData);
//     return coinData;
//   }
// }
