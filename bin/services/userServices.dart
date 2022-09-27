import 'package:mysql1/mysql1.dart';
import '../../utils/customEnv.dart';
import '../models/user.dart';

class userServices {
  final env = CustomEnv.instace;
  String? host = env['db_host_mysql'];

  Future<MySqlConnection> connection = MySqlConnection.connect(
    ConnectionSettings(
      host:

    ),
  );

  Future<List<User>> findAllUsers() async {
    await Future.delayed(const Duration(milliseconds: 100));
    final List<User> allUsers = users.map((userMap) => User.fromMap(userMap)).toList()
  }
}
