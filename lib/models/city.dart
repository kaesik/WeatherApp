import 'package:uuid/uuid.dart';

const _uuid = Uuid();

class CityLocation {
  CityLocation({
    required this.latitude,
    required this.longitude,
  });

  final double latitude;
  final double longitude;
}

class City {
  City({
    required this.name,
    required this.country,
    required this.location,
    String? id,
  }) : id = id ?? _uuid.v4();

  final String id;
  final String name;
  final String country;
  final CityLocation location;
}
