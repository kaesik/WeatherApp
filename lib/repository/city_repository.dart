import 'package:sqflite/sqlite_api.dart';
import 'package:weather_app/models/city.dart';

class CityRepository {
  Future<List<City>> getCities({
    required Database database,
  }) async {
    final data = await database.rawQuery('SELECT * FROM cities');
    List<City> todos = [];
    for (var item in data) {
      todos.add(
        City(
          id: item['id'] as String,
          name: item['name'] as String,
          country: item['country'] as String,
          location: CityLocation(
            latitude: item['latitude'] as double,
            longitude: item['longitude'] as double,
          ),
        ),
      );
    }
    return todos;
  }

  Future<dynamic> addCity({
    required Database database,
    required String name,
    required String country,
    required double latitude,
    required double longitude,
  }) async {
    return await database.transaction((txn) async {
      await txn.rawInsert('''INSERT INTO cities
      (name) VALUES ('$name')
      (country) VALUES ('$country')
      (latitude) VALUES ('$latitude')
      (longitude) VALUES ('$longitude')
      ''');
    });
  }

  Future<dynamic> removeCity({
    required Database database,
    required int id,
  }) async {
    return await database.transaction((txn) async {
      await txn.rawDelete('DELETE FROM cities where id = $id');
    });
  }
}
