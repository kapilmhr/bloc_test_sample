import 'package:bloc/bloc.dart';
import 'package:bloc_testing_sample/repository/user_service.dart';
import 'package:equatable/equatable.dart';

import '../model/user.dart';
import '../repository/user_repository.dart';

part 'get_user_event.dart';

part 'get_user_state.dart';

class GetUserBloc extends Bloc<GetUserEvent, GetUserState> {
  final UserService userService;
  GetUserBloc({required this.userService}) : super(GetUserLoading()) {
    on<GetUserEvent>(_onGetUser);
  }

  Future<void> _onGetUser(
      GetUserEvent event, Emitter<GetUserState> emit) async {
    emit(GetUserLoading());
    try {
      final user = await userService.getUser();
      emit(GetUserLoaded(user: user));
    } catch (e) {
      emit(GetUserError());
    }
  }
}
