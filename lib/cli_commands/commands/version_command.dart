import 'dart:io';

class VersionCommand {
  void run() {
    final file = File('pubspec.yaml').readAsLinesSync();
    final version = file.singleWhere(
      (element) => element.contains('version'),
      orElse: () => 'Версия приложения не указана',
    );
    print(version);
    exit(0);
  }
}
