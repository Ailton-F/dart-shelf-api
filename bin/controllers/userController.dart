import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:shelf/shelf.dart';

import '../models/user.dart';
import '../services/userServices.dart';

class UserController {
  UserController(this._userServices);

  final userServices _userServices;

  FutureOr<Response> getAllUsers(Request req) async {
    try {
      final List<User> allUsers = await _userServices.findAllUsers();
      return Response.ok(
          jsonEncode({
            'users': allUsers.map(
              (user) => user.toMap(),
            )
          }),
          headers: {HttpHeaders.contentTypeHeader: 'application/json'});
    } catch (e) {
      return Response.internalServerError(body: jsonEncode({
        'error': 'Falha ao acessar o banco'
      }));
    }
  }
}
