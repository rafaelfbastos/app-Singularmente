// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:hive/hive.dart';

part 'pills_model.g.dart';


@HiveType(typeId: 1)
class PillsModel {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String text;
  @HiveField(2)
  final int background;
  @HiveField(3)
  final bool isLottie;
  @HiveField(4)
  final DateTime createDate;

  PillsModel({
    required this.id,
    required this.text,
    required this.background,
    required this.isLottie,
    required this.createDate,
  });

  PillsModel copyWith({
    int? id,
    String? text,
    int? background,
    bool? isLottie,
    DateTime? createDate,
  }) {
    return PillsModel(
      id: id ?? this.id,
      text: text ?? this.text,
      background: background ?? this.background,
      isLottie: isLottie ?? this.isLottie,
      createDate: createDate ?? this.createDate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'text': text,
      'background': background,
      'isLottie': isLottie,
      'createDate': createDate.toIso8601String(),
    };
  }

  factory PillsModel.fromMap(Map<String, dynamic> map) {
    return PillsModel(
      id: map['id'] as int,
      text: map['text'] as String,
      background: map['background'] as int,
      isLottie: map['isLottie'] as bool,
      createDate: DateTime.parse(map['createDate'] as String),
    );
  }

  String toJson() => json.encode(toMap());

  factory PillsModel.fromJson(String source) =>
      PillsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PillsModel(id: $id, text: $text, background: $background, isLottie: $isLottie, createDate: $createDate)';
  }

  @override
  bool operator ==(covariant PillsModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.text == text &&
        other.background == background &&
        other.isLottie == isLottie &&
        other.createDate == createDate;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        text.hashCode ^
        background.hashCode ^
        isLottie.hashCode ^
        createDate.hashCode;
  }
}
