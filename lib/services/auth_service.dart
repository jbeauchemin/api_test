import 'package:alfred/alfred.dart';
import 'package:api_dart/utils/token.dart';

class AuthService {
  final _users = [
    {
      'id': 1,
      'email': 'j.beauchemin1989@hotmail.com',
      'password': '123456',
      'fullname': 'Jonathan Beauchemin'
    }
  ];

  void login(HttpRequest req, HttpResponse res) async {
    final body = await req.bodyAsJsonMap;
    final email = body['email'];
    final password = body['password'];

    final user = _users.firstWhere(
        (user) => user['email'] == email && user['password'] == password);

    if (user.isEmpty) {
      throw AlfredException(401, 'Invalid credentials');
    }

    final token = Token.generateToken({'id': user['id']});

    res.json({'token': token});
  }

  void register(HttpRequest req, HttpResponse res) async {
    final body = await req.bodyAsJsonMap;
    final email = body['email'];
    final password = body['password'];
    final fullname = body['fullname'];
    final token = body['token'];

    if (token != null) {
      if (!Token.verifyToken(token)) {
        throw AlfredException(401, 'Invalid token');
      }
    }

    if (email == null || password == null || fullname == null) {
      throw AlfredException(400, 'Missing fields');
    }

    final user = _users.firstWhere((user) => user['email'] == email);

    if (user.isNotEmpty) {
      throw AlfredException(400, 'This email is already taken');
    }

    _users.add({
      'id': _users.length + 1,
      'email': email,
      'password': password,
      'fullname': fullname,
    });

    res.json({'message': 'User created'});
  }
}
