import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

part 'database_state.dart';

class DatabaseCubit extends Cubit<DatabaseState> {
  DatabaseCubit() : super(InitDatabaseState());

  Database? _database;

  Database? get database => _database;

  // Initialize the SQLite database
  Future<void> initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'cities.db');

    // Check if the directory exists, create if not
    if (await Directory(dirname(path)).exists()) {
      _database = await openDatabase(path, version: 1,
          onCreate: (Database db, int version) async {
        // When creating the db, create the 'cities' table
        await db.execute('''
          CREATE TABLE cities (
            id INTEGER PRIMARY KEY, 
            name TEXT, 
            country TEXT, 
            latitude REAL, 
            longitude REAL
          )''');
      });

      emit(LoadDatabaseState());
    } else {
      try {
        // Create the directory and open the database
        await Directory(dirname(path)).create(recursive: true);
        _database = await openDatabase(path, version: 1,
            onCreate: (Database db, int version) async {
          // When creating the db, create the 'cities' table
          await db.execute('''
            CREATE TABLE cities (
              id INTEGER PRIMARY KEY, 
              name TEXT, 
              country TEXT, 
              latitude REAL, 
              longitude REAL
            )''');
        });

        emit(LoadDatabaseState());
      } catch (e) {
        log(e.toString());
      }
    }
  }
}
