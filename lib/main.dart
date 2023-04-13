import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'app.dart';

void main() {
  return runApp(
    ChangeNotifierProvider<AppStateModel>(
      create: (_) {
        return AppStateModel();
      },
      child: const CupertinoStoreApp(),
    ),
  );
}
