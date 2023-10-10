import 'package:saudemental/app/models/informations_model.dart';
import 'package:saudemental/app/repositories/informations_repository.dart';
import 'package:saudemental/app/services/informations_service.dart';

class InformationsServiceImpl implements InformationsService {
  final InformationsRepository _repository;

  InformationsServiceImpl({
    required InformationsRepository repository,
  }) : _repository = repository;

  @override
  Future<List<InformationsModel>> findAll() => _repository.findAll();
}
