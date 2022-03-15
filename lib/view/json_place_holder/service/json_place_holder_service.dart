import '../../../product/base/ife_base_service.dart';
import '../../../core/constants/enum/http_request_types_enum.dart';
import '../model/comment_model.dart';

class JsonPlaceHolderService extends IBaseService {
  Future<CommentModel?>? getAllComments() {
    final response = networkService
        .fetch<CommentModel, CommentModel>(
            "https://jsonplaceholder.typicode.com/comments",
            type: HttpRequestTypes.GET,
            parseModel: CommentModel())
        .then((value) => value);

    if (response is CommentModel) {
      return response.then((value) => value.data);
    } else {
      return null;
    }
  }
}
