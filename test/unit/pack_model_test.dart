// Unit tests for the Pack model serialization in lib/models/pack.dart.
//
// The API returns price as a JSON number that may arrive as either an int or a
// double, so these tests verify that Pack.fromJson parses both forms and that a
// toJson / fromJson round trip preserves every field.

import 'package:flutter_test/flutter_test.dart';
import 'package:mate_project/models/pack.dart';

void main() {
  group('Pack.fromJson', () {
    test('parses a full JSON payload with a double price', () {
      final pack = Pack.fromJson({
        'packId': 1,
        'price': 289.0,
        'packName': 'Gold Room',
        'description': 'Premium plan',
        'duration': 12,
        'status': true,
      });

      expect(pack.packId, 1);
      expect(pack.price, 289.0);
      expect(pack.packName, 'Gold Room');
      expect(pack.description, 'Premium plan');
      expect(pack.duration, 12);
      expect(pack.status, isTrue);
    });

    test('parses a price that arrives as an integer', () {
      final pack = Pack.fromJson({
        'packId': 2,
        'price': 199,
        'packName': 'Silver Room',
        'description': '',
        'duration': 6,
        'status': false,
      });

      expect(pack.price, 199.0);
      expect(pack.status, isFalse);
    });
  });

  group('Pack.toJson', () {
    test('produces a map with all fields', () {
      final pack = Pack(
        packId: 3,
        price: 99.5,
        packName: 'Bronze Room',
        description: 'Entry plan',
        duration: 3,
        status: true,
      );

      final json = pack.toJson();
      expect(json['packId'], 3);
      expect(json['price'], 99.5);
      expect(json['packName'], 'Bronze Room');
      expect(json['description'], 'Entry plan');
      expect(json['duration'], 3);
      expect(json['status'], true);
    });
  });

  test('toJson then fromJson round trips without data loss', () {
    final original = Pack(
      packId: 7,
      price: 149.99,
      packName: 'Custom Room',
      description: 'Round trip',
      duration: 24,
      status: true,
    );

    final restored = Pack.fromJson(original.toJson());

    expect(restored.packId, original.packId);
    expect(restored.price, original.price);
    expect(restored.packName, original.packName);
    expect(restored.description, original.description);
    expect(restored.duration, original.duration);
    expect(restored.status, original.status);
  });
}
