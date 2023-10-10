// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ContactsModel {
  final int id;
  final String name;
  final String address;
  final String description;
  final double latitude;
  final double longitude;
  final List<Number> numbers;
  final double? distance;

  ContactsModel(
      {required this.id,
      required this.name,
      required this.address,
      required this.description,
      required this.latitude,
      required this.longitude,
      required this.numbers,
      this.distance});

  ContactsModel copyWith(
      {int? id,
      String? address,
      String? name,
      String? description,
      List<Number>? numbers,
      double? latitude,
      double? longitude,
      double? distance}) {
    return ContactsModel(
        id: id ?? this.id,
        name: name ?? this.name,
        address: address ?? this.address,
        description: description ?? this.description,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        distance: distance ?? this.distance,
        numbers: numbers ?? this.numbers);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'address': address,
      'description': description,
      'latitude': latitude,
      'longitude': longitude,
      'numbers': numbers.map((x) => x.toMap()).toList(),
      'distance': distance,
    };
  }

  factory ContactsModel.fromMap(Map<String, dynamic> map) {
    return ContactsModel(
      name: map['name'] as String,
      id: map['id'] as int,
      address: map['address'] as String,
      description: map['description'] as String,
      latitude: map['latitude'] as double,
      longitude: map['longitude'] as double,
      numbers: (map['numbers'] as List).map((e) => Number.fromMap(e)).toList(),
      distance: map['distance'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ContactsModel.fromJson(String source) =>
      ContactsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ContacsModel(id: $id, address: $address, description: $description, latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(covariant ContactsModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.address == address &&
        other.description == description &&
        other.latitude == latitude &&
        other.longitude == longitude;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        address.hashCode ^
        description.hashCode ^
        latitude.hashCode ^
        longitude.hashCode;
  }
}

class Number {
  String number;
  Number({
    required this.number,
  });

  Number copyWith({
    String? number,
  }) {
    return Number(
      number: number ?? this.number,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'number': number,
    };
  }

  factory Number.fromMap(Map<String, dynamic> map) {
    return Number(
      number: map['number'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Number.fromJson(String source) =>
      Number.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Number(number: $number)';

  @override
  bool operator ==(covariant Number other) {
    if (identical(this, other)) return true;

    return other.number == number;
  }

  @override
  int get hashCode => number.hashCode;
}
