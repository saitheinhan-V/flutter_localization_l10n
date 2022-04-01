import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:language_l10n_test/app.dart';
import 'package:language_l10n_test/l10n/L10n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:language_l10n_test/providers/language_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   return MultiProvider(
       providers: [
         ChangeNotifierProvider(create: (_) => LanguageProvider()),
       ],
     child: Consumer<LanguageProvider>(
       builder: (context, provider, snapshot){
         return  MaterialApp(
           title: 'Flutter Demo',
           theme: ThemeData(
             primarySwatch: Colors.blue,
           ),
           home: const Home(),
           debugShowCheckedModeBanner: false,
           supportedLocales: const [
              Locale('en'),
              Locale('ja'),
              Locale('ar'),
              Locale('my'),
           ],
           localizationsDelegates: const [
             // add this code
             AppLocalizations.delegate,
             GlobalMaterialLocalizations.delegate,
             GlobalCupertinoLocalizations.delegate,
             GlobalWidgetsLocalizations.delegate
           ],
           locale: provider.locale,
         );
       },
     ),
   );
  }
}

