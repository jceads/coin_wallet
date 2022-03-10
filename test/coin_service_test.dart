import 'package:flutter_test/flutter_test.dart';

void main(List<String> args) {
  // final service = CoinNetworkService.instance.networkManager;
  setUp(() async {
    await prints("matcher");
    // String url = "https://api.coingecko.com/api/v3/coins/";
    // Future<List<CoinModel>?> getdata() async {
    //   final response = service.send<CoinModel, List<CoinModel>>("",
    //       parseModel: CoinModel(), method: RequestType.GET);
    //   // return response;
    // }
  });

  // test('Fetching data', () async {
  //   final response = await service.send<CoinModel, List<CoinModel>>(
  //       "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&ids=fantom",
  //       parseModel: CoinModel(),
  //       method: RequestType.GET);

  //   expect(response, isNotNull);
  // });
}
