import 'package:cupertino_store_flutter/app.dart';
import 'package:cupertino_store_flutter/model/app_state_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';


class ShoppingCartTab extends StatefulWidget {
  const ShoppingCartTab({super.key});

  @override
  State<ShoppingCartTab> createState() {
    return _ShoppingCartTabState();
  }
}

class _ShoppingCartTabState extends State<ShoppingCartTab> {

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateModel>(builder: (context, value, child) {
      return const CustomScrollView(
        slivers: <Widget>[
          CupertinoSliverNavigationBar(
            largeTitle: Text('Shopping cart'),
          )
        ],
      );
    },
    );
  }
}