import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:shelf/shelf.dart';

import '../models/user.dart';
import '../services/userServices.dart';

class UserController {
  UserController(this._userServices);
  final UserServices _userServices;
  FutureOr<Response> getAllUsers(Request req) async {
    try {
      final List<User> allUsers = await _userServices.findAllUsers();
      return Response.ok(
          jsonEncode({'users': allUsers.map((e) => e.toMap()).toList()}),
          headers: {HttpHeaders.contentTypeHeader: 'application/json'});
    } catch (e) {
      return Response.internalServerError(body: e);
    }
  }
}
