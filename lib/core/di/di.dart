import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:newsouq_merchant/features/inventory/data/apis/add_product_api_service.dart';
import 'package:newsouq_merchant/features/inventory/data/repos/add_product_repo_imp.dart';
import 'package:newsouq_merchant/features/inventory/presentation/cubit/add_product_cubit.dart';
import 'package:newsouq_merchant/features/login/data/apis/login_api_service.dart';
import 'package:newsouq_merchant/features/login/data/repos/login_repo_imp.dart';
import 'package:newsouq_merchant/features/login/presentation/cubit/login_cubit.dart';
import 'package:newsouq_merchant/features/signup/data/apis/signup_api_service.dart';
import 'package:newsouq_merchant/features/signup/data/repos/signup_repo_imp.dart';
import 'package:cloudinary_url_gen/cloudinary.dart';
import 'package:newsouq_merchant/features/signup/presentation/cubit/signup_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Firebase Auth
  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);

  // Firebase Firestore
  getIt.registerLazySingleton<FirebaseFirestore>(
    () => FirebaseFirestore.instance,
  );

  // Signup
  getIt.registerLazySingleton<SignupApiService>(
    () => SignupApiService(
      auth: getIt<FirebaseAuth>(),
      firestore: getIt<FirebaseFirestore>(),
    ),
  );
  getIt.registerLazySingleton<SignupRepoImp>(
    () => SignupRepoImp(signupApiService: getIt<SignupApiService>()),
  );
  getIt.registerFactory<SignupCubit>(
    () => SignupCubit(signupRepoImp: getIt<SignupRepoImp>()),
  );

  // Login
  getIt.registerLazySingleton<LoginApiService>(
    () => LoginApiService(
      auth: getIt<FirebaseAuth>(),
      firestore: getIt<FirebaseFirestore>(),
    ),
  );
  getIt.registerLazySingleton<LoginRepoImp>(
    () => LoginRepoImp(loginApiService: getIt<LoginApiService>()),
  );
  getIt.registerFactory<LoginCubit>(
    () => LoginCubit(loginRepoImp: getIt<LoginRepoImp>()),
  );

  // cloudinary object
  getIt.registerLazySingleton<Cloudinary>(
    () => Cloudinary.fromStringUrl(
      'cloudinary://389364851217256:cbBpwEs-4RrWns10zx0Gj3bXO3w@dg1wipov1',
    ),
  );

  // Add Product
  getIt.registerLazySingleton<AddProductApiService>(
    () => AddProductApiService(
      firestore: getIt<FirebaseFirestore>(),
      cloudinary: getIt<Cloudinary>(),
    ),
  );
  getIt.registerLazySingleton<AddProductRepoImp>(
    () =>
        AddProductRepoImp(addProductApiService: getIt<AddProductApiService>()),
  );
  getIt.registerFactory<AddProductCubit>(
    () => AddProductCubit(addProductRepoImp: getIt<AddProductRepoImp>()),
  );
}
