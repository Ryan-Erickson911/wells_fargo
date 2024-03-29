import 'package:postgres/postgres.dart';

class DatabaseService {
  final String _host = 'localhost';
  final int _port = 5432;
  final String _databaseName = 'postgres';
  final String _username = 'postgres';
  final String _password = 'test123';

  Future<Map<String, dynamic>> fetchData(String username, String password) async {
      final connection = await Connection.open(Endpoint(
        host: _host,
        port: _port, 
        database: _databaseName,
        username: _username, 
        password: _password));
      if (connection.isOpen) {
        final results = await connection.execute('SELECT * FROM newtable WHERE username = @username AND pwrd = @password', parameters: {'username': username, 'password': password});
        if (results.isNotEmpty) {
          return results.first.toColumnMap();
        } else {
          throw 'Incorrect Username or Password';
        }
      } else {
        throw 'Connection is not open';
      }
  }
}

//username and password are calling the server username and password instead of the inputted pair from the user