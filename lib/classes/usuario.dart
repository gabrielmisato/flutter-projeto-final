import 'dart:convert';

class Usuario {
  final int? id;
  final String email;
  final String senha;
  Usuario({
    this.id,
    required this.email,
    required this.senha,
  });

  Usuario copyWith({
    int? id,
    String? email,
    String? senha,
  }) {
    return Usuario(
      id: id ?? this.id,
      email: email ?? this.email,
      senha: senha ?? this.senha,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'senha': senha,
    };
  }

  factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(
      id: map['id'] != null ? map['id'] as int : null,
      email: map['email'] as String,
      senha: map['senha'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Usuario.fromJson(String source) =>
      Usuario.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Usuario(id: $id, email: $email, senha: $senha)';

  @override
  bool operator ==(covariant Usuario other) {
    if (identical(this, other)) return true;

    return other.id == id && other.email == email && other.senha == senha;
  }

  @override
  int get hashCode => id.hashCode ^ email.hashCode ^ senha.hashCode;
}
