import 'package:uuid/uuid.dart';

const _uuid = Uuid();

class CityLocation {
  const CityLocation({
    required this.latitude,
    required this.longitude,
    required this.address,
  });

  final double latitude;
  final double longitude;
  final String address;
}

class City {
  City({
    required this.name,
    required this.location,
    String? id,
  }) : id = id ?? _uuid.v4();

  final String id;
  final String name;
  final CityLocation location;
}
