import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['pt', 'en'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? ptText = '',
    String? enText = '',
  }) =>
      [ptText, enText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Home
  {
    'wn1pjzh9': {
      'pt': 'Encontre os seus \nheróis favoritos',
      'en': 'Find your\nfavorite heroes',
    },
    'pcu2oycd': {
      'pt':
          'Neste aplicativo você poderá \nencontrar todos os detalhes sobre os seus heróis\nforça destreza, biográfia e muito mais.',
      'en':
          'In this app you can\nfind all the details about your heroes\nstrength dexterity, bio and much more.',
    },
    'juhw1fo0': {
      'pt': 'Home',
      'en': 'Home',
    },
  },
  // Detail
  {
    '9qt1qu22': {
      'pt': 'Força:',
      'en': 'Strength:',
    },
    'rqrfsbaj': {
      'pt': 'Inteligência:',
      'en': 'intelligence:',
    },
    'g5g8qifh': {
      'pt': 'Velocidade:',
      'en': 'Speed:',
    },
    '0b6aimpz': {
      'pt': 'Combate:',
      'en': 'Combat:',
    },
    'emac8tna': {
      'pt': 'Home',
      'en': 'Home',
    },
  },
  // Search
  {
    'gkj8ospf': {
      'pt': 'Nome:',
      'en': 'Name:',
    },
    'i495cfr3': {
      'pt': 'Digite o nome ou parte do nome',
      'en': 'Enter the name or part of the name',
    },
    '77gqgw1s': {
      'pt': 'Pesquisar',
      'en': 'To look for',
    },
    'xzzd7l1z': {
      'pt':
          '“Há um super-herói em\ntodos nós, só precisamos de \ncoragem para colocar a capa.”',
      'en':
          '“There is a superhero in\nwe all just need\ncourage to put on the cape.”',
    },
    'k1nvrrce': {
      'pt': 'Home',
      'en': 'Home',
    },
  },
  // Miscellaneous
  {
    'bub8e3q1': {
      'pt': '',
      'en': '',
    },
    '1zev9quz': {
      'pt': '',
      'en': '',
    },
    'yxkdma0q': {
      'pt': '',
      'en': '',
    },
    '44prneis': {
      'pt': '',
      'en': '',
    },
    '2lbz3qoo': {
      'pt': '',
      'en': '',
    },
    'b6tsv4ef': {
      'pt': '',
      'en': '',
    },
    'hrvi5mij': {
      'pt': '',
      'en': '',
    },
    'nb8314wo': {
      'pt': '',
      'en': '',
    },
    '6vcafe6n': {
      'pt': '',
      'en': '',
    },
    'b62o79bo': {
      'pt': '',
      'en': '',
    },
    'n9qw4hll': {
      'pt': '',
      'en': '',
    },
    'baw2sg36': {
      'pt': '',
      'en': '',
    },
    'ycz6eovf': {
      'pt': '',
      'en': '',
    },
    '7gx3e84w': {
      'pt': '',
      'en': '',
    },
    'v7amu94z': {
      'pt': '',
      'en': '',
    },
    '9rtvygzt': {
      'pt': '',
      'en': '',
    },
    '47wmbibx': {
      'pt': '',
      'en': '',
    },
    'kjudqmpi': {
      'pt': '',
      'en': '',
    },
    'q9grc50a': {
      'pt': '',
      'en': '',
    },
    'x84gs8h7': {
      'pt': '',
      'en': '',
    },
    'apszkgbr': {
      'pt': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
