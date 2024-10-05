# Test Cases

This folder holds the automated software test cases for the Mate mobile application. The tests are written with the `flutter_test` package and are grouped by the kind of code they exercise.

## Layout

```
test/
  unit/                       Pure logic and model tests (no widgets)
    helper_test.dart          Room to pack mapping and room name lookups
    pack_model_test.dart      Pack JSON serialization and round tripping
    custom_exception_test.dart CustomException type and content handling
  widget_test.dart            Widget rendering and interaction tests
```

## Test cases covered

### Unit: Helper (test/unit/helper_test.dart)
- Rooms 1 to 3 resolve to the Gold pack.
- Rooms 4 to 6 resolve to the Silver pack.
- Rooms 7 to 9 resolve to the Bronze pack.
- Unknown room ids fall back to "No".
- `getPackFromId` returns the correct pack, price and duration for ids 1, 2 and 3.
- `getPackFromId` returns null for an unknown id.
- `getRoomName` returns the correct display name for every known room id.
- `getRoomName` returns an empty string for an unknown id.

### Unit: Pack model (test/unit/pack_model_test.dart)
- `fromJson` parses a full payload with a double price.
- `fromJson` parses a price that arrives as an integer.
- `toJson` produces a map that contains every field.
- A `toJson` then `fromJson` round trip preserves all data.

### Unit: CustomException (test/unit/custom_exception_test.dart)
- The exception stores the failure type and content it was constructed with.
- The exception can be thrown and caught as a Dart exception.
- Every value of the `Failure` enum is preserved by the exception.

### Widget: NormalButtonCustom (test/widget_test.dart)
- The button renders the label it is given.
- Tapping the button invokes the supplied action callback exactly once.

## Running the tests

Make sure the Flutter SDK is installed, then from the project root run:

```
flutter pub get
flutter test
```

To run a single file:

```
flutter test test/unit/helper_test.dart
```

To collect coverage:

```
flutter test --coverage
```
