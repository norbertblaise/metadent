import 'package:flutter/material.dart';
import 'src/ui/homePage.dart';
import 'package:metadent/src/ui/account.dart';
import 'package:metadent/src/ui/communications.dart';
import 'package:metadent/src/ui/invoices.dart';
import 'package:metadent/src/ui/notifications.dart';
import 'src/ui/theme/pallete.dart';
import 'package:metadent/src/ui/login.dart';
import 'package:metadent/routes.dart' as routes;

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    int pageIndex = 0;

    final pages = [
      const Communications(),
      const Invoices(),
      const Notifications(),
      const Account()
    ];

    return MaterialApp(
      title: 'MetaDent',
      theme: ThemeData(
        primarySwatch: createMaterialColor(Color(0xFFFF782E)),
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

        primaryColor: const Color(0xFFFF782E),
        accentColor: Color(0xFF0A2139),
        backgroundColor: const Color(0xFFFFF4EF),

        fontFamily: 'Source Sans Pro',
        textTheme: const TextTheme(
          titleSmall: TextStyle(
            fontFamily: 'Source Sans Pro',
            color: const Color(0xFF0A2139),
            fontSize: 20,
          ),
          titleMedium: TextStyle(
            fontFamily: 'Montserrat',
            color: Color(0xFF0A2139),
            fontSize: 24,
          ),
          displaySmall: TextStyle(
            fontFamily: 'Source Sans Pro',
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w700
          ),
          displayLarge: TextStyle(
            fontFamily: 'Montserrat',
            color: Colors.white,
            fontSize: 40,
            fontWeight: FontWeight.w200,
          ),
          labelMedium: TextStyle(
            fontFamily: 'Source Sans Pro',
            color: Color(0xFF0A2139),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          labelSmall: TextStyle(
            fontFamily: 'Source Sans Pro',
            color:Color(0xFF0A2139),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          labelLarge: TextStyle(
            fontFamily: 'Source Sans Pro',
            fontSize: 34,
            fontWeight: FontWeight.normal,
            color: Color(0xFFFF782E)
          ),
        ),
        dividerTheme: DividerThemeData(
          thickness: 1,
          color: Theme.of(context).hintColor,
          indent: 80,
          endIndent: 16,
        )
      ),
      onGenerateRoute: routes.controller,
      initialRoute: routes.homePage,
    );
  }
}
