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

  /// `Warning`
  String get warning {
    return Intl.message(
      'Warning',
      name: 'warning',
      desc: '',
      args: [],
    );
  }

  /// `There was an unknown error.`
  String get unknown_error {
    return Intl.message(
      'There was an unknown error.',
      name: 'unknown_error',
      desc: '',
      args: [],
    );
  }

  /// `Timeout error`
  String get timeout_error {
    return Intl.message(
      'Timeout error',
      name: 'timeout_error',
      desc: '',
      args: [],
    );
  }

  /// `Cancel error`
  String get cancel_error {
    return Intl.message(
      'Cancel error',
      name: 'cancel_error',
      desc: '',
      args: [],
    );
  }

  /// `Bad certificate error`
  String get bad_certificate_error {
    return Intl.message(
      'Bad certificate error',
      name: 'bad_certificate_error',
      desc: '',
      args: [],
    );
  }

  /// `Connection error`
  String get connection_error {
    return Intl.message(
      'Connection error',
      name: 'connection_error',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred during the request.`
  String get error_occurred_during_request {
    return Intl.message(
      'An error occurred during the request.',
      name: 'error_occurred_during_request',
      desc: '',
      args: [],
    );
  }

  /// `Manufacturers`
  String get manufacturers {
    return Intl.message(
      'Manufacturers',
      name: 'manufacturers',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get close {
    return Intl.message(
      'Close',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  /// `Models`
  String get models {
    return Intl.message(
      'Models',
      name: 'models',
      desc: '',
      args: [],
    );
  }

  /// `Could not namespace JSON`
  String get could_not_namespace_json {
    return Intl.message(
      'Could not namespace JSON',
      name: 'could_not_namespace_json',
      desc: '',
      args: [],
    );
  }

  /// `Unauthorized`
  String get unauthorized {
    return Intl.message(
      'Unauthorized',
      name: 'unauthorized',
      desc: '',
      args: [],
    );
  }

  /// `Internal server error`
  String get internal_server_error {
    return Intl.message(
      'Internal server error',
      name: 'internal_server_error',
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
