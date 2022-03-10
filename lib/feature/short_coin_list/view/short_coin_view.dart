import 'package:coin_wallet/core/network_manager/coin_network_manager.dart';
import 'package:coin_wallet/feature/coinlist/service/service_manager.dart';
import 'package:coin_wallet/feature/coinlist/view_model/coin_list_viewmodel.dart';
import 'package:coin_wallet/feature/short_coin_list/service/short_coin_list_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../search_coin/view/search_coin_view.dart';
import '../view_model/short_voin_viewmodel.dart';

class ShortCoinList extends StatelessWidget {
  ShortCoinList({Key? key}) : super(key: key);
  String img_url =
      "https://s2.coinmarketcap.com/static/img/coins/200x200/1.png";
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShortCoinListCubit(
          ShortCoinListService(dio: CoinNetworkService.instance.dio)),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Bitcoin wallet s2ş"),
        ),
        body: BlocProvider(
          create: (context) => ShortCoinListCubit(
              CoinServiceManager(CoinNetworkService.instance.dio)),
          child: BlocConsumer<ShortCoinListCubit, ShortCoinListState>(
            builder: (context, state) {
              if (state is ShortCoinListComplete) {
                return CoinListViewBuild(state, img_url);
              } else if (state is ShortCoinListInitial) {
                return ProgressBarCentered();
              } else if (state is ShortCoinListError) {
                return ErrorStateWidget();
              } else {
                return ProgressBarCentered();
              }
            },
            listener: (context, state) {
              if (state is CoinListError) {
                showModalBottomSheet(
                    context: context,
                    builder: (context) => const Text("Error"));
              }
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => SearchCoinView(),
            ));
          },
        ),
      ),
    );
  }

  Widget CoinListViewBuild(ShortCoinListComplete state, String url) {
    return ListView.builder(
      itemCount: state.items?.length,
      itemBuilder: (context, index) => Card(
        child: ListTile(
          title: Text(
              "${state.items?[index].name} / ${state.items?[index].quote}"),
          subtitle: Text("Price: ${state.items?[index].priceUsd.toString()}\$"),
          trailing: Text("Volume: ${state.items?[index].volume.toString()}"),
          leading: CircleAvatar(
            child: Image.network(url),
          ),
        ),
      ),
    );
  }

  Widget ErrorStateWidget() {
    return const Center(
      child: SizedBox(
        width: 400,
        height: 300,
        child: Card(
          child: Text("Error State"),
        ),
      ),
    );
  }

  Widget ProgressBarCentered() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
