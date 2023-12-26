import 'package:flutter/material.dart';

import '../Models/product_model.dart';

class HomeProvider extends ChangeNotifier {

  List<ProductModel> favoriteList = [];
  List<ProductModel> cartList = [];
  double _myTotal = 0;
  double get myTotal=>_myTotal;

  void getMyTotal(double yourValue){
    _myTotal += yourValue;
    notifyListeners();
  }

  void addToFavoriteList(ProductModel item) {
    if (!favoriteList.contains(item)) {
      favoriteList.add(item);
      notifyListeners();
    } else {
      favoriteList.remove(item);
      notifyListeners();
    }
  }

  void addToCartList(ProductModel item) {
    if (!cartList.contains(item)) {
      cartList.add(item);
      notifyListeners();
    } else {
      cartList.remove(item);
      notifyListeners();
    }
  }

  void removeAll(){
    cartList.clear();
    notifyListeners();
  }
  void removeByItem(ProductModel item){
    cartList.remove(item);
    notifyListeners();
  }
}
