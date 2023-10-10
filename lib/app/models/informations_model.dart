// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class InformationsModel {
  final int id;
  final String text;
  final String title;
  final String? img;
  final String? themeColor;
  final DateTime createDate;
  
  
  InformationsModel({
    required this.id,
    required this.text,
    required this.title,
    this.img,
    this.themeColor,
    required this.createDate,
  });

  


  InformationsModel copyWith({
    int? id,
    String? text,
    String? title,
    String? img,
    String? themeColor,
    DateTime? createDate,
  }) {
    return InformationsModel(
      id: id ?? this.id,
      text: text ?? this.text,
      title: title ?? this.title,
      img: img ?? this.img,
      themeColor: themeColor ?? this.themeColor,
      createDate: createDate ?? this.createDate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'text': text,
      'title': title,
      'img': img,
      'themeColor': themeColor,
      'createDate': createDate.toIso8601String(),
    };
  }

  factory InformationsModel.fromMap(Map<String, dynamic> map) {
    return InformationsModel(
      id: map['id'] as int,
      text: map['text'] as String,
      title: map['title'] as String,
      img: map['img'] != null ? map['img'] as String : null,
      themeColor: map['themeColor'] != null ? map['themeColor'] as String : null,
      createDate: DateTime.parse(map['createDate'] as String),
    );
  }

  String toJson() => json.encode(toMap());

  factory InformationsModel.fromJson(String source) => InformationsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'InformationsModel(id: $id, text: $text, title: $title, img: $img, themeColor: $themeColor, createDate: $createDate)';
  }

  @override
  bool operator ==(covariant InformationsModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.text == text &&
      other.title == title &&
      other.img == img &&
      other.themeColor == themeColor &&
      other.createDate == createDate;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      text.hashCode ^
      title.hashCode ^
      img.hashCode ^
      themeColor.hashCode ^
      createDate.hashCode;
  }
}
