import '../../../constants/app/app_constant.dart';
import '../../../extension/cache_extension.dart';
import '../../../constants/enum/cache/caching_keys_enum.dart';
import 'ife_cache_service.dart';

mixin ICacheManager implements ICacheService {
  final String cacheFoldername = ApplicationConstants.CACHE_FOLDER_NAME;
  final String cacheAuthenticationName =
      ApplicationConstants.CACHE_AUTHENTICATION_NAME;

  // util metods ...
  String getTokenSearchItem(String? email, CachingKeys key) {
    var tokenSearchItem = email != null ? key.toRaw + "--" + email : key.toRaw;
    return tokenSearchItem;
  }
}
