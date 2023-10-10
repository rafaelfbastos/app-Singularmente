// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:saudemental/app/models/pills_model.dart';
import 'package:saudemental/app/repositories/pills_repository.dart';
import 'package:saudemental/app/services/pills_service.dart';

class PillsServiceImpl implements PillsService {
  final PillsRepository _pillsRepository;

  PillsServiceImpl({
    required PillsRepository pillsRepository,
  }) : _pillsRepository = pillsRepository;

  @override
  Future<int> count() => _pillsRepository.count();

  @override
  Future<PillsModel> find(int id) => _pillsRepository.find(id);

  @override
  Future<List<PillsModel>> findAll()=> _pillsRepository.findAll();
}
