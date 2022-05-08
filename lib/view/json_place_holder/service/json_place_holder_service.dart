import '../../../core/base/model/concrete/response_model.dart';
import '../../../product/util/mixin/product_mixin_network_service.dart';
import '../../../core/constant/enum/network/http_request_types_enum.dart';
import '../model/comment_model.dart';

class JsonPlaceHolderService with ProductMixinNetwokService {
  Future<List<CommentModel>> getAllComments() async {
    final response =
        await networkService.fetch<List<CommentModel>, CommentModel>(
            "https://jsonplaceholder.typicode.com/comments",
            type: HttpRequestTypesEnum.GET,
            parseModel: CommentModel());

    return (response as ResponseModel).data;
  }
}
