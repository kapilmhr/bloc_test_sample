part of 'get_user_bloc.dart';

sealed class GetUserState extends Equatable {
  const GetUserState();
}

final class GetUserLoading extends GetUserState {
  @override
  List<Object> get props => [];
}

final class GetUserLoaded extends GetUserState {
  final User user;

  const GetUserLoaded({this.user = const User()});

  @override
  List<Object> get props => [user];
}

final class GetUserError extends GetUserState {
  @override
  List<Object> get props => [];
}
