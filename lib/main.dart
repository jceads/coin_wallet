import 'package:coin_wallet/feature/search_coin/view/search_coin_view.dart';

import 'feature/coinlist/view/coin_list_view.dart';
import 'package:flutter/material.dart';

import 'feature/short_coin_list/view/short_coin_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      title: 'Material App',
      home: SearchCoinView(),
    );
  }
}
