import 'package:dio/dio.dart';

class CoinNetworkService {
  static CoinNetworkService? _instace;
  static CoinNetworkService get instance {
    if (_instace == null) _instace = CoinNetworkService._init();
    return _instace!;
  }

  late final Dio dio;

  final String _baseUrl = "https://api.coinlore.net/api/";

  CoinNetworkService._init() {
    dio = Dio(BaseOptions(baseUrl: _baseUrl));
  }
}


//global