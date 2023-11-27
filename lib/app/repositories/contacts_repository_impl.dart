import 'package:dio/dio.dart';
import 'package:saudemental/app/core/helpers/environments.dart';
import 'package:saudemental/app/models/contacts_model.dart';
import 'package:saudemental/app/repositories/contacts_repository.dart';

class ContactsRepositoryImpl implements ContactsRepository {
  late Dio _dio;

  ContactsRepositoryImpl() {
    _dio = Dio();
  }
  

  @override
  Future<List<ContactsModel>> findAll() async {
    final response =
        await _dio.get("${Environments.url}/api/contacts/");
    
    final datalist = response.data as List;

    return datalist.map((e) => ContactsModel.fromMap(e)).toList();
  }
}
