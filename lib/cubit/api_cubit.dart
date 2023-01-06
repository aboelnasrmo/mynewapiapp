// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mynewapiapp/api_result.dart';
import 'package:mynewapiapp/cubit/result_state.dart';
import 'package:mynewapiapp/network_exceptions.dart';

import '../my_repo.dart';
import '../user.dart';

// part 'api_state.dart';

class ApiCubit extends Cubit<ResultState<User>> {
  ApiCubit(
    this.myRepo,
  ) : super(const Idle());
  final MyRepo myRepo;
  void getUsers() async {
    var data = await myRepo.getAllUsers();
    data.when(success: (List<User> allusers) {
      emit(ResultState.success(allusers as User));
    }, failure: (NetworkExceptions networkExceptions) {
      emit(ResultState.error(networkExceptions));
    });
    // myRepo.getAllUsers().then((usersList) {
    //   emit(GetAllusers(usersList));
    // });
  }

  void getUserDetails(String userId) async {
    var data = await myRepo.getUserById(userId);
    data.when(success: (User user) {
      emit(ResultState.success(user));
    }, failure: (NetworkExceptions networkExceptions) {
      emit(ResultState.error(networkExceptions));
    });
  }

  void createNewUser(User newUser) async {
    var data = await myRepo.createNewUser(newUser);
    data.when(success: (User userData) {
      emit(ResultState.success(userData));
    }, failure: (NetworkExceptions networkExceptions) {
      emit(ResultState.error(networkExceptions));
    });
    // myRepo.createNewUser(newUser).then((newUser) {
    //   emit(CreateNewUser(newUser));
    // });
  }

  // void deleteUser(String id) {
  //   myRepo.deleteUser(id).then((data) {
  //     emit(DeleteUser(data));
  //   });
  // }
}
