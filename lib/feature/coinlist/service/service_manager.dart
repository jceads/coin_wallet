import 'package:dio/dio.dart';

import '../../../core/network_manager/i_coin_service_manager.dart';
import '../../short_coin_list/model/short_coin_list.dart';
import '../model/coin_model.dart';

class CoinServiceManager extends ICoinServiceManager {
  CoinServiceManager(Dio dio) : super(dio: dio);

  @override
  Future<List<CoinModel>?> getCoinList() async {
    final response = await dio.get("ticker/?id=90");
    if (response.statusCode == 200) {
      final _tempList =
          (response.data as List).map((e) => CoinModel.fromJson(e)).toList();
      return _tempList;
    } else {
      return null;
    }
  }

  @override
  Future<List<ShortCoinModel>?> getShortCoinList() async {
    final response = await dio.get("coin/markets/?id=90");
    if (response.statusCode == 200) {
      final _temp = (response.data as List)
          .map((e) => ShortCoinModel.fromJson(e))
          .toList();
      return _temp;
    } else {
      throw Exception("error");
    }
  }

  Future<List<ShortCoinModel>?> searchCoin(int? id) async {
    final response = await dio.get("coin/markets/?id=$id");
    if (response.statusCode == 200) {
      final _temp = (response.data as List)
          .map((e) => ShortCoinModel.fromJson(e))
          .toList();
      return _temp;
    } else {
      throw Exception("error ");
    }
  }
}
//https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=20&page=1&sparkline=false