import 'package:coin_wallet/feature/coinlist/service/service_manager.dart';
import 'package:coin_wallet/feature/short_coin_list/model/short_coin_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCoinCubit extends Cubit<SearchCoinState> {
  SearchCoinCubit() : super(SearchCoinInitial());

  ICoinServiceManager? manager;
  List<ShortCoinModel>? searchedCoinList;

  void searchCoin(String id) {
    emit(SearchNotFoundCoin());
    final _coins = manager?.searchCoin(id);
    if (_coins == null) {
      emit(SearchNotFoundCoin());
    } else {
      searchedCoinList = _coins as List<ShortCoinModel>?;
      emit(SearchCoinCompleted(searchedCoinList));
    }
  }
}

class SearchCoinInitial extends SearchCoinState {}

class SearchCoinState {}

class SearchCoinCompleted extends SearchCoinState {
  final List<ShortCoinModel>? list;

  SearchCoinCompleted(this.list);
}

class SearchNotFoundCoin extends SearchCoinState {}
