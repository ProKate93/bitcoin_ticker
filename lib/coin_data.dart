import 'dart:convert';
import 'package:http/http.dart' as http;

const apiKey1 = 'B9CD723E-9114-4ED3-8425-45C53E3DEFA7';
const apiKey2 = '0705488B-5F10-4B3D-B228-4E6B45ED5034';
const coinApiUrl = 'https://rest.coinapi.io/v1/exchangerate';

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

class CoinData {
  Future getCoinRate(String currency) async {
    Map<String, String> cryptoRates = {};
    for (String crypto in cryptoList) {
      var url = Uri.parse('$coinApiUrl/$crypto/$currency?apikey=$apiKey2');
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var coinData = jsonDecode(response.body);
        double rate = coinData['rate'];
        cryptoRates[crypto] = rate.toStringAsFixed(0);
      } else {
        print(response.statusCode);
        throw 'Problem with the get request';
      }
    }
    return cryptoRates;
  }
}
