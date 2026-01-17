import 'package:food_app/data/api/api_client.dart';
import 'package:get/get_connect/http/src/response/response.dart';

import '../../utils/constants.dart';

class UserRepo{
  final ApiClient apiClient;
  UserRepo({required this.apiClient});
  Future<Response> getUserInfo() async {
    return await apiClient.getData(AppConstants.UserInfo);

  }
}