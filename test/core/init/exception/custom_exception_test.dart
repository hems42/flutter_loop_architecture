import 'package:flutter_notebook/core/constant/enum/exception/exception_event_types_enum.dart';
import 'package:flutter_notebook/core/constant/static/exception/exception_error_code_statics.dart';
import 'package:flutter_notebook/core/extension/exception_extension.dart';
import 'package:flutter_notebook/core/init/exception/exception_models/not_found_exception.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("custom_exception_test", () {

    var a = NotFoundException(ExceptionEventTypes.NOT_VALID_ACCESS_TOKEN,
        errorDetailCode:
            ExceptionErrorCodeCostants.D_REFRESH_TOKEN_NOT_CREATED_OR_SAVED,
        errorDescription: "hata fırladı buralar yarağı yedi");
    print("base code : " + a.errorBase);
    print("topic code : " + a.errorTopic);
    print("detail code : " + a.errorDetail);
    print(a.toString());

    expect(a.errorDetail,
        ExceptionErrorCodeCostants.D_REFRESH_TOKEN_NOT_CREATED_OR_SAVED);
  });
}
