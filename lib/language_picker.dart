import 'package:flag/flag.dart';
import 'package:flag/flag_widget.dart';
import 'package:flutter/material.dart';
import 'package:language_l10n_test/providers/language_provider.dart';
import 'package:provider/provider.dart';

import 'l10n/L10n.dart';

class LanguagePickerWidget extends StatefulWidget {
  const LanguagePickerWidget({Key? key}) : super(key: key);

  @override
  _LanguagePickerWidgetState createState() => _LanguagePickerWidgetState();
}

class _LanguagePickerWidgetState extends State<LanguagePickerWidget> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LanguageProvider>(context, listen: false);
    return PopupMenuButton<String>(
        initialValue: provider.locale.countryCode,
        onSelected: (countryCode) {
          provider.updateLanguage(Locale(countryCode));
        },
        icon: const Icon(
          Icons.translate,
          size: 24.0,
        ),
        itemBuilder: (context) {
          return L10n.all.map((locale) {
            String countryName = L10n.getCountryName(locale.languageCode);
            String countryFlag = L10n.getFlag(locale.languageCode);
            print('Country flag >> $countryFlag');
            return PopupMenuItem<String>(
                value: locale.languageCode,
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        countryName,
                        style: TextStyle(
                            fontSize: 16.0,
                            color: (locale.languageCode ==
                                provider.locale.languageCode)
                                ? Colors.blue
                                : Colors.black),
                      ),
                      // Text(
                      //   countryFlag,
                      //   style: const TextStyle(fontSize: 24.0),
                      // ),
                      Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.blueGrey,width: 0.5)
                          ),
                          child:
                          Image.asset(countryFlag, package: 'country_icons',width: 50,height: 30,fit: BoxFit.cover,)
                      ),
                      // Flag.fromCode(FlagsCode.MY,
                      // width: 20,height: 20,fit: BoxFit.fill,)
                    ],
                  ),
                ));
          }).toList();
        });
  }
}