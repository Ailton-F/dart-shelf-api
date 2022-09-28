import 'dart:convert';

import 'package:mysql1/mysql1.dart';

import '../../utils/customEnv.dart';

class Connection {
  static getMy() async {
    Future<MySqlConnection> connection =
        MySqlConnection.connect(ConnectionSettings(
      host: CustomEnv.get(key: 'db_host_mysql').toString(),
      port: int.parse(CustomEnv.get(key: 'db_port_mysql').toString()),
      password: CustomEnv.get(key: 'db_password_mysql').toString(),
      db: CustomEnv.get(key: 'db_schema_mysql').toString(),
    ));

    return connection;
  }
}
