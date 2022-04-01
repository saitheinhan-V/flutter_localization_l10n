import 'package:flutter/material.dart';

class L10n {
  static final all = [
    const Locale('en'),
    const Locale('ja'),
    const Locale('ar'),
    const Locale('my'),
  ];

  static String getFlag(String countryCode) {
    /*switch (countryCode) {
      case 'ja':
        return '🇯🇵';
      case 'ar':
        return '🇵🇸';
      case 'my':
        return 'MY';
      default:
        return '🇺🇸';
    }*/

    switch (countryCode) {
      case 'ja':
        return 'icons/flags/png/2.5x/jp.png';
      case 'en':
        return 'icons/flags/png/2.5x/us.png';
      case 'my':
        return 'icons/flags/png/2.5x/mm.png';
      default:
        return 'icons/flags/png/2.5x/$countryCode.png';
    }
  }

  static String getCountryName(String countryCode) {
    switch (countryCode) {
      case 'ja':
        return 'Japan';
      case 'ar':
        return 'Palestine';
      case 'my':
        return 'Myanmar';
      default:
        return 'United States';
    }
  }
}


