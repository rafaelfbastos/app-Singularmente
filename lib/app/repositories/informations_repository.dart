import 'package:saudemental/app/models/informations_model.dart';

abstract class InformationsRepository {

  Future<List<InformationsModel>> findAll();

}