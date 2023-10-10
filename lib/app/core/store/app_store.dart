import 'dart:math';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:saudemental/app/models/informations_model.dart';
import 'package:saudemental/app/models/pills_model.dart';
import 'package:saudemental/app/services/informations_service.dart';
import 'package:saudemental/app/services/pills_service.dart';

class AppStore {
  final PillsService _pillsService;
  final InformationsService _informationsService;

  late Random _random;
  late Box<PillsModel> boxPills;
  late Box boxSettings;

  AppStore(
      {required PillsService pillsService,
      required InformationsService informationsService})
      : _pillsService = pillsService,
        _informationsService = informationsService {
    _random = Random();
    boxPills = Hive.box('pills');
    boxSettings = Hive.box('settings');
  }

  PillsModel? pill;
  List<InformationsModel> informations = [];

  Future<void> carregar() async {
    await Future.wait([
      _carregarPill(),
      _carregarInformations(),
    ]);
  }

  Future<void> _carregarInformations() async {
    var list = await _informationsService.findAll();
    list.sort(((a, b) => b.createDate.compareTo(a.createDate)));
    informations.addAll(list);
  }

  Future<void> _carregarPill() async {
    var now = DateTime.now();
    final date = DateTime(now.year, now.month, now.day);

    List<int> ids = boxSettings.get('ids') ?? [];
    var pillTemp = boxPills.get(date.toIso8601String());

    if (pillTemp == null) {
      var range = await _pillsService.count();

      _resetList(ids, range);

      var id = _random.nextInt(range) + 1;

      while (ids.contains(id)) {
        id = _random.nextInt(range) + 1;
      }

      ids.add(id);

      pillTemp = await _pillsService.find(id);

      boxPills.put(date.toIso8601String(), pillTemp);
      boxSettings.put("ids", ids);
    } else {
      var compare = await _pillsService.find(pillTemp.id);
      pillTemp = compare;
      boxPills.put(date.toIso8601String(), pillTemp);
    }
    pill = pillTemp;
  }

  _resetList(List<int> list, int n) {
    if (list.length == n) list.clear();
  }
}
