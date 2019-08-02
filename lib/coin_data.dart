import 'networking.dart';

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

const bitcoinAverageURL =
    'https://apiv2.bitcoinaverage.com/indices/global/ticker';

class CoinData {
  Future<dynamic> getBitcoinCourse(String currency) async {
    Map<String, String> cryptoPrices = {};

    for (String crypto in cryptoList) {
      NetworkHelper networkHelper =
          NetworkHelper('$bitcoinAverageURL/$crypto$currency');

      var cryptoCourse = await networkHelper.getData();
      double lastPrice = cryptoCourse['last'];
      cryptoPrices[crypto] = lastPrice.toStringAsFixed(0);
    }

    return cryptoPrices;
  }
}
