import 'package:coin_wallet/core/network_manager/coin_network_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../coinlist/service/service_manager.dart';
import '../view_model/search_coin_view_model.dart';

class SearchCoinView extends StatelessWidget {
  SearchCoinView({Key? key}) : super(key: key);

  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCoinCubit(
          searchController,
          CoinServiceManager(CoinNetworkService.instance.dio),
          searchController.text),
      child: Scaffold(
        appBar: AppBar(
          title: BlocBuilder<SearchCoinCubit, SearchCoinState>(
            builder: (context, state) {
              return TextField(
                controller: searchController,
                onChanged: (value) => context
                    .read<SearchCoinCubit>()
                    .searchCoin(searchController.text),
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "Search..."),
              );
            },
          ),
        ),
        body: BlocConsumer<SearchCoinCubit, SearchCoinState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is SearchNotFoundCoin) {
              return Center(child: Text("No coin found"));
            } else if (state is SearchCoinCompleted) {
              return ListView.builder(
                itemCount: state.list?.length,
                itemBuilder: (context, index) {
                  if (state.list?[index].name == "null" ||
                      state.list?[index].name == "Unnamed") {
                    return Container();
                  } else {
                    return Card(
                      child: ListTile(
                        title: Text("${state.list?[index].name}"),
                        trailing: Text("${state.list?[index].priceUsd} \$"),
                      ),
                    );
                  }
                },
              );
            } else if (state is LoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Center(
                child: Text(" "),
              );
            }
          },
        ),
      ),
    );
  }
}
