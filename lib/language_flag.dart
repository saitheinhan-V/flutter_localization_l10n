import 'package:flutter/material.dart';
import 'package:language_l10n_test/providers/language_provider.dart';
import 'package:provider/provider.dart';

import 'l10n/L10n.dart';

class LanguageFlagWidget extends StatelessWidget {
  const LanguageFlagWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageProvider>(
      builder: (context, value, child) {
        String countryFlag = L10n.getFlag(value.locale.languageCode);
        return Center(
          child: SizedBox(
              height: 50.0,
              width: 50.0,
              child: Image.asset(
                countryFlag,
                package: 'country_icons',
                width: 50,
                height: 30,
              )),
          /*Text(
          L10n.getFlag(value.locale.languageCode),
          style: const TextStyle(fontSize: 24.0),
        ),*/
        );
      },
    );
  }
}
