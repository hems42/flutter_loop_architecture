import '../../../core/constants/enum/http_request_types_enum.dart';
import '../../../core/init/network/abstract/ife_network_service.dart';
import '../../../core/init/network/concrete/network_service.dart';
import '../model/coment_model.dart';

class JsonPlaceHolderService {
  final INetworService networkService = NetworkService.instance;

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
