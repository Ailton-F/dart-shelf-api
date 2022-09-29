import 'package:mysql1/mysql1.dart';
import '../connection/connection.dart';
import '../models/user.dart';

class UserServices {
  static Future<MySqlConnection> getCon() async {
    MySqlConnection con = await Connection.getMy();
    return con;
  }

  static Future<Results> getUsers() async {
    MySqlConnection con = await getCon();
    Results users = await con.query('select * from usuario');
    return users;
  }

  Future<List<User>> findAllUsers() async {
    Results users = await getUsers();
    final List<User> allUsers = users.map((userMap) => User.fromMap(userMap.fields)).toList();
    return allUsers;
  }
}
