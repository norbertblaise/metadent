import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:metadent/providers/resources/authRepository.dart';
import 'app.dart';
import 'blocs/auth_bloc.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  WidgetsFlutterBinding.ensureInitialized();

    var isLoggedIn =  await const FlutterSecureStorage().containsKey(key: 'token');

  runApp(
      RepositoryProvider(
        create: (context) => AuthRepository(),
        child: MultiBlocProvider(providers: [
          BlocProvider(
            create: (context) => AuthBloc(
                authRepository: context.read<AuthRepository>()),
          ),


        ], child: const App()),
      ),
      // const App()
  );
}

