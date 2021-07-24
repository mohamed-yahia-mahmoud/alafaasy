import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:ui';
import 'l10n/messages_all.dart';

class AppLocalization {
  static AppLocalization of(BuildContext context) {
    return Localizations.of<AppLocalization>(context, AppLocalization);
  }

  static Future<AppLocalization> load(Locale locale) {
    final String name =
        locale.countryCode == null ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      return AppLocalization();
    });
  }
  //ibrahim part

  String get home => Intl.message('Home', name: 'home',);
  String get defaultFont => Intl.message('The default font', name: 'defaultFont',);
  String get tjwalFont => Intl.message('Tajwal font', name: 'tjwalFont',);
  String get naskhFont => Intl.message('Nassakh font', name: 'naskhFont',);
  String get sizeFont => Intl.message('Font size', name: 'sizeFont',);
  String get rateApp => Intl.message('Rate App', name: 'rateApp',);
  String get darcula => Intl.message('Dark Mode', name: 'darcula',);
  String get tashkeel => Intl.message('Tashkeel', name: 'tashkeel',);

  String get bookmark => Intl.message('Bookmarks', name: 'bookmark',);
  String get search => Intl.message('Search', name: 'search',);
  String get settings => Intl.message('Settings', name: 'settings',);
  String get bibleBook => Intl.message('الكتاب المقدس', name: 'bibleBook',);
  String get koddassat => Intl.message('القداسات', name: 'koddassat',);
  String get salawaat => Intl.message('الصلوات', name: 'salawaat',);
  String get bookMarks => Intl.message('Bookmarks', name: 'bookMarks',);
  String get lastSearch => Intl.message('Recent searches', name: 'lastSearch',);
  String get marks => Intl.message('BookMarks', name: 'marks',);
  String get image => Intl.message('Image', name: 'image',);
  String get share => Intl.message('Share', name: 'share',);
  String get selectImage => Intl.message('select image', name: 'selectImage',);
  String get chooseImage => Intl.message('Confirm', name: 'chooseImage',);
  String get fontType => Intl.message('Font Type', name: 'fontType',);
  String get fontAdjust => Intl.message('Font Adjust', name: 'fontAdjust',);
  String get fontColor => Intl.message('Font Color', name: 'fontColor',);
  String get imageSize => Intl.message('Image Size', name: 'imageSize',);
  String get editImage => Intl.message('Edit Image', name: 'editImage',);
  String get transparency => Intl.message('Transparency', name: 'transparency',);
  String get blury => Intl.message('Blur', name: 'blury',);
  String get images => Intl.message('Images', name: 'images',);
  String get save_share => Intl.message('Save and Share', name: 'save_share',);
  String get searchHint => Intl.message('search ...', name: 'searchHint',);








}

class SpecificLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalization> {
  final Locale overriddenLocale;
  SpecificLocalizationsDelegate(this.overriddenLocale);

  @override
  bool isSupported(Locale locale) => this.overriddenLocale != null;

  @override
  Future<AppLocalization> load(Locale locale) =>
      AppLocalization.load(this.overriddenLocale);

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalization> old) => true;
}
