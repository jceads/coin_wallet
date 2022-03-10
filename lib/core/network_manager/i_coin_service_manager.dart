import 'package:dio/dio.dart';

import '../../feature/coinlist/model/coin_model.dart';
import '../../feature/short_coin_list/model/short_coin_list.dart';

abstract class ICoinServiceManager {
  Dio dio;
  ICoinServiceManager({
    required this.dio,
  });
  Future<List<CoinModel>?> getCoinList();
  Future<List<ShortCoinModel>?> getShortCoinList();
  Future<List<ShortCoinModel>?> searchCoin(int? id);
}
