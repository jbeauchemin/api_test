import 'package:alfred/alfred.dart';
import 'package:api_dart/services/services.dart';

void authRoutes(NestedRoute app) {
  app.post('/register', services.authService.register);
  app.post('/login', services.authService.login);
}
