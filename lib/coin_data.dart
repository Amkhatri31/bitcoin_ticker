import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:query_params/query_params.dart';

URLQueryParams queryParams=new URLQueryParams();

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


const apiKey = '4CC2EAEF-F312-47B3-9363-A56263E3A87C';
const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
var lastPrice;

class CoinData{

Future getCoinData(String selectedCountry) async{
  String requestURL='$coinAPIURL/BTC/$selectedCountry?apikey=$apiKey';
  http.Response response= await http.get(requestURL);

  if(response.statusCode==200){
var decodedData=jsonDecode(response.body);
    lastPrice=decodedData['rate'];
  return lastPrice;
  }
  else{
    print(response.statusCode);
    throw 'Problem with the get request';
  }
}

}