import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:untitled/core/secrets/app_secrets.dart';
import 'package:untitled/features/auth/data/data%20sources/auth_remote_data_source.dart';
import 'package:untitled/features/auth/data/repositories/auth_repository_implementation.dart';
import 'package:untitled/features/auth/domain/usecases/user_sign_up.dart';
import 'package:untitled/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:untitled/features/auth/presentation/pages/login_page.dart';
import 'core/theme/theme.dart';
import 'package:untitled/core/secrets/app_secrets.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final supabase = await Supabase.initialize(
      url: AppSecrets.supabsaseUrl,
      anonKey: AppSecrets.supabaseAnnon
  );
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) => AuthBloc(
          userSignup: UserSignUp(
            AuthRepositoryImpl(
              AuthRemoteDataSourceImpl(
                  supabase.client),
            ),
          ),
        ),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ProjApp',
      theme: AppTheme.darkThemeMode,
      home: const LoginPage(),
    );
  }
}