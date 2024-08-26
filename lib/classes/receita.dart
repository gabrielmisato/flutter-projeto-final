import 'dart:convert';

class Receita {
  final int? id;
  final String titulo;
  final String descricao;
  final String ingredientes;
  final String tempoPreparo;
  final String modoPreparo;
  final String imagemUrl;
  Receita({
    this.id,
    required this.titulo,
    required this.descricao,
    required this.ingredientes,
    required this.tempoPreparo,
    required this.modoPreparo,
    required this.imagemUrl,
  });

  Receita copyWith({
    int? id,
    String? titulo,
    String? descricao,
    String? ingredientes,
    String? tempoPreparo,
    String? modoPreparo,
    String? imagemUrl,
  }) {
    return Receita(
      id: id ?? this.id,
      titulo: titulo ?? this.titulo,
      descricao: descricao ?? this.descricao,
      ingredientes: ingredientes ?? this.ingredientes,
      tempoPreparo: tempoPreparo ?? this.tempoPreparo,
      modoPreparo: modoPreparo ?? this.modoPreparo,
      imagemUrl: imagemUrl ?? this.imagemUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'titulo': titulo,
      'descricao': descricao,
      'ingredientes': ingredientes,
      'tempoPreparo': tempoPreparo,
      'modoPreparo': modoPreparo,
      'imagemUrl': imagemUrl,
    };
  }

  factory Receita.fromMap(Map<String, dynamic> map) {
    return Receita(
      id: map['id'] != null ? map['id'] as int : null,
      titulo: map['titulo'] as String,
      descricao: map['descricao'] as String,
      ingredientes: map['ingredientes'] as String,
      tempoPreparo: map['tempoPreparo'] as String,
      modoPreparo: map['modoPreparo'] as String,
      imagemUrl: map['imagemUrl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Receita.fromJson(String source) =>
      Receita.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Receita(id: $id, titulo: $titulo, descricao: $descricao, ingredientes: $ingredientes, tempoPreparo: $tempoPreparo, modoPreparo: $modoPreparo, imagemUrl: $imagemUrl)';
  }

  @override
  bool operator ==(covariant Receita other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.titulo == titulo &&
        other.descricao == descricao &&
        other.ingredientes == ingredientes &&
        other.tempoPreparo == tempoPreparo &&
        other.modoPreparo == modoPreparo &&
        other.imagemUrl == imagemUrl;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        titulo.hashCode ^
        descricao.hashCode ^
        ingredientes.hashCode ^
        tempoPreparo.hashCode ^
        modoPreparo.hashCode ^
        imagemUrl.hashCode;
  }
}
