// part of 'api_cubit.dart';

// @immutable
// abstract class ApiState {}

// class ApiInitial extends ApiState {}

// class GetAllusers extends ApiState {
//   final List<User> allUsersList;

//   GetAllusers(this.allUsersList);
// }

// class GetUser extends ApiState {
//   final User usersDetails;

//   GetUser(this.usersDetails);
// }

// class CreateNewUser extends ApiState {
//   final User newUser;

//   CreateNewUser(this.newUser);
// }

// class DeleteUser extends ApiState {
//   final dynamic data;

//   DeleteUser(this.data);
// }

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mynewapiapp/network_exceptions.dart';

part 'result_state.freezed.dart';

@freezed
class ResultState<T> with _$ResultState<T> {
  const factory ResultState.idle() = Idle<T>;
  const factory ResultState.loading() = Loading<T>;
  const factory ResultState.success(T data) = Success<T>;
  const factory ResultState.error(NetworkExceptions networkExceptions) =
      Error<T>;
}
