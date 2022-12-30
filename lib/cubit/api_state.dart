part of 'api_cubit.dart';

@immutable
abstract class ApiState {}

class ApiInitial extends ApiState {}

class GetAllusers extends ApiState {
  final List<User> allUsersList;

  GetAllusers(this.allUsersList);
}
