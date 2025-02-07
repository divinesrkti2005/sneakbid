import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sneakbid/core/error/failure.dart';
import 'package:sneakbid/features/auth/domain/use_case/login_usecase.dart';

import 'repository_mock.dart';
import 'token_mock.dart';

void main() {
  late MockAuthRepository repository;
  late MockTokenSharedPrefs tokenSharedPrefs;
  late LoginUseCase usecase;

  setUp(() {
    repository = MockAuthRepository();
    tokenSharedPrefs = MockTokenSharedPrefs();
    usecase = LoginUseCase(repository, tokenSharedPrefs as int);

    // Mock getToken to return a valid token
    when(() => tokenSharedPrefs.getToken())
        .thenAnswer((_) async => const Right('mocked_token'));

    // Mock saveToken to return a successful response
    when(() => tokenSharedPrefs.saveToken(any()))
        .thenAnswer((_) async => const Right(null));
  });

  test(
      'should call the [AuthRepo.login] with correct email and password (abhishek, 1234)',
      () async {
    when(() => repository.logincustomer(any(), any())).thenAnswer(
      (invocation) async {
        final email = invocation.positionalArguments[0] as String;
        final password = invocation.positionalArguments[1] as String;
        if (email == 'abhishek@gmail.com' && password == '1234') {
          return Future.value(const Right('token'));
        } else {
          return Future.value(
              const Left(ApiFailure(message: 'Invalid email or password')));
        }
      },
    );

    when(() => tokenSharedPrefs.saveToken(any()))
        .thenAnswer((_) async => const Right(null));

    when(() => tokenSharedPrefs.getToken())
        .thenAnswer((_) async => const Right('mocked_token'));

    final result = await usecase(const LoginParams(
      email: 'divine@gmail.com',
      password: '1234', username: "divine",
    ));

    expect(result, const Right('token'));

    verify(() => repository.logincustomer(any(), any())).called(1);
    verify(() => tokenSharedPrefs.saveToken(any())).called(1);
    verify(() => tokenSharedPrefs.getToken())
        .called(1); // Explicitly verify this call

    verifyNoMoreInteractions(repository);
    verifyNoMoreInteractions(tokenSharedPrefs);
  });
}
