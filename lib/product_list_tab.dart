
import 'package:cupertino_store_flutter/app.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';


class ProductListTab extends StatelessWidget {
  const ProductListTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateModel>(
      builder: (context, value, child) {
        return const CustomScrollView(
          slivers: <Widget>[
            CupertinoSliverNavigationBar(
              largeTitle: Text("Cupertino Store"),
            )
          ],
        );
      },
    );
  }
}