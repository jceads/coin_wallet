import '../../../core/network_manager/i_coin_service_manager.dart';
import '../../coinlist/model/coin_model.dart';
import '../../coinlist/service/service_manager.dart';
import '../model/short_coin_list.dart';
import '../view/short_coin_view.dart';
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
  Future<List<ShortCoinModel>?> searchCoin(int? id) {
    // TODO: implement searchCoin
    throw UnimplementedError();
  }
}
