import 'package:coin_wallet/feature/coinlist/model/coin_model.dart';
import 'package:coin_wallet/feature/coinlist/service/service_manager.dart';
import 'package:coin_wallet/feature/short_coin_list/model/short_coin_list.dart';
import 'package:coin_wallet/feature/short_coin_list/view/short_coin_view.dart';
import 'package:dio/src/dio.dart';

class ShortCoinListService extends ICoinServiceManager {
  ShortCoinListService({required Dio dio}) : super(dio: dio);

  @override
  Future<List<CoinModel>?> getCoinList() {
    // TODO: implement getCoinList
    throw UnimplementedError();
  }

  @override
  Future<List<ShortCoinModel>?> getShortCoinList() async {
    final response = await dio.get("coin/markets/?id=90");
    if (response.statusCode == 200) {
      final _temp = response.data;
      return (_temp as List).map((e) => ShortCoinModel.fromJson(e)).toList();
    }
  }

  @override
  Future<List<ShortCoinModel>?> searchCoin(String id) {
    // TODO: implement searchCoin
    throw UnimplementedError();
  }
}
