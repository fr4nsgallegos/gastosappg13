import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gastosappg13/generated/l10n.dart';
import 'package:gastosappg13/pages/db_example_page.dart';
import 'package:gastosappg13/pages/home_page.dart';

void main() {
  runApp(
    MaterialApp(
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
