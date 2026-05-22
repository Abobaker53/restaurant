import 'package:dartz/dartz.dart';

import '../../../../core/cache/cache_helper.dart';
import '../../../../core/cache/cache_keys.dart';
import '../../../../core/network/api_helper.dart';
import '../../../../core/network/end_points.dart';
import '../model/user_model.dart';

class AuthRepo {
  Future<Either<String, UserModel>> login({
    required String email,
    required String password,
  }) async {
    var response = await ApiHelper.post(
      endPoint: EndPoints.login,
      data: {'email': email, 'password': password},
    );
    return response.fold(
          (error) {
        return left(error);
      },
          (map) async {
        await CacheHelper.setValue(
          key: CacheKeys.accessToken,
          value: map[CacheKeys.accessToken],
        );
        await CacheHelper.setValue(
          key: CacheKeys.refreshToken,
          value: map[CacheKeys.refreshToken],
        );

        return right(UserModel.fromJson(map['user']));
      },
    );
  }

  Future<Either<String, String>> register({
    required String name,
    required String password,
    required String email,
    required String phone,
  }) async {
    var response = await ApiHelper.post(
      endPoint: EndPoints.register,
      data: {'name': name, 'password': password,'email':email,'phone':phone},
    );

    return response.fold(
          (error) {
        return left(error);
      },
          (map) {
        return right(map['message']);
      },
    );
  }
}