import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:metadent/blocs/auth_bloc.dart';
import 'package:metadent/providers/resources/authRepository.dart';
import 'src/ui/homePage.dart';
import 'package:metadent/src/ui/account.dart';
import 'package:metadent/src/ui/communications.dart';
import 'package:metadent/src/ui/invoicesPage.dart';
import 'package:metadent/src/ui/notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'src/ui/theme/pallete.dart';
import 'package:metadent/src/ui/login.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:metadent/routes.dart' as routes;

var localizedString =
    AppLocalizations.of(NavigationService.navigatorKey.currentContext!);

class App extends StatefulWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  AuthRepository authRepository = AuthRepository();
  late AuthBloc authBloc;

  MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map<int, Color> swatch = {};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }


  @override
  void initState() {
    authBloc = AuthBloc(authRepository: authRepository);
    authBloc.add(AppStarted());
    super.initState();
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    int pageIndex = 0;
    // SystemChrome.setSystemUIOverlayStyle(
    //     SystemUiOverlayStyle(
    //
    //         statusBarColor: Color(0xFFFF782E)
    //     )
    // );
    Future<bool> isLoggedIn() async {
      return await const FlutterSecureStorage().containsKey(key: 'token');
    }

    // bool userLoggedIn = isLoggedIn() ;
    final pages = [
      const Communications(),
      const InvoicesPage(),
      const Notifications(),
      const Account()
    ];

    // return MaterialApp(
    //   title: 'MetaDent',
    //   theme: ThemeData(
    //     primarySwatch: createMaterialColor(Color(0xFFFF782E)),
    //     colorScheme: const ColorScheme(
    //       primary: Color(0xFFFF782E),
    //       onPrimary: Colors.white,
    //       secondary: Color(0xFF0A2139),
    //       onSecondary: Colors.white,
    //       surface: Colors.white,
    //       onSurface: Color(0xFF0A2139),
    //       onBackground: Color(0xFF0A2139),
    //       background: Colors.white,
    //       brightness: Brightness.light,
    //       error: Colors.red,
    //       onError: Colors.white,
    //
    //     ),
    //
    //     primaryColor: const Color(0xFFFF782E),
    //     accentColor: Color(0xFF0A2139),
    //     backgroundColor: const Color(0xFFFFF4EF),
    //
    //     fontFamily: 'Source Sans Pro',
    //     textTheme: const TextTheme(
    //       titleSmall: TextStyle(
    //         fontFamily: 'Source Sans Pro',
    //         color: const Color(0xFF0A2139),
    //         fontSize: 20,
    //       ),
    //       titleMedium: TextStyle(
    //         fontFamily: 'Montserrat',
    //         color: Color(0xFF0A2139),
    //         fontSize: 24,
    //       ),
    //       displaySmall: TextStyle(
    //         fontFamily: 'Source Sans Pro',
    //         color: Colors.white,
    //         fontSize: 20,
    //         fontWeight: FontWeight.w700
    //       ),
    //       displayLarge: TextStyle(
    //         fontFamily: 'Montserrat',
    //         color: Colors.white,
    //         fontSize: 40,
    //         fontWeight: FontWeight.w200,
    //       ),
    //       labelMedium: TextStyle(
    //         fontFamily: 'Source Sans Pro',
    //         color: Color(0xFF0A2139),
    //         fontSize: 20,
    //         fontWeight: FontWeight.bold,
    //       ),
    //       labelSmall: TextStyle(
    //         fontFamily: 'Source Sans Pro',
    //         color:Color(0xFF0A2139),
    //         fontSize: 16,
    //         fontWeight: FontWeight.bold,
    //       ),
    //       labelLarge: TextStyle(
    //         fontFamily: 'Source Sans Pro',
    //         fontSize: 34,
    //         fontWeight: FontWeight.normal,
    //         color: Color(0xFFFF782E)
    //       ),
    //     ),
    //     dividerTheme: DividerThemeData(
    //       thickness: 1,
    //       color: Theme.of(context).hintColor,
    //       indent: 80,
    //       endIndent: 16,
    //     )
    //   ),
    //   onGenerateRoute: routes.controller,
    //   initialRoute: routes.homePage,
    // );

    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_) {
          return MaterialApp(
            title: 'MetaDent',
            navigatorKey: NavigationService.navigatorKey,
            debugShowCheckedModeBanner: false,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            theme: ThemeData(
                primarySwatch: createMaterialColor(const Color(0xFFFF782E)),
                colorScheme: const ColorScheme(
                  primary: Color(0xFFFF782E),
                  onPrimary: Colors.white,
                  secondary: Color(0xFF0A2139),
                  onSecondary: Colors.white,
                  surface: Colors.white,
                  onSurface: Color(0xFF0A2139),
                  onBackground: Color(0xFF0A2139),
                  background: Colors.white,
                  brightness: Brightness.light,
                  error: Colors.red,
                  onError: Colors.white,
                ),
                appBarTheme: const AppBarTheme(brightness: Brightness.dark),
                primaryColor: const Color(0xFFFF782E),
                accentColor: const Color(0xFF0A2139),
                backgroundColor: const Color(0xFFFFF4EF),
                fontFamily: 'Source Sans Pro',
                textTheme: TextTheme(
                  titleSmall: TextStyle(
                    fontFamily: 'Source Sans Pro',
                    color: const Color(0xFF0A2139),
                    fontSize: ScreenUtil().setSp(20),
                  ),
                  titleMedium: TextStyle(
                    fontFamily: 'Montserrat',
                    color: const Color(0xFF0A2139),
                    fontSize: ScreenUtil().setSp(24),
                  ),
                  displaySmall: TextStyle(
                      fontFamily: 'Source Sans Pro',
                      color: Colors.white,
                      fontSize: ScreenUtil().setSp(18),
                      fontWeight: FontWeight.w700),
                  displayLarge: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Colors.white,
                    fontSize: ScreenUtil().setSp(36),
                    fontWeight: FontWeight.w200,
                  ),
                  labelMedium: TextStyle(
                    fontFamily: 'Source Sans Pro',
                    color: const Color(0xFF0A2139),
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  labelSmall: TextStyle(
                    fontFamily: 'Source Sans Pro',
                    color: const Color(0xFF0A2139),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  labelLarge: TextStyle(
                      fontFamily: 'Source Sans Pro',
                      fontSize: 24.sp,
                      fontWeight: FontWeight.normal,
                      color: const Color(0xFFFF782E)),
                  headlineSmall: TextStyle(
                    fontFamily: 'Source Sans Pro',
                    color: const Color(0xFF0A2139),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  headlineLarge: TextStyle(
                    fontFamily: 'Source Sans Pro',
                    color: const Color(0xFF0A2139),
                    fontSize: 36.sp,
                    fontWeight: FontWeight.normal,
                  ),
                  bodyMedium: TextStyle(
                    fontFamily: 'Source Sans Pro',
                    color: Theme.of(context).hintColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                dividerTheme: DividerThemeData(
                  thickness: 1,
                  color: Theme.of(context).hintColor,
                  indent: 80.w,
                  endIndent: 16.w,
                )),
            onGenerateRoute: routes.controller,
            // home: RepositoryProvider(
            //   create: (context) => AuthRepository(),
            //   child: const Login(),
            // ),
            home: RepositoryProvider(
              create: (context) => AuthRepository(),
              child: BlocBuilder<AuthBloc, AuthState>(
                builder: (BuildContext context, AuthState state) {
                  if (kDebugMode) {
                    print("state is $state");
                  }
                  if(state is AuthUninitialized){
                    context.read<AuthBloc>().add(AppStarted());
                  }
                  if (state is AuthAuthenticated) {
                    return const HomePage();
                  } else {
                    return const Login();
                  }
                },
              ),
            ),
          );
        });
  }
}

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}
