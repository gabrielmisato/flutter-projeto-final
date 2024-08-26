import 'package:projeto_final/database/db_helper.dart';
import 'package:projeto_final/classes/receita.dart';

class ReceitaDao {
  static Future<int> inserir(Receita receita) async {
    var db = await DBHelper.getInstance();
    return await db.insert('receitas', receita.toMap());
  }

  static Future<void> atualizar(Receita receita) async {
    var db = await DBHelper.getInstance();
    await db.update('receitas', receita.toMap(),
        where: 'id = ?', whereArgs: [receita.id]);
  }

  static Future<void> deletar(Receita receita) async {
    var db = await DBHelper.getInstance();
    await db.delete('receitas', where: 'id = ?', whereArgs: [receita.id]);
  }

  static Future<List<Receita>> carregarReceitas() async {
    var db = await DBHelper.getInstance();
    List<Map> result = await db.query('receitas');
    return result
        .map((e) => Receita.fromMap(e as Map<String, dynamic>))
        .toList();
  }

  static Future<List<String>> carregarTitulos() async {
    var db = await DBHelper.getInstance();
    List<Map> result = await db.query('receitas');
    return result.map((e) => e['titulo'] as String).toList();
  }
}
