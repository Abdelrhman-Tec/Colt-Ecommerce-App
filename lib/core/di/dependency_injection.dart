import 'package:colt_ecommerce_app/core/databases/firebase/firebase_service.dart';
import 'package:get_it/get_it.dart';
import 'package:colt_ecommerce_app/features/auth/presentation/cubit/auth_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Services
  getIt.registerLazySingleton<FirebaseAuthService>(() => FirebaseAuthService());

  // Cubits / Blocs
  getIt.registerFactory<AuthCubit>(
    () => AuthCubit(getIt<FirebaseAuthService>()),
  );
}
