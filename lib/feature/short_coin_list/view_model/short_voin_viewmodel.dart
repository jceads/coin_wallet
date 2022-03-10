import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:coin_wallet/feature/coinlist/service/service_manager.dart';
import 'package:coin_wallet/feature/short_coin_list/model/short_coin_list.dart';

class ShortCoinListCubit extends Cubit<ShortCoinListState> {
  ShortCoinListCubit(this.coinServiceManager) : super(ShortCoinListInitial()) {
    fetchCoinList();
  }

  ICoinServiceManager? coinServiceManager;
  List<ShortCoinModel>? shortCoinList = [];

  Future<void> fetchCoinList() async {
    emit(ShortCoinLoadingState());
    final _temp = await coinServiceManager?.getShortCoinList();
    if (_temp != null) {
      shortCoinList = _temp;
      emit(ShortCoinListComplete(shortCoinList));
    } else {
      emit(ShortCoinListError());
    }
  }
}

class ShortCoinListState {}

class ShortCoinListInitial extends ShortCoinListState {}

class ShortCoinLoadingState extends ShortCoinListState {}

class ShortCoinListComplete extends ShortCoinListState {
  final List<ShortCoinModel>? items;

  ShortCoinListComplete(this.items);
}

class ShortCoinListError extends ShortCoinListState {}
