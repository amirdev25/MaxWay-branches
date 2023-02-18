import 'package:flutter/material.dart';
import 'package:maxway_branches/data/api.dart';
import 'package:maxway_branches/data/di.dart';

import '../data/data_model.dart';

class MainProvider extends ChangeNotifier {
  List<Branch>? branchList;

  Future getBranches() async {
    final api = di.get<Api>();
    var data = await api.getAllBranches();
    branchList = data.pageProps.branches.branches;
    notifyListeners();
  }
}
