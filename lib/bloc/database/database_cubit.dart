import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

part 'database_state.dart';

class DatabaseCubit extends Cubit<DatabaseState> {
  DatabaseCubit() : super(InitDatabaseState());

  Database? database;

  Future<void> initDatabase() async {
    final databasePath = await getDatabasesPath();
    // print(databasePath);
    final path = join(databasePath, 'cities.db');
    if (await Directory(dirname(path)).exists()) {
      database = await openDatabase(path, version: 1,
          onCreate: (Database db, int version) async {
        // When creating the db, create the table
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
        await Directory(dirname(path)).create(recursive: true);
        database = await openDatabase(path, version: 1,
            onCreate: (Database db, int version) async {
          // When creating the db, create the table
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
