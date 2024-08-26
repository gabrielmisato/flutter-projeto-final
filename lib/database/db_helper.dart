import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static late Database _instance;
  static const String dbName = 'app_receitas.db';

  static Future<Database> getInstance() async {
    String databasesPath = await getDatabasesPath();
    var path = databasesPath + dbName;
    _instance = await openDatabase(path,
        onCreate: _onCreate,
        version: 4,
        onOpen: _onOpen,
        onUpgrade: _onUpgrade,
        onDowngrade: _onDowngrade);

    return _instance;
  }

  static Future<void> _onCreate(Database db, int version) async {
    debugPrint('Criando as tabelas do banco de dados');
    await db.execute("""
    CREATE TABLE usuarios (
        id INTEGER PRIMARY KEY,
        email TEXT UNIQUE,
        senha TEXT
    );
    """);
    await db.execute("""
    CREATE TABLE receitas (
      id INTEGER PRIMARY KEY,
      titulo TEXT,
      descricao TEXT,
      ingredientes TEXT,
      tempoPreparo TEXT,
      modoPreparo TEXT,
      imagemUrl TEXT
    );
    """);
  }

  static void _onOpen(Database db) async {
    debugPrint('Versão do banco: ${await db.getVersion()}');
  }

  static void _onUpgrade(Database db, int oldVersion, int newVersion) async {
    debugPrint('Fazendo upgrade da versão $oldVersion para $newVersion');
  }

  static void _onDowngrade(Database db, int oldVersion, int newVersion) async {
    debugPrint('Fazendo downgrade da versão $oldVersion para $newVersion');
  }
}
