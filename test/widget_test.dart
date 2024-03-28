// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:bloc_test/bloc_test.dart';
import 'package:bloc_testing_sample/model/user.dart';
import 'package:bloc_testing_sample/user_bloc/get_user_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mocktail/mocktail.dart';

import 'mock_service.dart';

void main() {
  group('get_user bloc', () {
    late MockService mockService;

    setUp(() {
      mockService = MockService();
    });

    test('initial state is get user loading', () {
      expect(GetUserBloc(userService: mockService).state, GetUserLoading());
    });

    blocTest<GetUserBloc, GetUserState>(
      'emits [ GetUserLoading,GetUserError ] when loading fails',
      setUp: () => when(mockService.getUser).thenThrow(Exception()),
      build: () => GetUserBloc(userService: mockService),
      act: (bloc) => bloc.add(GetUser()),
      expect: () => <GetUserState>[GetUserLoading(), GetUserError()],
      verify: (_) => verify(mockService.getUser).called(1),
    );

    blocTest<GetUserBloc, GetUserState>(
      'emits [ GetUserLoading,GetUserLoaded ]  when loaded successfully',
      setUp: () =>
          when(mockService.getUser).thenAnswer((_) async => const User()),
      build: () => GetUserBloc(userService: mockService),
      act: (bloc) => bloc.add(GetUser()),
      expect: () => <GetUserState>[GetUserLoading(), const GetUserLoaded()],
      verify: (_) => verify(mockService.getUser).called(1),
    );
  });
}
