# Flutter Project Guidelines

## Commands
- Build: `flutter build apk` / `flutter build ios`
- Test: `flutter test` (all tests) or `flutter test test/widget_test.dart` (single test)
- Lint: `flutter analyze`
- Format: `dart format .`
- Run: `flutter run`

## Code Style
- Use `flutter_lints` package for linting rules
- Import order: dart > flutter > third-party > local
- Use const constructors where possible
- Prefer single quotes for strings
- Use PascalCase for classes, camelCase for variables/functions
- Use descriptive widget names with `const` keyword
- Handle image loading with `errorBuilder` for robustness
- Use `Color(0xFFF94D00)` as primary brand color
- Follow Material Design patterns with consistent theming