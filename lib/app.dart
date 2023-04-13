import 'dart:ffi';

import 'package:cupertino_store_flutter/product_list_tab.dart';
import 'package:cupertino_store_flutter/search_tab.dart';
import 'package:cupertino_store_flutter/shopping_cart_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class CupertinoStoreApp extends StatelessWidget {
  const CupertinoStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    // This app is designed only to work vertically, so we limit
    // orientations to portrait up and down.
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return const CupertinoApp(
      theme: CupertinoThemeData(brightness: Brightness.light),
      home: CupertinoStoreHomePage(),
    );
  }
}

class Tab {
  final String label;
  final IconData icon;

  Tab(this.label, this.icon);
}

class CupertinoStoreHomePage extends StatelessWidget {
  const CupertinoStoreHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var tabs = [
      Tab('Products!', CupertinoIcons.home),
      Tab('Search', CupertinoIcons.search),
      Tab('Cart', CupertinoIcons.shopping_cart)
    ];

    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
            items: tabs
                .map((tab) => BottomNavigationBarItem(
                      icon: Icon(tab.icon),
                      label: tab.label,
                    ))
                .toList()),
        tabBuilder: (context, index) {
          late final CupertinoTabView returnValue;
          switch (index) {
            case 0:
              returnValue = createTabWith(const ProductListTab());
              break;
            case 1:
              returnValue = createTabWith(const SearchTab());
              break;
            case 2:
              returnValue = createTabWith(const ShoppingCartTab());
              break;
          }
          return returnValue;
        });
  }

  CupertinoTabView createTabWith(Widget widget) {
    return CupertinoTabView(builder: (context) {
      return CupertinoPageScaffold(
        child: widget,
      );
    });
  }
}
