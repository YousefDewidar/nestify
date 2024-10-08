import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nestify/core/utils/constant.dart';
import 'package:nestify/features/home/data/model/house_model.dart';
import 'package:nestify/features/home/data/repo/home_repo.dart';
import 'package:nestify/features/home/presentation/view%20model/home%20cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitial());
  HomeRepo homeRepo;
  List<HouseModel> allhousesList = [];
  List<HouseModel> filterdHousesList = [];
  List<Map<String, dynamic>> favListAfterSearch = [];
  List<Map<String, dynamic>> favList = [];

  Future<List<HouseModel>> getHousesData() async {
    emit(HomeInitial());
    allhousesList = await homeRepo.getAllHouses();
    if (filterdHousesList.isEmpty) {
      emit(FilterdDone());
      return allhousesList;
    } else {
      emit(FilterdDone());
      return filterdHousesList;
    }
  }

  void setFilterdHouses(
      {String? loca,
      String? price,
      String? type,
      String? bed,
      String? category}) async {
    filterdHousesList = await homeRepo.getFilterdHouses(
        bed: bed, price: price, loca: loca, type: type, category: category);
    emit(FilterdLoading());
  }

  Future<List<Map<String, dynamic>>> getFavHouses() async {
    favList = await homeRepo.getFavHouses();
    emit(SearchDone());
    if (favListAfterSearch.isEmpty || favListAfterSearch == []) {
      return favList;
    } else {
      return favListAfterSearch;
    }
  }

  void setToFavourite(String houseTitle) {
    FirebaseFirestore.instance
        .collection(kPropertiesCol)
        .doc(houseTitle)
        .update({'isFav': true});
    emit(FavouriteDoneState());
  }

  void removeFromFavourite(String houseTitle) {
    FirebaseFirestore.instance
        .collection(kPropertiesCol)
        .doc(houseTitle)
        .update({'isFav': false});
    emit(FavouriteDoneState());
  }

  void setSearchedList(String houseTitleChar) {
    if (houseTitleChar.isEmpty) {
      favListAfterSearch = [];
    } else {
      favListAfterSearch = favList.where((house) {
        return HouseModel.fromJson(house)
            .title
            .toLowerCase()
            .startsWith(houseTitleChar);
      }).toList();
    }
  }
}
