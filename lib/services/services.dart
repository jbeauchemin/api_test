import 'package:api_dart/services/auth_service.dart';
import 'package:get_it/get_it.dart';

class Services {
  final authService = AuthService();
}

Services get services => GetIt.instance.get<Services>();
