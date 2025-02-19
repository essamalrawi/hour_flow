import 'package:get_it/get_it.dart';

import 'package:hour_flow/core/services/firestore_service.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<FireStoreService>(FireStoreService());
}
