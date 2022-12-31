import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynewapiapp/cubit/api_cubit.dart';

import 'user.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> usersList = [];
  User singleUser = User();
  late ApiCubit myCubit;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // BlocProvider.of<ApiCubit>(context).getUsers();
    // BlocProvider.of<ApiCubit>(context).getUserDetails('3800');
    BlocProvider.of<ApiCubit>(context).createNewUser(User(
        name: 'Mo',
        email: 'mo@mo.com',
        id: 9998,
        gender: 'male',
        status: 'active'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Column(
        children: [
          //Create new User
          BlocBuilder<ApiCubit, ApiState>(
            builder: (context, state) {
              if (state is CreateNewUser) {
                singleUser = state.newUser;
                return Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      // child: Text(listOfChilds[index].childName.toString()),
                      child: Text(singleUser.id.toString()),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        singleUser.name.toString(),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(singleUser.status.toString(),
                          style: const TextStyle(fontSize: 12)),
                    ),
                  ],
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),

          //Get single user
          // BlocBuilder<ApiCubit, ApiState>(
          //   builder: (context, state) {
          //     if (state is GetUser) {
          //       singleUser = state.usersDetails;
          //       return Row(
          //         mainAxisAlignment: MainAxisAlignment.start,
          //         children: [
          //           Padding(
          //             padding: const EdgeInsets.all(8.0),
          //             // child: Text(listOfChilds[index].childName.toString()),
          //             child: Text(singleUser.id.toString()),
          //           ),
          //           Padding(
          //             padding: const EdgeInsets.all(8.0),
          //             child: Text(
          //               singleUser.name.toString(),
          //             ),
          //           ),
          //           const Spacer(),
          //           Padding(
          //             padding: const EdgeInsets.all(8.0),
          //             child: Text(singleUser.status.toString(),
          //                 style: const TextStyle(fontSize: 12)),
          //           ),
          //         ],
          //       );
          //     } else {
          //       return const Center(
          //         child: CircularProgressIndicator(),
          //       );
          //     }
          //   },
          // ),

          // get All users

          // BlocBuilder<ApiCubit, ApiState>(
          //   builder: (context, state) {
          //     if (state is GetAllusers) {
          //       usersList = state.allUsersList;
          //       return ListView.builder(
          //         shrinkWrap: true,
          //         padding: const EdgeInsets.all(8),
          //         itemCount: usersList.length,
          //         itemBuilder: (context, index) {
          //           // return Container(
          //           //   height: 50,
          //           //   color: Colors.transparent,
          //           //   child: Center(
          //           //     child: Text(usersList[index].name.toString()),
          //           //   ),
          //           // );

          //           return Row(
          //             mainAxisAlignment: MainAxisAlignment.start,

          //             children: [
          //               Padding(
          //                 padding: const EdgeInsets.all(8.0),
          //                 // child: Text(listOfChilds[index].childName.toString()),
          //                 child: Text(usersList[index].id.toString()),
          //               ),
          //               Padding(
          //                 padding: const EdgeInsets.all(8.0),
          //                 child: Text(
          //                   usersList[index].name.toString(),
          //                 ),
          //               ),
          //               const Spacer(),
          //               Padding(
          //                 padding: const EdgeInsets.all(8.0),
          //                 child: Text(usersList[index].status.toString(),
          //                     style: const TextStyle(fontSize: 12)),
          //               ),
          //             ],
          //           );
          //         },
          //       );
          //     } else {
          //       return const Center(
          //         child: CircularProgressIndicator(),
          //       );
          //     }
          //   },
          // ),
        ],
      ),
    );
  }
}
