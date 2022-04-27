import 'package:flutter_notebook/core/constants/app/app_constant.dart';

import 'ife_cache_service.dart';

mixin ICacheManager implements ICacheService {
  final String cacheFoldername = ApplicationConstants.CACHE_FOLDER_NAME;
  final String cacheAuthenticationName =
      ApplicationConstants.CACHE_AUTHENTICATION_NAME;
}
