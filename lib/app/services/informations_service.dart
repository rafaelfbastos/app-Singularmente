import 'package:saudemental/app/models/informations_model.dart';

abstract class InformationsService {

  Future<List<InformationsModel>> findAll();
}