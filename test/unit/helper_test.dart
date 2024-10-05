// Unit tests for the pure business-logic helpers in lib/helper/helper.dart.
//
// These cases lock down the mapping between room identifiers, pack names and
// display names so a future refactor cannot silently change how a room is
// billed or labelled in the UI.

import 'package:flutter_test/flutter_test.dart';
import 'package:mate_project/helper/helper.dart';

void main() {
  group('Helper.convertRoomToPackName', () {
    test('rooms 1 to 3 map to the Gold pack', () {
      expect(Helper.convertRoomToPackName(1), 'Gold');
      expect(Helper.convertRoomToPackName(2), 'Gold');
      expect(Helper.convertRoomToPackName(3), 'Gold');
    });

    test('rooms 4 to 6 map to the Silver pack', () {
      expect(Helper.convertRoomToPackName(4), 'Silver');
      expect(Helper.convertRoomToPackName(5), 'Silver');
      expect(Helper.convertRoomToPackName(6), 'Silver');
    });

    test('rooms 7 to 9 map to the Bronze pack', () {
      expect(Helper.convertRoomToPackName(7), 'Bronze');
      expect(Helper.convertRoomToPackName(8), 'Bronze');
      expect(Helper.convertRoomToPackName(9), 'Bronze');
    });

    test('unknown room ids fall back to "No"', () {
      expect(Helper.convertRoomToPackName(0), 'No');
      expect(Helper.convertRoomToPackName(10), 'No');
      expect(Helper.convertRoomToPackName(-1), 'No');
    });
  });

  group('Helper.getPackFromId', () {
    test('returns the Gold pack for id 1 with the expected price', () {
      final pack = Helper.getPackFromId(1);
      expect(pack, isNotNull);
      expect(pack!.packName, 'Gold Room');
      expect(pack.price, 289);
      expect(pack.duration, 12);
      expect(pack.status, isTrue);
    });

    test('returns the Silver pack for id 2', () {
      final pack = Helper.getPackFromId(2);
      expect(pack!.packName, 'Silver Room');
      expect(pack.price, 199);
    });

    test('returns the Bronze pack for id 3', () {
      final pack = Helper.getPackFromId(3);
      expect(pack!.packName, 'Bronze Room');
      expect(pack.price, 99);
    });

    test('returns null for an unknown pack id', () {
      expect(Helper.getPackFromId(99), isNull);
    });
  });

  group('Helper.getRoomName', () {
    test('returns the correct display name for each known room', () {
      expect(Helper.getRoomName(1), 'Iris');
      expect(Helper.getRoomName(2), 'Peony');
      expect(Helper.getRoomName(3), 'Lotus');
      expect(Helper.getRoomName(4), 'Infinite Frontier');
      expect(Helper.getRoomName(5), 'New Haven');
      expect(Helper.getRoomName(6), 'Horizon Edge');
      expect(Helper.getRoomName(7), 'HeartLink');
      expect(Helper.getRoomName(8), 'TrueBond');
      expect(Helper.getRoomName(9), 'DreamScape');
    });

    test('returns an empty string for an unknown room id', () {
      expect(Helper.getRoomName(0), '');
      expect(Helper.getRoomName(42), '');
    });
  });
}
