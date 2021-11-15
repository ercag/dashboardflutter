import 'dart:async';

import 'models/models.dart';

class MenuRepository {
  List<Menu>? _menu;

  Future<List<Menu>?> getMenuList(String userId) async {
    if (_menu == null) {
      _menu = [];
      _menu!.addAll({
        Menu("0", "Home Page"),
        Menu("1", "Second Page"),
      });
    }

    return Future.value(_menu);
  }
}
