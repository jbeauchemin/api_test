import 'package:alfred/alfred.dart';
import 'package:api_dart/routes/auth.dart';
import 'package:api_dart/routes/beers.dart';

class Server {
  final app = Alfred();

  Future<void> start() async {
    authRoutes(app.route('/auth'));
    beerRoutes(app.route('/beers'));

    await app.listen();
  }
}
