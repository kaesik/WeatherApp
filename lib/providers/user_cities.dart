import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';
import 'package:weather_app/models/city.dart';

Future<Database> _getDatabase() async {
  final dbPath = await sql.getDatabasesPath();
  final db = await sql.openDatabase(
    path.join(dbPath, 'cities.db'),
    onCreate: (db, version) {
      return db.execute(
        '''
        CREATE TABLE user_cities(
        id TEXT PRIMARY KEY, 
        name TEXT, 
        latitude REAL, 
        longitude REAL, 
        address TEXT
        )
        ''',
      );
    },
    version: 1,
  );
  return db;
}

class UserCitiesNotifier extends StateNotifier<List<City>> {
  UserCitiesNotifier() : super(const []);

  loadCities() async {
    final db = await _getDatabase();
    final data = await db.query('user_cities');
    final cities = data
        .map(
          (row) => City(
            id: row['id'] as String,
            name: row['name'] as String,
            location: CityLocation(
              latitude: row['latitude'] as double,
              longitude: row['longitude'] as double,
              address: row['address'] as String,
            ),
          ),
        )
        .toList();
    state = cities;
  }

  void addCity(
    String name,
    CityLocation location,
  ) async {
    final newCity = City(
      name: name,
      location: location,
    );

    final db = await _getDatabase();
    db.insert(
      'user_cities',
      {
        'id': newCity.id,
        'name': newCity.name,
        'latitude': newCity.location.latitude,
        'longitude': newCity.location.longitude,
        'address': newCity.location.address,
      },
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );

    state = [...state, newCity];
  }
}

final userCitiesProvider =
    StateNotifierProvider<UserCitiesNotifier, List<City>>(
  (ref) => UserCitiesNotifier(),
);
