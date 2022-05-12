import 'package:metadent/models/apiResponse.dart';
import 'package:metadent/models/models.dart';
import 'package:metadent/providers/resources/metadentApiProvider.dart';

class AuthRepository {
  final metadentApiProvider = MetaDentApiProvider();

  Future<ApiResponse> authenticateUser({required String email, required String password}) async {
    var apiResponse = await metadentApiProvider.authenticateUser(email: email, password: password);

    return apiResponse;
  }
}
