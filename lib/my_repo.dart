import 'package:retrofit/dio.dart';

import 'user.dart';
import 'web_services.dart';

class MyRepo {
  final WebServices webServices;
  MyRepo(this.webServices);
  Future<List<User>> getAllUsers() async {
    var response = await webServices.getAllUsers();
    return response.map((user) => User.fromJson(user.toJson())).toList();
  }

  Future<User> getUserById(String userId) async {
    var response = await webServices.getUserByID(userId);
    return User.fromJson(response.toJson());
  }

  // new method of return no need to do from to json as retrofit aleardy doing that.

  Future<User> createNewUser(User user) async {
    return await webServices.createNewUser(user,
        'Bearer 5c9c8247b4ba03e18ca5c884ea2c347148ba3bfc5456b88610483392d869f8a1');
  }

  Future<HttpResponse> deleteUser(String id) async {
    return await webServices.deleteUser(id,
        'Bearer 5c9c8247b4ba03e18ca5c884ea2c347148ba3bfc5456b88610483392d869f8a1');
  }
}
