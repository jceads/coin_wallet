import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/network_manager/i_coin_service_manager.dart';
import '../../short_coin_list/model/short_coin_list.dart';

class SearchCoinCubit extends Cubit<SearchCoinState> {
  SearchCoinCubit(this.searchController, this.manager, this.searchText)
      : super(SearchCoinInitial());

  ICoinServiceManager? manager;
  List<ShortCoinModel>? searchedCoinList;
  String? searchText;

  final TextEditingController searchController;

  void searchCoin(String? id) async {
    emit(LoadingState());
    if (id != null) {
      final _coins = await manager?.searchCoin(int.parse(id));
      if (_coins?.length == 0) {
        emit(SearchNotFoundCoin());
      } else {
        searchedCoinList = _coins;
        emit(SearchCoinCompleted(searchedCoinList));
      }
    }
  }
}

class SearchCoinState {}

class SearchCoinInitial extends SearchCoinState {}

class SearchCoinCompleted extends SearchCoinState {
  final List<ShortCoinModel>? list;

  SearchCoinCompleted(this.list);
}

class SearchNotFoundCoin extends SearchCoinState {}

class SearchingCoinState extends SearchCoinState {
  Future<VoidCallback>? function;
  SearchingCoinState({
    this.function,
  });
}

class LoadingState extends SearchCoinState {}
