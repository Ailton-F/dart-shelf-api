import 'dart:io';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';
import 'controllers/userController.dart';
import 'services/userServices.dart';

// Configure routes.
final _router = Router();

// Configure services and controllers
UserServices userServices = UserServices();
final UserController userController = UserController(userServices);

void main(List<String> args) async {
  
  // Configure routes
  _router.get('/', (request) => userController.getAllUsers(request));
  
  // Use any available host or container IP (usually `0.0.0.0`).
  final ip = InternetAddress.anyIPv4;

  // Configure a pipeline that logs requests.
  final handler = Pipeline().addMiddleware(logRequests()).addHandler(_router);

  // For running in containers, we respect the PORT environment variable.
  final port = int.parse(Platform.environment['PORT'] ?? '8000');
  print(port);
  
  final server = await serve(handler, ip, port);
  print('Server listening on port ${server.port}');
}
