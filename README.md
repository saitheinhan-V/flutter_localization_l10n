# language_l10n_test

Flutter language localization using flutter_localization package (L10n).


#Package usage
1.  flutter_localizations:
        sdk: flutter 
2.  provider

## Step by Step
1. create .arb file (Tools > flutter intl > initialize for the project)
   
2. create custom l10n.yaml >> <br/>
   arb-dir: lib/l10n <br/>
   template-arb-file: intl_en.arb <br/>
   output-localization-file: app_localizations.dart <br/>
   
3. create provider for language change <br/>
   
   class LanguageProvider extends ChangeNotifier { 
        Locale _locale = const Locale('en');

        Locale get locale => _locale;

        void updateLanguage(Locale locale) {
        _locale = locale;
        notifyListeners();
                }
        }
   
4. add below field to Main.dart <br/>
   localizationsDelegates: const [ <br/>
        AppLocalizations.delegate,<br/> //import 'package:flutter_gen/gen_l10n/app_localizations.dart';//output-localization-file <br/>
        GlobalMaterialLocalizations.delegate, <br/>
        GlobalCupertinoLocalizations.delegate, <br/>
        GlobalWidgetsLocalizations.delegate <br/>
        ], <br/>
   supportedLocales: const [ <br/>
   //call your custom here <br/>
        Locale('en'),<br/>
        Locale('ja'), <br/>
        Locale('ar'), <br/>
        Locale('my'), <br/>
        ], <br/>
   locale: provider.locale
   - Note:: [ use Consumer<Provider> to get provider.locale ]
        
5. use String like this: <br/>
        Text(AppLocalizations.of(context)?.homeTitle ?? "Home");
   
