# language_l10n_test

Flutter language localization using flutter_localization package (L10n).


#Package usage
1.  flutter_localizations:
        sdk: flutter 
2.  provider

## Step by Step
1. create .arb file (Tools > flutter intl > initialize for the project)
   
2. create custom l10n.yaml >>
   arb-dir: lib/l10n
   template-arb-file: intl_en.arb
   output-localization-file: app_localizations.dart
   
3. create provider for language change
   class LanguageProvider extends ChangeNotifier {
        Locale _locale = const Locale('en');

        Locale get locale => _locale;

        void updateLanguage(Locale locale) {
        _locale = locale;
        notifyListeners();
                }
        }
   
4. add below field to Main.dart
   localizationsDelegates: const [
        AppLocalizations.delegate, //import 'package:flutter_gen/gen_l10n/app_localizations.dart';//output-localization-file
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
        ],
   supportedLocales: const [ //call your custom here
        Locale('en'),
        Locale('ja'),
        Locale('ar'),
        Locale('my'),
        ],
   locale: provider.locale
   - Note:: [ use Consumer<Provider> to get provider.locale ]
        
5. use String like this:
        Text(AppLocalizations.of(context)?.homeTitle ?? "Home");
   
