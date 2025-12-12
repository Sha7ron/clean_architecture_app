import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:untitled/features/auth/data/data%20sources/auth_remote_data_source.dart';
import 'package:untitled/features/auth/data/repositories/auth_repository_implementation.dart';
import 'package:untitled/features/auth/domain/usecases/user_sign_up.dart';
import 'package:untitled/features/auth/presentation/bloc/auth_bloc.dart';
import 'core/secrets/app_secrets.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependecies() async {
  _initAuth();
  final supabase = await Supabase.initialize(
      url: AppSecrets.supabsaseUrl,
      anonKey: AppSecrets.supabaseAnnon,
  );
  serviceLocator.registerLazySingleton(() => supabase.client);
}
void _initAuth() {
  serviceLocator.registerFactory<AuthRemoteDataSource>(
          () => AuthRemoteDataSourceImpl(
              serviceLocator()
          ),
  );

  serviceLocator.registerFactory(
      () => AuthRepositoryImpl(
        serviceLocator(),
      ),
  );

  serviceLocator.registerFactory(
        () => UserSignUp(
          serviceLocator(),
        ),
  );
  
  serviceLocator.registerLazySingleton(
          ()=> AuthBloc(
              userSignup: serviceLocator(),
          ),
  );
  
}