// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  final int id;
  final String nome;
  final String cpf;
  final String email;
  final String senha;
  User({
    required this.id,
    required this.nome,
    required this.cpf,
    required this.email,
    required this.senha,
  });

  User copyWith({
    int? id,
    String? nome,
    String? cpf,
    String? email,
    String? senha,
  }) {
    return User(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      cpf: cpf ?? this.cpf,
      email: email ?? this.email,
      senha: senha ?? this.senha,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nome': nome,
      'cpf': cpf,
      'email': email,
      'senha': senha,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int,
      nome: map['nome'] as String,
      cpf: map['cpf'] as String,
      email: map['email'] as String,
      senha: map['senha'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(id: $id, nome: $nome, cpf: $cpf, email: $email, senha: $senha)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.nome == nome &&
      other.cpf == cpf &&
      other.email == email &&
      other.senha == senha;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      nome.hashCode ^
      cpf.hashCode ^
      email.hashCode ^
      senha.hashCode;
  }
}
