// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../my_repo.dart';
import '../user.dart';

part 'api_state.dart';

class ApiCubit extends Cubit<ApiState> {
  ApiCubit(
    this.myRepo,
  ) : super(ApiInitial());
  final MyRepo myRepo;
  void getUsers() {
    myRepo.getAllUsers().then((usersList) {
      emit(GetAllusers(usersList));
    });
  }
}
