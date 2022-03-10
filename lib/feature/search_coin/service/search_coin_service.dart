import '../../../core/network_manager/i_coin_service_manager.dart';
import '../../coinlist/model/coin_model.dart';
import '../../short_coin_list/model/short_coin_list.dart';
import 'package:dio/dio.dart';
import 'package:dio/src/dio.dart';

class SearchCoinService extends ICoinServiceManager {
  SearchCoinService({required Dio dio}) : super(dio: dio);

  @override
  Future<List<CoinModel>?> getCoinList() {
    // TODO: implement getCoinList
    throw UnimplementedError();
  }

  @override
  Future<List<ShortCoinModel>?> getShortCoinList() {
    // TODO: implement getShortCoinList
    throw UnimplementedError();
  }

  Future<List<ShortCoinModel>?> searchCoin(int? id) async {
    if (id == null) {
      return null;
    }
    final response = await dio.get("?id=$id");
    if (response.statusCode == 200) {
      final _temp = response.data;
      return (_temp as List).map((e) => ShortCoinModel.fromJson(e)).toList();
    }
  }
}
