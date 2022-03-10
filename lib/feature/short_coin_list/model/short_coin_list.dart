class ShortCoinModel {
  String? name;
  String? base;
  String? quote;
  String? price;
  String? priceUsd;
  String? volume;
  String? volumeUsd;
  String? time;

  ShortCoinModel(
      {this.name,
      this.base,
      this.quote,
      this.price,
      this.priceUsd,
      this.volume,
      this.volumeUsd,
      this.time});

  ShortCoinModel.fromJson(Map<String, dynamic> json) {
    name = json['name'].toString();
    base = json['base'].toString();
    quote = json['quote'].toString();
    price = json['price'].toString();
    priceUsd = json['price_usd'].toString();
    volume = json['volume'].toString();
    volumeUsd = json['volume_usd'].toString();
    time = json['time'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = name;
    data['base'] = base;
    data['quote'] = quote;
    data['price'] = price;
    data['price_usd'] = priceUsd;
    data['volume'] = volume;
    data['volume_usd'] = volumeUsd;
    data['time'] = time;
    return data;
  }
}
