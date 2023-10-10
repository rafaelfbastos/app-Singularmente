import 'package:saudemental/app/models/pills_model.dart';

abstract class PillsRepository {

  Future<List<PillsModel>> findAll();
  Future<PillsModel> find(int id);
  Future<int> count();

}