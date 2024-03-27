import 'package:bloc_testing_sample/user_bloc/get_user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: const SafeArea(
        child: UserProfile(),
      ),
    );
  }
}

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserBloc, GetUserState>(builder: (context, state) {
      switch (state) {
        case GetUserLoading():
          return const Center(child: CircularProgressIndicator());

        case GetUserLoaded():
          return Center(
            child: Column(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network("${state.user.avatar}")),
                Text(
                  '${state.user.firstName} ${state.user.lastName}',
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                )
              ],
            ),
          );
        case GetUserError():
          return const Text('Error');
      }
    });
  }
}
