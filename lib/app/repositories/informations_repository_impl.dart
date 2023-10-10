import 'package:dio/dio.dart';
import 'package:saudemental/app/models/informations_model.dart';
import 'package:saudemental/app/repositories/informations_repository.dart';

class InformationsRepositoryImpl implements InformationsRepository {
  late Dio _dio;

  InformationsRepositoryImpl() {
    _dio = Dio();
  }

  @override
  Future<List<InformationsModel>> findAll() async {
    final response =
        await _dio.get("http://saudementalapi.ddns.net:1337/api/informations/");

    final datalist = response.data as List;

    return datalist.map((e) => InformationsModel.fromMap(e)).toList();
  }
}
