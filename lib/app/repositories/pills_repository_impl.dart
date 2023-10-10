import 'package:saudemental/app/models/pills_model.dart';
import 'package:saudemental/app/repositories/pills_repository.dart';
import 'package:dio/dio.dart';

class PillsRepositoryImpl implements PillsRepository {
  late Dio _dio;

  PillsRepositoryImpl() {
    _dio = Dio();
  }

  @override
  Future<PillsModel> find(int id) async {
    final response =
        await _dio.get("http://saudementalapi.ddns.net:1337/api/pills/$id");
    final data = response.data as Map<String, dynamic>;

    return PillsModel.fromMap(data);
  }

  @override
  Future<List<PillsModel>> findAll() async {
    final response =
        await _dio.get("http://saudementalapi.ddns.net:1337/api/pills/");
    final data = response.data as Map<String, dynamic>;
    final datalist = data["pills"] as List;

    return datalist.map((e) => PillsModel.fromMap(e)).toList();
  }

  @override
  Future<int> count() async {
    final response =
        await _dio.get("http://saudementalapi.ddns.net:1337/api/pills/");
    final data = response.data as Map<String, dynamic>;
    return data["count"] as int;
  }
}
