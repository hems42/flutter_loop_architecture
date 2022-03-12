import 'package:flutter_notebook/core/constants/enum/http_request_types_enum.dart';

import '../../../base/model/abstract/ife_base_model.dart';
import '../../../base/model/abstract/ife_base_response_model.dart';

abstract class INetworService {
  void loginUser();

  void signUpUser();

  void logOutUser();

  
}
