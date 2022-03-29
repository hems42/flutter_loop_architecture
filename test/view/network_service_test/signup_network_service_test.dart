import 'package:flutter_notebook/core/constants/enum/network/http_request_types_enum.dart';
import 'package:flutter_notebook/core/init/network/concrete/dio/network_manager_dio.dart';
import 'package:flutter_notebook/view/authenticate/_signup/model/signup_request_model.dart';
import 'package:flutter_notebook/view/authenticate/_signup/model/signup_response_model.dart';
import 'package:flutter_notebook/view/authenticate/_signup/service/abstract/ife_signup_network_service.dart';
import 'package:flutter_notebook/view/authenticate/_signup/service/concrete/signup_network_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late ISignupNetworkService signupNetworkService;
  setUp(() {
    signupNetworkService = SignupNetworkService();
  });

  test('signup user test', () async {
    // var requestmodel = SignupRequestModel(eMail: "ali@ali", password: "ali", userNickName: "ali");

    final response = await signupNetworkService.signup(SignupRequestModel(
        eMail: "ali@ali", password: "ali", userNickName: "ali"));

    print("gelen email :" + response!.email.toString());
  });

  test("hfthyrtyrtytr", () async {
    var network = NetworkManagerOfDio.instance;

    final response = await network!
        .send<SignupResponseModel, SignupResponseModel>(
            '/authentication/signup',
            type: HttpRequestTypes.POST,
            parseModel: SignupResponseModel(),
            data: SignupRequestModel(
                eMail: "pali@pali", password: "pali", userNickName: "pali"));

    print("gelen response : " +
        (response.data as SignupResponseModel).toString());
  });
}
