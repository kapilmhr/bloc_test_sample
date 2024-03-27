import 'package:bloc_testing_sample/model/user.dart';
import 'package:dio/dio.dart';

import '../network/dio_client.dart';
import '../network/paths.dart';
import 'user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  @override
  Future<User> getUser() async {
    try {
      final response = await DioClient.instance.get(Paths.users);
      final user = User.fromJson(response["data"]);
      return user;
    } on DioException catch (error) {
      throw error.message ?? "Error";
    }
  }
}
