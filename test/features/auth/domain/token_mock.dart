// TODO Implement this library.import 'package:mocktail/mocktail.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sneakbid/app/shared_prefs/token_shared_prefs.dart';

class MockTokenSharedPrefs extends Mock implements TokenSharedPrefs {
  void saveToken(any) {}

  void getToken() {}
}

class TokenSharedPrefs {
}