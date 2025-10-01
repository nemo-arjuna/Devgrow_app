import 'dart:io';

void main() async {
  // Jalankan adb langsung lewat Dart VM
  var result = await Process.run(
    'C:\\Users\\TATA-NBK-0130\\AppData\\Local\\Android\\Sdk\\platform-tools\\adb.exe',
    ['devices', '-l'],
  );

  print('Exit code: ${result.exitCode}');
  print('Stdout: ${result.stdout}');
  print('Stderr: ${result.stderr}');
}
