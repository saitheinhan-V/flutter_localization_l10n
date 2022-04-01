import 'package:flag/flag.dart';
import 'package:flag/flag_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:language_l10n_test/home_page.dart';
import 'package:language_l10n_test/language_flag.dart';
import 'package:language_l10n_test/language_picker.dart';
import 'package:language_l10n_test/setting_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var selectedIndex = 0;

  List<Widget> pages = [
    HomePage(), SettingPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              label: AppLocalizations.of(context)?.homeTitle ?? "Home",
              icon: const Icon(
                Icons.home,
              ),
            ),
            BottomNavigationBarItem(
              label: AppLocalizations.of(context)?.settingTitle ?? "Setting",
              icon: const Icon(
                Icons.settings,
              ),
            ),
          ]),
    );
  }
}
