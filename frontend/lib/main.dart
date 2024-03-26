import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ppk/UI/auth/sign_up.dart';

class AdaptiveTextSize {
  const AdaptiveTextSize();

  getadaptiveTextSize(BuildContext context, dynamic value) {
    return (value / 932) * MediaQuery.of(context).size.height;
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        indicatorColor: Color(0xff292D32),
        primaryColor: Color(0xff453643),
        errorColor: Color(0xffF26C43),
        backgroundColor: Color(0xfffef4e8),
        useMaterial3: true,
        textTheme: TextTheme(
          titleLarge: GoogleFonts.mPlusRounded1c().copyWith(
            fontSize: AdaptiveTextSize().getadaptiveTextSize(context, 48),
            color: Color(0xff453643),
            fontWeight: FontWeight.w900
          ),
          bodyLarge: GoogleFonts.mPlusRounded1c().copyWith(
              fontSize: AdaptiveTextSize().getadaptiveTextSize(context, 25),
              color: Color(0xff7C808D)
          ),
          bodyMedium: GoogleFonts.mPlusRounded1c().copyWith(
              fontSize: AdaptiveTextSize().getadaptiveTextSize(context, 30),
              color: Color(0xff453643),
            fontWeight: FontWeight.w500
          ),
          bodySmall:GoogleFonts.mPlusRounded1c().copyWith(
              fontSize: AdaptiveTextSize().getadaptiveTextSize(context, 23),
              color: Color(0xab73666c),
              fontWeight: FontWeight.w600
          ),
        )
      ),
      home: SignUp(),
    );
  }
}

