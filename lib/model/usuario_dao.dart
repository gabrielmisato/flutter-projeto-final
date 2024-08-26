import 'package:flutter/foundation.dart';
import 'package:projeto_final/database/db_helper.dart';
import 'package:projeto_final/classes/usuario.dart';

class UsuarioDAO {
  static Future<int> inserir(Usuario usuario) async {
    var db = await DBHelper.getInstance();
    return await db.insert('usuarios', usuario.toMap());
  }

  static Future<void> atualizar(Usuario usuario) async {
    var db = await DBHelper.getInstance();
    await db.update('usuarios', usuario.toMap());
  }

  static Future<void> deletar(Usuario usuario) async {
    var db = await DBHelper.getInstance();
    await db.delete('usuarios', where: 'id = ?', whereArgs: [usuario.id]);
  }

  static Future<List<Usuario>> carregarUsuarios() async {
    var db = await DBHelper.getInstance();
    List<Map> result = await db.query('usuarios');
    debugPrint('Usários cadastrados: $result');
    return result
        .map((e) => Usuario.fromMap(e as Map<String, dynamic>))
        .toList();
  }

  static Future<Usuario?> verificaLogin(String email, String senha) async {
    var db = await DBHelper.getInstance();
    List<Map<String, dynamic>> result = await db.query(
      'usuarios',
      where: 'email = ? AND senha = ?',
      whereArgs: [email, senha],
    );
    if (result.isNotEmpty) {
      return Usuario.fromMap(result.first);
    }
    return null;
  }
}
