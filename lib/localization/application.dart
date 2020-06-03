import 'dart:ui';

//https://blog.geekyants.com/flutter-in-app-localization-438289682f0c
class Application {
  static final Application _application = Application._internal();

  factory Application() {
    return _application;
  }

  Application._internal();

  final List<String> supportedLanguages = [
    "English",
    "VietNam",
  ];

  final List<String> supportedLanguagesCodes = [
    "en",
    "vi",
  ];
  
  //returns the list of supported Locales
  Iterable<Locale> supportedLocales() => supportedLanguagesCodes.map<Locale>((language) => Locale(language, ""));

  //function to be invoked when changing the language
  LocaleChangeCallback onLocaleChanged;
}
Application application = Application();
typedef void LocaleChangeCallback(Locale locale);