import 'package:get_it/get_it.dart';
import '../api/api_services.dart';
import '../../features/home/data/repositories/characters_repo_impl.dart';

final GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt.registerSingleton<ApiServices>(ApiServices());

  getIt.registerSingleton<CharactersRepoImpl>(CharactersRepoImpl(apiServices: getIt.get<ApiServices>()));
}
