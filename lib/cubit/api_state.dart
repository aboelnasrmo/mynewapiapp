part of 'api_cubit.dart';

@immutable
abstract class ApiState {}

class ApiInitial extends ApiState {}

class GetAllusers extends ApiState {
  final List<User> allUsersList;

  GetAllusers(this.allUsersList);
}

class GetUser extends ApiState {
  final User usersDetails;

  GetUser(this.usersDetails);
}

class CreateNewUser extends ApiState {
  final User newUser;

  CreateNewUser(this.newUser);
}

class DeleteUser extends ApiState {
  final dynamic data;

  DeleteUser(this.data);
}
