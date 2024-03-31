import 'package:postgres/postgres.dart';

class DatabaseService {
  final String _host = 'localhost';
  final int _port = 5432;
  final String _databaseName = 'postgres';
  final String _username = 'postgres';
  final String _password = 'test123';

  Future<Object> fetchData() async {
    final connection = await Connection.open(
      Endpoint(
      host: _host,
      port: _port,
      database: _databaseName,
      username: _username,
      password: _password,
      ),
      settings: const ConnectionSettings(sslMode: SslMode.disable),
    );
    'Connected!';

    try {
      final results = await connection.execute('SELECT * FROM newtable');
      return results;
    } catch (e) {
      'Error fetching data: $e';
      return [];
    } finally {
      await connection.close();
    }
  }
}