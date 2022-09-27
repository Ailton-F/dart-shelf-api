// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  final int id;
  final String name;
  final String cpf;
  final String password;
  final String matricula;
  User({
    required this.id,
    required this.name,
    required this.cpf,
    required this.password,
    required this.matricula,
  });

  User copyWith({
    int? id,
    String? name,
    String? cpf,
    String? password,
    String? matricula,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      cpf: cpf ?? this.cpf,
      password: password ?? this.password,
      matricula: matricula ?? this.matricula,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'cpf': cpf,
      'password': password,
      'matricula': matricula,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int,
      name: map['name'] as String,
      cpf: map['cpf'] as String,
      password: map['password'] as String,
      matricula: map['matricula'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(id: $id, name: $name, cpf: $cpf, password: $password, matricula: $matricula)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.cpf == cpf &&
      other.password == password &&
      other.matricula == matricula;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      cpf.hashCode ^
      password.hashCode ^
      matricula.hashCode;
  }
}
