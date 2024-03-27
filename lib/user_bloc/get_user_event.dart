part of 'get_user_bloc.dart';

sealed class GetUserEvent extends Equatable {
  const GetUserEvent();
}

class GetUser extends GetUserEvent {
  @override
  List<Object?> get props => [];
}
