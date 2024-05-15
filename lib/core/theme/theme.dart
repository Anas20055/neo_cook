part of '../../main.dart';

ThemeData _theme() {
  return ThemeData(
    fontFamily: 'Poppins',
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: const MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(41),
            ),
          ),
        ),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (states) {
            if (states.contains(MaterialState.disabled)) {
              return const Color.fromRGBO(215, 215, 215, 1);
            }
            return AppColors.orange;
          },
        ),
        foregroundColor: MaterialStateProperty.resolveWith<Color>(
          (states) {
            if (states.contains(MaterialState.disabled)) {
              return Colors.grey;
            }
            return Colors.white;
          },
        ),
        overlayColor: MaterialStatePropertyAll(Colors.grey.withOpacity(0.1)),
        textStyle: const MaterialStatePropertyAll(
          TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
        minimumSize: const MaterialStatePropertyAll(
          Size(double.maxFinite, 0),
        ),
        padding: const MaterialStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        shape: const MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
        ),
        foregroundColor: MaterialStateProperty.all<Color>(
          Colors.black,
        ),
        minimumSize: const MaterialStatePropertyAll(
          Size(double.maxFinite, 0),
        ),
        padding: const MaterialStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        ),
        overlayColor: const MaterialStatePropertyAll(Colors.grey),
        textStyle: const MaterialStatePropertyAll(
          TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    ),
    appBarTheme: _appBarThem(),
    colorScheme: const ColorScheme.light(),
    textTheme: const TextTheme(
      labelLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w500,
      ),
      labelMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      labelSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      headlineLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w300,
        color: Colors.white,
      ),
      headlineMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: AppColors.orange,
      ),
    ),
  );
}

AppBarTheme _appBarThem() {
  return const AppBarTheme(
    centerTitle: true,
    scrolledUnderElevation: 0,
    titleTextStyle: TextStyle(
      fontSize: 16,
      color: Colors.black,
      fontWeight: FontWeight.w500,
    ),
    elevation: 0,
  );
}
