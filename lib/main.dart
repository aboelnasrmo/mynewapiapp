import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mynewapiapp/injection.dart';

import 'cubit/api_cubit.dart';
import 'home_screen.dart';
import 'my_repo.dart';

void main() {
  //dependancy injection
  initGetIt();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  MyRepo? myRepo;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => getIt<ApiCubit>(),
        child: const HomeScreen(),
      ),
      // home: HomeScreen(),
    );
  }
}
