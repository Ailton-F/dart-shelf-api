import 'package:mysql1/mysql1.dart';
import 'package:dotenv/dotenv.dart' as dotenv;

class Connection {
  static Future<MySqlConnection> getMy() async {
    final envVars = dotenv.load('.env');

    final host = dotenv.env['db_host_mysql'];
    final port = int.parse(dotenv.env['db_port_mysql'] ?? '3306');
    final user = dotenv.env['db_user_mysql'];
    final password = dotenv.env['db_password_mysql'];
    final db = dotenv.env['db_schema_mysql'];

    MySqlConnection conn = await MySqlConnection.connect(ConnectionSettings(
      host: host.toString(),
      user: user,
      port: port,
      db: db,
    ));

    try {
      // Attempt to execute a simple query to test the connection.
      final results = await conn.query('SELECT 1');

      // If the query was successful, print a message indicating that the connection was established.
      print('Connection established.');
    } catch (e) {
      // If the query fails, print the error message.
      print('Connection failed: ${e.toString()}');
    } finally {
      // Close the connection.
      await conn.close();
    }

    return conn;
  }
}
