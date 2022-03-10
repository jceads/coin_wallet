import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/network_manager/coin_network_manager.dart';
import '../service/service_manager.dart';
import '../view_model/coin_list_viewmodel.dart';

class CoinList extends StatelessWidget {
  const CoinList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var img_url = "https://s2.coinmarketcap.com/static/img/coins/200x200/1.png";
    return BlocProvider(
      create: (context) =>
          CoinListCubit(CoinServiceManager(CoinNetworkService.instance.dio)),
      child: Scaffold(
        appBar: AppBar(),
        body: BlocConsumer<CoinListCubit, CoinListState>(
          builder: (context, state) {
            if (state is CoinListComplete) {
              return CoinListViewBuild(state, img_url);
            } else if (state is CoinListInitial) {
              return ProgressBarCentered();
            } else if (state is CoinListError) {
              return ErrorStateWidget();
            } else {
              return ProgressBarCentered();
            }
          },
          listener: (context, state) {
            if (state is CoinListError) {
              showModalBottomSheet(
                  context: context, builder: (context) => const Text("Error"));
            }
          },
        ),
      ),
    );
  }

  Widget CoinListViewBuild(CoinListComplete state, String url) {
    return ListView.builder(
        itemCount: state.items?.length,
        itemBuilder: (context, index) => Card(
              child: ListTile(
                title: Text(
                    "${state.items?[index].name}, ${state.items?[index].nameid}"),
                subtitle: Text(
                    "Price: ${state.items?[index].priceUsd.toString()} \$"),
                trailing:
                    Text("Volume: ${state.items?[index].volume24.toString()}"),
                leading: CircleAvatar(
                  child: Image.network(url),
                ),
              ),
            ));
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
