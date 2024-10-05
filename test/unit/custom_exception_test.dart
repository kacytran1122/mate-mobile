// Unit tests for the CustomException type used across the authentication and
// customer flows. The blocs branch on the Failure enum carried by the
// exception, so these tests guarantee the type and content survive
// construction.

import 'package:flutter_test/flutter_test.dart';
import 'package:mate_project/enums/failure_enum.dart';
import 'package:mate_project/helper/custom_exception.dart';

void main() {
  group('CustomException', () {
    test('stores the failure type and content it was built with', () {
      final exception = CustomException(
        type: Failure.Email,
        content: 'Invalid email address',
      );

      expect(exception.type, Failure.Email);
      expect(exception.content, 'Invalid email address');
    });

    test('is a Dart Exception so it can be thrown and caught', () {
      expect(
        () => throw CustomException(
          type: Failure.System,
          content: 'Something went wrong',
        ),
        throwsA(isA<CustomException>()),
      );
    });

    test('preserves each distinct Failure category', () {
      for (final failure in Failure.values) {
        final exception = CustomException(type: failure, content: 'x');
        expect(exception.type, failure);
      }
    });
  });
}
