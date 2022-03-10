import 'dart:developer';

import 'package:coin_wallet/feature/coinlist/view/coin_list_view.dart';
import 'package:coin_wallet/feature/search_coin/view/search_coin_view.dart';
import 'package:flutter/material.dart';

import '../short_coin_list/view/short_coin_view.dart';

class BottomNavBarView extends StatefulWidget {
  const BottomNavBarView({Key? key}) : super(key: key);

  @override
  State<BottomNavBarView> createState() => _BottomNavBarViewState();
}

class _BottomNavBarViewState extends State<BottomNavBarView> {
  int _selectedIndex = 2;

  final _listOfView = <Widget>[
    CoinList(),
    SearchCoinView(),
    ShortCoinList(),
  ];
  void _onTap(int index) {
    _selectedIndex = index;
    setState(() {
      log(_selectedIndex.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _listOfView.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Shorts"),
        ],
        currentIndex: _selectedIndex,
        onTap: _onTap,
      ),
    );
  }
}
