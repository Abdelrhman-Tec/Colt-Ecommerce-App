import 'package:colt_ecommerce_app/core/connection/network_info.dart';
import 'package:colt_ecommerce_app/core/networking/api/api_services.dart';
import 'package:colt_ecommerce_app/core/networking/api/dio_factory.dart';
import 'package:colt_ecommerce_app/core/networking/firebase/firebase_service.dart';
import 'package:colt_ecommerce_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:colt_ecommerce_app/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:colt_ecommerce_app/features/categories/data/repo/categories_repo.dart';
import 'package:colt_ecommerce_app/features/categories/presentation/cubit/categories_cubit.dart';
import 'package:colt_ecommerce_app/features/products/data/repo/products_repo.dart';
import 'package:colt_ecommerce_app/features/products/presentation/cubit/products_cubit.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio
  Dio dio = await DioFactory.getDio();
  getIt.registerLazySingleton<Dio>(() => dio);

  // Services
  getIt.registerLazySingleton<FirebaseAuthService>(() => FirebaseAuthService());

  // Network
  getIt.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(DataConnectionChecker()),
  );

  // API
  getIt.registerLazySingleton<ApiServices>(() => ApiServices(getIt<Dio>()));

  // Repos
  getIt.registerLazySingleton<ProductsRepo>(
    () => ProductsRepo(apiServices: getIt<ApiServices>()),
  );
  getIt.registerLazySingleton<CategoriesRepo>(
    () => CategoriesRepo(apiServices: getIt<ApiServices>()),
  );

  // Cubits
  getIt.registerFactory<ProductsCubit>(
    () => ProductsCubit(getIt<ProductsRepo>()),
  );
  getIt.registerFactory<CategoriesCubit>(
    () => CategoriesCubit(getIt<CategoriesRepo>()),
  );

  getIt.registerFactory<AuthCubit>(
    () => AuthCubit(getIt<FirebaseAuthService>()),
  );

  // CartCubit singleton
  getIt.registerLazySingleton<CartCubit>(() => CartCubit());
}
