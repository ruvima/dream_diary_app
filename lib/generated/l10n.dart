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

  /// `Email:`
  String get emailLabel {
    return Intl.message(
      'Email:',
      name: 'emailLabel',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email`
  String get enterEmailHint {
    return Intl.message(
      'Enter your email',
      name: 'enterEmailHint',
      desc: '',
      args: [],
    );
  }

  /// `Password:`
  String get passwordLabel {
    return Intl.message(
      'Password:',
      name: 'passwordLabel',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get enterPasswordHint {
    return Intl.message(
      'Enter your password',
      name: 'enterPasswordHint',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get signIn {
    return Intl.message(
      'Sign In',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with:`
  String get signInWith {
    return Intl.message(
      'Sign in with:',
      name: 'signInWith',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account yet? Register now!`
  String get registerNow {
    return Intl.message(
      'Don\'t have an account yet? Register now!',
      name: 'registerNow',
      desc: '',
      args: [],
    );
  }

  /// `Forgot your password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot your password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `My Dreams`
  String get myDreams {
    return Intl.message(
      'My Dreams',
      name: 'myDreams',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get homeLabel {
    return Intl.message(
      'Home',
      name: 'homeLabel',
      desc: '',
      args: [],
    );
  }

  /// `Analysis`
  String get analysisLabel {
    return Intl.message(
      'Analysis',
      name: 'analysisLabel',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get searchLabel {
    return Intl.message(
      'Search',
      name: 'searchLabel',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settingsLabel {
    return Intl.message(
      'Settings',
      name: 'settingsLabel',
      desc: '',
      args: [],
    );
  }

  /// `Title:`
  String get dreamTitleLabel {
    return Intl.message(
      'Title:',
      name: 'dreamTitleLabel',
      desc: '',
      args: [],
    );
  }

  /// `Description:`
  String get dreamDescriptionLabel {
    return Intl.message(
      'Description:',
      name: 'dreamDescriptionLabel',
      desc: '',
      args: [],
    );
  }

  /// `Clarity:`
  String get dreamClarityLabel {
    return Intl.message(
      'Clarity:',
      name: 'dreamClarityLabel',
      desc: '',
      args: [],
    );
  }

  /// `Dream Type:`
  String get dreamTypeLabel {
    return Intl.message(
      'Dream Type:',
      name: 'dreamTypeLabel',
      desc: '',
      args: [],
    );
  }

  /// `People in the Dream:`
  String get peopleInDreamLabel {
    return Intl.message(
      'People in the Dream:',
      name: 'peopleInDreamLabel',
      desc: '',
      args: [],
    );
  }

  /// `Tags:`
  String get tagsLabel {
    return Intl.message(
      'Tags:',
      name: 'tagsLabel',
      desc: '',
      args: [],
    );
  }

  /// `Emotion:`
  String get emotionLabel {
    return Intl.message(
      'Emotion:',
      name: 'emotionLabel',
      desc: '',
      args: [],
    );
  }

  /// `Give a title to your dream`
  String get dreamTitleHint {
    return Intl.message(
      'Give a title to your dream',
      name: 'dreamTitleHint',
      desc: '',
      args: [],
    );
  }

  /// `What's your dream about?`
  String get dreamDescriptionHint {
    return Intl.message(
      'What\'s your dream about?',
      name: 'dreamDescriptionHint',
      desc: '',
      args: [],
    );
  }

  /// `Dream Details`
  String get dreamDetailsTitle {
    return Intl.message(
      'Dream Details',
      name: 'dreamDetailsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Your Emotions:`
  String get yourEmotionsLabel {
    return Intl.message(
      'Your Emotions:',
      name: 'yourEmotionsLabel',
      desc: '',
      args: [],
    );
  }

  /// `Suggestions:`
  String get suggestionsLabel {
    return Intl.message(
      'Suggestions:',
      name: 'suggestionsLabel',
      desc: '',
      args: [],
    );
  }

  /// `How are you feeling?`
  String get feelingsHint {
    return Intl.message(
      'How are you feeling?',
      name: 'feelingsHint',
      desc: '',
      args: [],
    );
  }

  /// `Add a person`
  String get addPersonHint {
    return Intl.message(
      'Add a person',
      name: 'addPersonHint',
      desc: '',
      args: [],
    );
  }

  /// `Add a tag`
  String get addTagHint {
    return Intl.message(
      'Add a tag',
      name: 'addTagHint',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
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
