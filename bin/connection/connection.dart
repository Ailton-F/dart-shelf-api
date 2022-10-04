import 'package:mysql1/mysql1.dart';
import '../../utils/customEnv.dart';

class Connection {
  static Future<MySqlConnection> getMy() async {
    String host = await CustomEnv.get<String>(key: 'db_host_mysql');
    String user = await CustomEnv.get<String>(key: 'db_user_mysql');
    int port = await CustomEnv.get<int>(key: 'db_port_mysql');
    String password = await CustomEnv.get<String>(key: 'db_password_mysql');
    String db = await CustomEnv.get<String>(key: 'db_schema_mysql');
    
    MySqlConnection connection =
        await MySqlConnection.connect(ConnectionSettings(
      host: host.toString(),
      user: user,
      port: port,
      password: password,
      db: db,
    ));

    return connection;
  }
}
