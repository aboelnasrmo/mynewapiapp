import 'package:mynewapiapp/api_result.dart';
import 'package:mynewapiapp/network_exceptions.dart';
import 'package:retrofit/dio.dart';

import 'user.dart';
import 'web_services.dart';

class MyRepo {
  final WebServices webServices;
  MyRepo(this.webServices);
  Future<ApiResult<List<User>>> getAllUsers() async {
    try {
      var response = await webServices.getAllUsers();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  Future<ApiResult<User>> getUserById(String userId) async {
    try {
      var response = await webServices.getUserByID(userId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  // new method of return no need to do from to json as retrofit aleardy doing that.

  Future<ApiResult<User>> createNewUser(User user) async {
    try {
      var response = await webServices.createNewUser(user,
          'Bearer 5c9c8247b4ba03e18ca5c884ea2c347148ba3bfc5456b88610483392d869f8a1');
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

//old method for calling api , without error handling
  Future<HttpResponse> deleteUser(String id) async {
    return await webServices.deleteUser(id,
        'Bearer 5c9c8247b4ba03e18ca5c884ea2c347148ba3bfc5456b88610483392d869f8a1');
  }
}
