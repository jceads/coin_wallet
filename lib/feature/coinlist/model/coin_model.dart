class CoinModel {
  String? id;
  String? symbol;
  String? name;
  String? nameid;
  int? rank;
  String? priceUsd;
  String? percentChange24h;
  String? percentChange1h;
  String? percentChange7d;
  String? marketCapUsd;
  String? volume24;
  String? volume24Native;
  String? csupply;
  String? priceBtc;
  String? tsupply;
  String? msupply;

  CoinModel(
      {this.id,
      this.symbol,
      this.name,
      this.nameid,
      this.rank,
      this.priceUsd,
      this.percentChange24h,
      this.percentChange1h,
      this.percentChange7d,
      this.marketCapUsd,
      this.volume24,
      this.volume24Native,
      this.csupply,
      this.priceBtc,
      this.tsupply,
      this.msupply});

  CoinModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    symbol = json['symbol'];
    name = json['name'];
    nameid = json['nameid'];
    rank = json['rank'];
    priceUsd = json['price_usd'];
    percentChange24h = json['percent_change_24h'];
    percentChange1h = json['percent_change_1h'];
    percentChange7d = json['percent_change_7d'];
    marketCapUsd = json['market_cap_usd'];
    volume24 = json['volume24'];
    volume24Native = json['volume24_native'];
    csupply = json['csupply'];
    priceBtc = json['price_btc'];
    tsupply = json['tsupply'];
    msupply = json['msupply'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['symbol'] = symbol;
    data['name'] = name;
    data['nameid'] = nameid;
    data['rank'] = rank;
    data['price_usd'] = priceUsd;
    data['percent_change_24h'] = percentChange24h;
    data['percent_change_1h'] = percentChange1h;
    data['percent_change_7d'] = percentChange7d;
    data['market_cap_usd'] = marketCapUsd;
    data['volume24'] = volume24;
    data['volume24_native'] = volume24Native;
    data['csupply'] = csupply;
    data['price_btc'] = priceBtc;
    data['tsupply'] = tsupply;
    data['msupply'] = msupply;
    return data;
  }
}
