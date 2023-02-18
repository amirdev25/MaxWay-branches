import 'package:dio/dio.dart';
import 'package:maxway_branches/data/data_model.dart';

class Api {
  final Dio dio;

  Api(this.dio);

  Future<BranchModel> getAllBranches() async {
    var response = await dio.get("ch7KmKvJ5azfPmlISTmjb/uz/branches.json");
    return BranchModel.fromJson(response.data);
  }
}
