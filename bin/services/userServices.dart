import 'package:mysql1/mysql1.dart';
import '../../utils/customEnv.dart';
import '../connection/connection.dart';
import '../models/user.dart';

class userServices {
  static final con = Connection.getMy();
  final users = con.query('select * from usuario');
  
  Future<List<User>> findAllUsers() async {
    await Future.delayed(const Duration(milliseconds: 100));
    final List<User> allUsers =
        users.map((userMap) => User.fromMap(userMap)).toList();
    return allUsers;
  }
}
