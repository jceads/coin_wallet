import 'package:coin_wallet/feature/search_coin/view_model/search_coin_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCoinView extends StatelessWidget {
  const SearchCoinView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: "Search..."),
          ),
        ),
        body: BlocProvider(
          create: (context) => SearchCoinCubit(),
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: ListTile(title: Text("asd")),
              );
            },
          ),
        ),
      ),
    );
  }
}
