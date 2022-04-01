import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:language_l10n_test/l10n/L10n.dart';
import 'package:language_l10n_test/providers/language_provider.dart';
import 'package:provider/provider.dart';

import 'language_flag.dart';
import 'language_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LanguageProvider>(context,listen: false);
    var language = L10n.getCountryName(provider.locale.languageCode);
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)?.title ?? ''),
        centerTitle: true,
        leading: const LanguageFlagWidget(),
        actions: const [LanguagePickerWidget()],
      ),
      body: Center(
        child: Column(
          children: [
            Text(AppLocalizations.of(context)?.invitation_message ?? ""),
            Text(
              AppLocalizations.of(context)?.greeting('Alfi') ?? '',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            // Flag.fromCode(FlagsCode.US,width: 100,height: 100,fit: BoxFit.cover,)
            Center(
              child: Text(AppLocalizations.of(context)?.language(language) ?? ''),
            )
          ],
        ),
      ),
    );
  }
}
