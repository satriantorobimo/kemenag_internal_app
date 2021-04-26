class Strings {
  ///SINGLETON
  static final Strings _instance = Strings.internal();
  Strings.internal();
  factory Strings() => _instance;
  static String appName = 'Kemenag Internal Apps';
}
