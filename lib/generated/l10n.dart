// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// ` `
  String get whiteSpace {
    return Intl.message(
      ' ',
      name: 'whiteSpace',
      desc: '',
      args: [],
    );
  }

  /// `see more`
  String get seeMore {
    return Intl.message(
      'see more',
      name: 'seeMore',
      desc: '',
      args: [],
    );
  }

  /// `less`
  String get seeLess {
    return Intl.message(
      'less',
      name: 'seeLess',
      desc: '',
      args: [],
    );
  }

  /// `...`
  String get ellipsis {
    return Intl.message(
      '...',
      name: 'ellipsis',
      desc: '',
      args: [],
    );
  }

  /// `Apple Sign In`
  String get loginAppleButton {
    return Intl.message(
      'Apple Sign In',
      name: 'loginAppleButton',
      desc: '',
      args: [],
    );
  }

  /// `Google Sign In`
  String get loginGoogleButton {
    return Intl.message(
      'Google Sign In',
      name: 'loginGoogleButton',
      desc: '',
      args: [],
    );
  }

  /// `Lupe Trips`
  String get loginTitle {
    return Intl.message(
      'Lupe Trips',
      name: 'loginTitle',
      desc: '',
      args: [],
    );
  }

  /// `Share easily your experiencies around\nthe world with your travel mates`
  String get loginSubtitle {
    return Intl.message(
      'Share easily your experiencies around\nthe world with your travel mates',
      name: 'loginSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Hi `
  String get homeAppbarTitle {
    return Intl.message(
      'Hi ',
      name: 'homeAppbarTitle',
      desc: '',
      args: [],
    );
  }

  /// `Another adventure you want to share?`
  String get homeTitle {
    return Intl.message(
      'Another adventure you want to share?',
      name: 'homeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Looking for travel mates?`
  String get homeSearchInputHing {
    return Intl.message(
      'Looking for travel mates?',
      name: 'homeSearchInputHing',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get homeTab1Label {
    return Intl.message(
      'Home',
      name: 'homeTab1Label',
      desc: '',
      args: [],
    );
  }

  /// `Create`
  String get homeTab2Label {
    return Intl.message(
      'Create',
      name: 'homeTab2Label',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get homeTab3Label {
    return Intl.message(
      'Profile',
      name: 'homeTab3Label',
      desc: '',
      args: [],
    );
  }

  /// `Trip details`
  String get tripDetailsPageLabel {
    return Intl.message(
      'Trip details',
      name: 'tripDetailsPageLabel',
      desc: '',
      args: [],
    );
  }

  /// `Admin`
  String get tripDetailsAdmin {
    return Intl.message(
      'Admin',
      name: 'tripDetailsAdmin',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'es'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
