import 'dart:collection';

import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  final List<Item> _items = [];

  final int unitPrice = 50;

  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  void addItem(int id, Item item) {
    if (_items.contains(item)) {
      print('tang item ne');
      _items[id].quantity++;
    } else {
      print('Them item ne');
      _items.add(item);
    }
    notifyListeners();
  }

  void removeItem(int id, Item item) {
    if (_items.contains(item)) {
      if (_items[id].quantity > 1) {
        _items[id].quantity--;
      } else {
        _items.remove(item);
      }
    }
    notifyListeners();
  }

  void clearItem() {
    _items.clear();
    notifyListeners();
  }

  int quantity(int id) {
    return _items[id].quantity;
  }

  int get totalPrice {
    int total = 0;

    for (int i = 0; i < _items.length; i++) {
      total += _items[i].quantity * unitPrice;
    }
    return total;
  }
}

class Item {
  final int id;
  final String name;
  int quantity;

  Item(this.id, this.name, this.quantity);
}
