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
}
