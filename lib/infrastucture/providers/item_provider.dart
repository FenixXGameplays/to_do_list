// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:to_do_list/config/helper/sql_helper.dart';

import '../model/item.dart';

class ItemProvider extends ChangeNotifier {
  List<Item> list = [];

  void addItem(Item item){
    SqlHelper.insertItem(item);
    addAll();
  }

  void deleteItem(Item item){
    SqlHelper.removeItem(item);
    addAll();
  }

  void addAll() async{
    list = await SqlHelper.getProducts();
    notifyListeners();
  }

}
