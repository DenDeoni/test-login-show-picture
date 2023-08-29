import 'package:app/bloc/auth_bloc.dart';
import 'package:app/bloc/auth_event.dart';
import 'package:app/bloc/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late AuthBloc authBloc;
  group('AuthBloc', () {
    setUp(() {
      authBloc = AuthBloc();
    });

    tearDown(() {
      authBloc.close();
    });

    group('AuthorizationEvent', () {
      test('should emit AuthorizationState', () {
        authBloc.add(AutorisationEvent());
        final expected = isA<AuthorizationState>();
        expectLater(authBloc.stream, emits(expected));
      });
    });
  });
}
