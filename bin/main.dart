import 'package:api_dart/app.dart';
import 'package:api_dart/services/services.dart';
import 'package:get_it/get_it.dart';

main() async {
  GetIt.instance.registerSingleton(Services());

  final server = Server();

  await server.start();
}
