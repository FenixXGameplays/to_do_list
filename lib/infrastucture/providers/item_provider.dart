// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import '../model/item.dart';

class ItemProvider extends ChangeNotifier {
  List<Item> list = [];

  void addItem(Item item){
    if(!list.contains(item)){
      list.add(item);
    }
    notifyListeners();
  }

  void deleteItem(Item item){
    list.remove(item);
    notifyListeners();
  }

}
