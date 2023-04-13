import 'package:cupertino_store_flutter/model/app_state_model.dart';
import 'package:cupertino_store_flutter/model/product.dart';
import 'package:cupertino_store_flutter/product_row_item.dart';
import 'package:cupertino_store_flutter/search_bar.dart';
import 'package:cupertino_store_flutter/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  State<SearchTab> createState() {
    return _SearchTabState();
  }
}

class _SearchTabState extends State<SearchTab> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;
  String _terms = '';

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController()..addListener(_onTextChanged);
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    setState(() {
      _terms = _controller.text;
    });
  }

  Widget _buildSearchBox() {
    return Padding(
        padding: const EdgeInsets.all(8),
        child: SearchBar(
          controller: _controller,
          focusNode: _focusNode,
        ));
  }

  Widget _buildResultsBox(List<Product> results) {
    Widget view;
    if (results.isNotEmpty) {
      view = Expanded(
        child: SingleChildScrollView(
          child: CupertinoListSection(
            topMargin: 0,
            children: [
              for (var product in results)
                ProductRowItem(
                  product: product,
                )
            ],
          ),
        ),
      );
    } else {
      view = const Expanded(child: Text('No results'));
    }
    return view;
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<AppStateModel>(context);
    final results = model.search(_terms);

    return DecoratedBox(
      decoration: const BoxDecoration(
        color: Styles.scaffoldBackground,
      ),
      child: SafeArea(
        child: Column(
          children: [_buildSearchBox(), _buildResultsBox(results)],
        ),
      ),
    );
  }
}
