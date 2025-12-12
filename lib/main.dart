import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:untitled/features/auth/presentation/pages/login_page.dart';
import 'package:untitled/init_dependencies.dart';
import 'core/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Make changes in this part to change the Database from supabse to firebase
  await initDependecies();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) => serviceLocator<AuthBloc>(),
      ),
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