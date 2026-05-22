# Flutter & Dart Native Testing Standards

Use this rule when designing, generating, or refactoring tests in Flutter or Dart codebases. This rule restricts testing to the native Flutter testing ecosystem: `test`, `flutter_test`, and `integration_test`.

## 1. Project Directory Layout

Adhere strictly to the following file tree layout. Never mix unit/widget tests with integration tests.

```text
my_flutter_app/
├── lib/
│   ├── models/
│   │   └── user.dart
│   └── widgets/
│       └── custom_button.dart
├── test/                          # Unit & Widget tests only
│   ├── models/
│   │   └── user_test.dart         # 1:1 Mirror of lib/
│   └── widgets/
│       └── custom_button_test.dart# 1:1 Mirror of lib/
└── integration_test/              # Root-level E2E tests only
    └── app_test.dart
```

## 2. Core Constraints & Conventions

### The Mirror Rule
* **Directory Structure**: Every test file under `test/` must replicate the precise file path of its target implementation inside `lib/`.
* **File Suffix**: Every test file must end with `_test.dart`. Files missing this suffix will be ignored by the test runner.

### Integration Test Boundaries
* Place all End-to-End (E2E) and integration tests inside the root-level `integration_test/` directory.
* Never place integration tests inside the `test/` directory, as they require a target device or emulator to execute.

## 3. Test Implementation Guidelines

### Test Structuring
* Use declarative `group()` blocks to organize tests by feature state, target method, or logical branch.
* Keep test descriptions clear and behavior-focused (e.g., `'should return User object on 200 OK'`).

```dart
void main() {
  group('LoginController - Authenticate', () {
    test('should set loading state to true when execution starts', () {
      // Test code here
    });

    test('should return profile data on valid credentials', () {
      // Test code here
    });
  });
}
```

### Widget Test Identification
* Prefer identifying widgets using explicit `Key('unique_identifier')` matches over fragile `find.text()` matches wherever text copy is prone to localization or copy changes.

## 4. Execution Commands Reference

When running or validating tests, use the following native CLI utilities:

* **Unit & Widget Tests**: `flutter test`
* **Targeted File Test**: `flutter test test/path/to/file_test.dart`
* **Integration Tests**: `flutter drive --target=integration_test/app_test.dart`
