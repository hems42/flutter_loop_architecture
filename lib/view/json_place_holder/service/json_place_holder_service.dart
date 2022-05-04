import 'package:flutter_notebook/core/base/model/concrete/response_model.dart';
import '../../../core/constant/enum/network/http_request_types_enum.dart';
import '../../../product/base/ife_base_product_service.dart';
import '../model/comment_model.dart';

class JsonPlaceHolderService extends IBaseProductService {
  Future<List<CommentModel>> getAllComments() async {
    final response =
        await networkService.fetch<List<CommentModel>, CommentModel>(
            "https://jsonplaceholder.typicode.com/comments",
            type: HttpRequestTypes.GET,
            parseModel: CommentModel());

    return (response as ResponseModel).data;
  }
}
