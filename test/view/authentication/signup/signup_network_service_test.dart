import 'package:flutter_notebook/view/authentication/_signup/model/signup_request_model.dart';
import 'package:flutter_notebook/view/authentication/_signup/service/concrete/signup_network_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("sign up network test", () async {
    final signup_service = await SignupNetworkService();

    final response = await signup_service.signup(SignupRequestModel());

    print(response?.email.toString());
  });
}
