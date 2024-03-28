import 'package:bloc_testing_sample/repository/user_repository.dart';
import 'package:bloc_testing_sample/repository/user_repositoryimpl.dart';
import 'package:bloc_testing_sample/repository/user_service.dart';
import 'package:bloc_testing_sample/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'user_bloc/get_user_bloc.dart';

void main() {
  runApp(App(
    userService: UserService(),
  ));
}

class App extends StatelessWidget {
  const App({Key? key, required this.userService}) : super(key: key);

  final UserService userService;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          GetUserBloc(userService: userService)..add(GetUser()),
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
