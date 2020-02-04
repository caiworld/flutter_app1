import 'dart:collection';

import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  /// 用于保存购物车中商品列表
  final List<Item> _items = [];

  /// 禁止改变购物车里面的商品信息
  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  /// 购物车中商品的总价
  double get totalPrice =>
      _items.fold(0, (value, item) => value + item.count * item.price);

  /// 将[item]添加到购物车，这是唯一一种能从外部改变购物车的方法
  void add(Item item) {
    _items.add(item);
    // 通知监听器，重新构建Widget，更新状态
    notifyListeners();
  }
}

class Item {
  /// 商品价格
  double price;

  /// 商品个数
  int count;

  Item(this.price, this.count);
}
