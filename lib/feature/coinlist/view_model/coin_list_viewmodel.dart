import 'dart:developer';

import 'package:bloc/bloc.dart';

import '../../../core/network_manager/i_coin_service_manager.dart';
import '../model/coin_model.dart';

class CoinListCubit extends Cubit<CoinListState> {
  CoinListCubit(this.coinServiceManager) : super(CoinListInitial()) {
    fetchCoinList();
  }

  ICoinServiceManager? coinServiceManager;
  List<CoinModel>? modelList = [];

  Future<void> fetchCoinList() async {
    emit(CoinLoadingState());
    final modelList = await coinServiceManager?.getCoinList();
    inspect(modelList);
    if (modelList == null && modelList?.length == 0) {
      emit(CoinListError());
    } else {
      emit(CoinListComplete(modelList));
    }
  }
}

class CoinListState {}

class CoinListInitial extends CoinListState {}

class CoinLoadingState extends CoinListState {}

class CoinListComplete extends CoinListState {
  final List<CoinModel>? items;

  CoinListComplete(this.items);
}

class CoinListError extends CoinListState {}
