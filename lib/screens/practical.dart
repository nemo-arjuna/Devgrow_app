import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget  {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PracticalsPage(),
    );
  }
}

class PracticalsPage extends StatelessWidget {
  final List<Map<String, dynamic>> sections = [
    {
      "title": "Introduction",
      "items": ["Hello World"],
    },
    {
      "title": "Basic concept of Dart",
      "items": [
        "Comments",
        "ants",
        "Identifiers",
        "Input and Output",
        "Variable"
      ],
    },
    {
      "title": "Data Type",
      "items": [
        "Number Data Type",
        "String Data Type",
        "Boolean Data Type",
        "List Data Type",
        "Map Data Type",
      ],
    },
    {
      "title": "Operator",
      "items": [
        "Arithmetic Opera..",
        "Assignment Oper..",
        "Bitwise Operators",
        "Increment & Decr..",
        "logical Operator"
      ],
    },
    {
      "title": "Selection",
      "items": [
        "Else If Ladder",
        "If Else",
        "Nested If",
        "Simple If",
        "SwitchCase"
      ],
    },
    {
      "title": "Iteration",
      "items": [
        "Do-While Loop",
        "For in Loop",
        "Introduction to F..",
        "Nested Loop",
        "While Loop"
      ],
    },
    {
      "title": "Switch case Statement",
      "items": [
        "Normal switch-c..",
        "Nested switch-C..",
        "Switch Case On S..",
        "Switch Case On E.."
      ],
    },
    {
      "title": "Keyword",
      "items": [
        "Break Keyword",
        "Continue Keyword",
        "This Keyword",
        "Throw Keyword",
        "Typedef Keyword",
        "Late Keyword",
        "Dynamic Keyword",
        "Var Keyword"
      ],
    },
    {
      "title": "Type of function",
      "items": [
        "Function",
        "Parameter & No R..",
        "No Parameter & R..",
        "Function With Par.."
      ],
    },
    {
      "title": "Introduction",
      "items": ["Introduction"],
    },
    {
      "title": "List (array)",
      "items": ["1-D List", "Lists", "Multi-Dimension..", "Type of List"],
    },
    {
      "title": "Maps",
      "items": [
        "Maps",
        "Insert into Map",
        "Display Map",
        "Delete from Map",
        "Update Map"
      ],
    },
    {
      "title": "Strings",
      "items": [
        "String",
        "Convert String to Int",
        "contains()",
        "endWith()",
        "IndexOf()",
        "LastindexOf()",
        "replaceAll()",
        "split()",
        "startsWith()",
        "toLowerCase()",
        "trim()"
      ],
    },
    {
      "title": "Math",
      "items": [
        "acos()",
        "asin()",
        "atan()",
        "cost()",
        "exp()",
        "log()",
        "max()",
        "min()",
        "pow()",
        "sin()",
        "tan()",
      ],
    },
    {
      "title": "Oop concept",
      "items": [
        "Class and Object",
        "Abstract Class",
        "ructors",
        "Getters and Sette..",
        "Inheritances",
        "interface",
        "Polymorphism",
        "Encapsulation"
      ],
    },
    {
      "title": "Exception handling",
      "items": [
        "Try Catch",
        "Finally Keyword..",
      ],
    },
    {
      "title": "File handling",
      "items": ["Reading from a File", "Write into a File"],
    },
    {
      "title": "Sets",
      "items": [
        "Simple Set",
        "Declaration Set",
        "Empty Set",
        "Content Set",
        "Hash Set"
      ],
    },
    {
      "title": "Set method",
      "items": [
        "Add Method",
        "Add All Method",
        "Remove Method",
        "Length Method",
        "RuntimeType Met..",
        "isEmpty Method",
        "isNotEmpty Meth..",
        "Clear Method"
      ],
    },
    {
      "title": "Constructor",
      "items": [
        "Default Constru..",
        "Parameterised Con..",
        "Named Constru..",
        "Constant Constr..",
        "Redirecting Cons.."
      ],
    },
    {
      "title": "Enums",
      "items": ["Enums"],
    },
    {
      "title": "Getter and Setter",
      "items": ["Default Getter and Setter", "Custom Getter & Setter"],
    },
    {
      "title": "Inheritance",
      "items": [
        "Single Inheritance",
        "Multi-Level Inher..",
        "Hierarchical Inhe.."
      ],
    },
  ];

  /// Kumpulan contoh kode untuk setiap item.
  /// Kunci Map harus sesuai dengan teks item agar cocok saat ditekan.
  final Map<String, String> exampleCodes = {
    // ----------------- Introduction -----------------
    "Hello World": r"""
void main() {
  print('Hello, World!');
}
""",

    // ------------- Basic concept of Dart -------------
    "Comments": r"""
void main() {
  // Ini adalah komentar satu baris
  /* Ini komentar multi-baris
     Tidak akan dieksekusi */
  print('Komentar tidak dieksekusi');
}
""",
    "ants": r"""
// Catatan: Item 'ants' tampaknya salah ketik.
// Misal diasumsikan 'Constants' (konstanta) atau 'Arguments'.
// Berikut contoh konstanta:
void main() {
  const pi = 3.14159;
  final now = DateTime.now(); // final: diisi sekali
  print('pi: $pi, now: $now');
}
""",
    "Identifiers": r"""
void main() {
  int umur = 20;      // 'umur' adalah identifier
  String nama = "Budi";
  print("Nama: $nama, Umur: $umur");
}
""",
    "Input and Output": r"""
import 'dart:io';
void main() {
  stdout.write("Masukkan nama: ");
  String? name = stdin.readLineSync();
  print("Halo, $name!");
}
""",
    "Variable": r"""
void main() {
  var name = "Andi";  // tipe terdeteksi otomatis
  int umur = 25;      // tipe eksplisit
  dynamic any = 10;   // bisa berubah tipe
  any = "sepuluh";
  print("Nama: $name, Umur: $umur, Any: $any");
}
""",

    // ------------------- Data Type -------------------
    "Number Data Type": r"""
void main() {
  int a = 10;
  double b = 5.5;
  num c = a + b; // num bisa int atau double
  print("a: $a, b: $b, c: $c");
}
""",
    "String Data Type": r"""
void main() {
  String text = "Dart";
  print(text.toUpperCase());
  print("Panjang: ${text.length}");
}
""",
    "Boolean Data Type": r"""
void main() {
  bool isOpen = true;
  if (isOpen) print("Toko buka");
}
""",
    "List Data Type": r"""
void main() {
  List<String> names = ["Ali", "Budi", "Citra"];
  names.add("Dewi");
  print(names);      // [Ali, Budi, Citra, Dewi]
  print(names[1]);   // Budi
}
""",
    "Map Data Type": r"""
void main() {
  Map<String, int> umur = {"Ali": 20, "Budi": 25};
  umur["Citra"] = 22;
  print(umur);           // {Ali: 20, Budi: 25, Citra: 22}
  print(umur["Budi"]);   // 25
}
""",

    // -------------------- Operator -------------------
    "Arithmetic Opera..": r"""
void main() {
  int a = 10, b = 3;
  print("Tambah: ${a + b}");
  print("Kurang: ${a - b}");
  print("Kali: ${a * b}");
  print("Bagi: ${a / b}");
  print("Mod: ${a % b}");
}
""",
    "Assignment Oper..": r"""
void main() {
  int a = 5;
  a += 3; // 8
  a -= 2; // 6
  a *= 4; // 24
  a ~/= 5; // 4 (pembagian bulat)
  print(a);
}
""",
    "Bitwise Operators": r"""
void main() {
  int a = 5;   // 0101
  int b = 3;   // 0011
  print(a & b); // AND -> 0001 = 1
  print(a | b); // OR  -> 0111 = 7
  print(a ^ b); // XOR -> 0110 = 6
  print(a << 1); // shift left -> 1010 = 10
  print(a >> 1); // shift right -> 0010 = 2
}
""",
    "Increment & Decr..": r"""
void main() {
  int a = 5;
  print(++a); // pre-increment (6), lalu nilai a = 6
  print(a++); // post-increment (6), lalu a = 7
  print(--a); // pre-decrement (6), lalu a = 6
  print(a--); // post-decrement (6), lalu a = 5
}
""",
    "logical Operator": r"""
void main() {
  bool x = true, y = false;
  print(x && y); // false
  print(x || y); // true
  print(!x);     // false
}
""",

    // -------------------- Selection ------------------
    "Else If Ladder": r"""
void main() {
  int nilai = 85;
  if (nilai >= 90) {
    print("A");
  } else if (nilai >= 75) {
    print("B");
  } else if (nilai >= 60) {
    print("C");
  } else {
    print("D");
  }
}
""",
    "If Else": r"""
void main() {
  int umur = 18;
  if (umur >= 17) {
    print("Dewasa");
  } else {
    print("Anak-anak");
  }
}
""",
    "Nested If": r"""
void main() {
  int a = 10, b = 20;
  if (a > 0) {
    if (b > 0) {
      print("Keduanya positif");
    }
  }
}
""",
    "Simple If": r"""
void main() {
  int a = 5;
  if (a > 0) print("Positif");
}
""",
    "SwitchCase": r"""
void main() {
  String hari = "Senin";
  switch (hari) {
    case "Senin":
    case "Selasa":
    case "Rabu":
    case "Kamis":
    case "Jumat":
      print("Hari kerja");
      break;
    case "Sabtu":
    case "Minggu":
      print("Akhir pekan");
      break;
    default:
      print("Tidak dikenal");
  }
}
""",

    // -------------------- Iteration ------------------
    "Do-While Loop": r"""
void main() {
  int i = 0;
  do {
    print(i);
    i++;
  } while (i < 5);
}
""",
    "For in Loop": r"""
void main() {
  var angka = [1, 2, 3];
  for (var a in angka) {
    print(a);
  }
}
""",
    "Introduction to F..": r"""
void main() {
  for (int i = 0; i < 3; i++) {
    print("i = $i");
  }
}
""",
    "Nested Loop": r"""
void main() {
  for (int i = 1; i <= 3; i++) {
    for (int j = 1; j <= 2; j++) {
      print("($i,$j)");
    }
  }
}
""",
    "While Loop": r"""
void main() {
  int i = 0;
  while (i < 5) {
    print(i);
    i++;
  }
}
""",

    // --------------- Switch case Statement -----------
    "Normal switch-c..": r"""
void main() {
  int kode = 2;
  switch (kode) {
    case 1: print("Satu"); break;
    case 2: print("Dua"); break;
    case 3: print("Tiga"); break;
    default: print("Lainnya");
  }
}
""",
    "Nested switch-C..": r"""
void main() {
  String kategori = "buah";
  String item = "apel";
  switch (kategori) {
    case "buah":
      switch (item) {
        case "apel": print("Ini apel"); break;
        default: print("Buah lain");
      }
      break;
    default:
      print("Kategori lain");
  }
}
""",
    "Switch Case On S..": r"""
// Switch pada String
void main() {
  String cmd = "start";
  switch (cmd) {
    case "start": print("Mulai"); break;
    case "stop": print("Berhenti"); break;
    default: print("Unknown");
  }
}
""",
    "Switch Case On E..": r"""
// Switch pada enum
enum Status { ready, running, done }

void main() {
  Status s = Status.running;
  switch (s) {
    case Status.ready: print("Ready"); break;
    case Status.running: print("Running"); break;
    case Status.done: print("Done"); break;
  }
}
""",

    // ---------------------- Keyword ------------------
    "Break Keyword": r"""
void main() {
  for (int i = 0; i < 10; i++) {
    if (i == 3) break;
    print(i);
  }
}
""",
    "Continue Keyword": r"""
void main() {
  for (int i = 0; i < 5; i++) {
    if (i == 2) continue;
    print(i);
  }
}
""",
    "This Keyword": r"""
class Person {
  String name;
  int age;
  Person(this.name, this.age);
  void show() {
    print("Nama: ${this.name}, Umur: ${this.age}");
  }
}
void main() {
  Person("Budi", 20).show();
}
""",
    "Throw Keyword": r"""
int bagi(int a, int b) {
  if (b == 0) {
    throw ArgumentError("Pembagi tidak boleh nol");
  }
  return a ~/ b;
}
void main() {
  try {
    print(bagi(10, 2));
  } catch (e) {
    print("Error: $e");
  }
}
""",
    "Typedef Keyword": r"""
typedef IntOp = int Function(int a, int b);
int tambah(int a, int b) => a + b;
void main() {
  IntOp op = tambah;
  print(op(3, 4));
}
""",
    "Late Keyword": r"""
class A {
  late String value; // diinisialisasi nanti
  void init() {
    value = "Terisi belakangan";
  }
}
void main() {
  final a = A();
  a.init();
  print(a.value);
}
""",
    "Dynamic Keyword": r"""
void main() {
  dynamic x = 10;
  x = "bisa ganti tipe";
  print(x);
}
""",
    "Var Keyword": r"""
void main() {
  var x = 10; // tipe di-infer saat deklarasi
  // x = "salah"; // akan error kalau diaktifkan, karena x bertipe int
  print(x);
}
""",

    // ------------------ Type of function -------------
    "Function": r"""
int tambah(int a, int b) {
  return a + b;
}
void main() {
  print(tambah(2, 3));
}
""",
    "Parameter & No R..": r"""
void sapa(String nama) {
  print("Halo, $nama");
}
void main() {
  sapa("Budi"); // ada parameter, tidak mengembalikan nilai
}
""",
    "No Parameter & R..": r"""
int angkaAcak() {
  return DateTime.now().millisecond % 100;
}
void main() {
  print(angkaAcak()); // tidak ada parameter, mengembalikan nilai
}
""",
    "Function With Par..": r"""
int kali({required int a, int b = 1}) {
  return a * b;
}
void main() {
  print(kali(a: 4, b: 3));
  print(kali(a: 5)); // b default 1
}
""",

    // -------------- Introduction (duplicate) ---------
    "Introduction": r"""
// Bagian pengantar materi list & koleksi di Dart
void main() {
  print("Ini adalah pengantar: Dart memiliki List, Set, dan Map.");
}
""",

    // ------------------- List (array) ----------------
    "1-D List": r"""
void main() {
  List<int> arr = [1, 2, 3, 4];
  print(arr);
}
""",
    "Lists": r"""
void main() {
  var list = <String>[];
  list.addAll(["A", "B"]);
  print(list);
}
""",
    "Multi-Dimension..": r"""
void main() {
  List<List<int>> matrix = [
    [1, 2],
    [3, 4]
  ];
  print(matrix[1][0]); // 3
}
""",
    "Type of List": r"""
void main() {
  var growable = [1, 2, 3];             // growable list
  var fixed = List<int>.filled(3, 0);   // fixed-length list
  print(growable);
  print(fixed);
}
""",

    // ----------------------- Maps --------------------
    "Maps": r"""
void main() {
  Map<String, String> m = {"id": "001", "name": "Budi"};
  print(m);
}
""",
    "Insert into Map": r"""
void main() {
  final m = <String, int>{};
  m["a"] = 1;
  m.putIfAbsent("b", () => 2);
  print(m);
}
""",
    "Display Map": r"""
void main() {
  final m = {"x": 10, "y": 20};
  m.forEach((k, v) => print("$k => $v"));
}
""",
    "Delete from Map": r"""
void main() {
  final m = {"x": 10, "y": 20};
  m.remove("x");
  print(m); // {y: 20}
}
""",
    "Update Map": r"""
void main() {
  final m = {"x": 10, "y": 20};
  m.update("y", (old) => old + 5, ifAbsent: () => 0);
  print(m); // {x: 10, y: 25}
}
""",

    // ---------------------- Strings ------------------
    "String": r"""
void main() {
  String s = "  Halo Dart  ";
  print(s.trim());
}
""",
    "Convert String to Int": r"""
void main() {
  String s = "42";
  int n = int.parse(s);
  print(n + 8); // 50
}
""",
    "contains()": r"""
void main() {
  String s = "dart language";
  print(s.contains("lang")); // true
}
""",
    "endWith()": r"""
// Catatan: di Dart namanya 'endsWith'
void main() {
  print("hello.dart".endsWith(".dart")); // true
}
""",
    "IndexOf()": r"""
void main() {
  String s = "abracadabra";
  print(s.indexOf("bra")); // 1
}
""",
    "LastindexOf()": r"""
void main() {
  String s = "abracadabra";
  print(s.lastIndexOf("abra")); // 7
}
""",
    "replaceAll()": r"""
void main() {
  String s = "2025-08-14";
  print(s.replaceAll("-", "/")); // 2025/08/14
}
""",
    "split()": r"""
void main() {
  String s = "a,b,c";
  print(s.split(",")); // [a, b, c]
}
""",
    "startsWith()": r"""
void main() {
  print("main.dart".startsWith("main")); // true
}
""",
    "toLowerCase()": r"""
void main() {
  print("HeLLo".toLowerCase()); // hello
}
""",
    "trim()": r"""
void main() {
  print("  hi  ".trim()); // "hi"
}
""",

    // ------------------------ Math -------------------
    "acos()": r"""
import 'dart:math' as math;
void main() {
  print(math.acos(1)); // 0.0
}
""",
    "asin()": r"""
import 'dart:math' as math;
void main() {
  print(math.asin(0)); // 0.0
}
""",
    "atan()": r"""
import 'dart:math' as math;
void main() {
  print(math.atan(1)); // ~0.785398...
}
""",
    "cost()": r"""
// Catatan: seharusnya 'cos'
import 'dart:math' as math;
void main() {
  print(math.cos(math.pi)); // -1.0
}
""",
    "exp()": r"""
import 'dart:math' as math;
void main() {
  print(math.exp(1)); // e
}
""",
    "log()": r"""
import 'dart:math' as math;
void main() {
  print(math.log(10)); // ln(10)
}
""",
    "max()": r"""
import 'dart:math' as math;
void main() {
  print(math.max(3, 7)); // 7
}
""",
    "min()": r"""
import 'dart:math' as math;
void main() {
  print(math.min(3, 7)); // 3
}
""",
    "pow()": r"""
import 'dart:math' as math;
void main() {
  print(math.pow(2, 10)); // 1024
}
""",
    "sin()": r"""
import 'dart:math' as math;
void main() {
  print(math.sin(math.pi / 2)); // 1.0
}
""",
    "tan()": r"""
import 'dart:math' as math;
void main() {
  print(math.tan(math.pi / 4)); // ~1.0
}
""",

    // -------------------- OOP concept ----------------
    "Class and Object": r"""
class Person {
  String name;
  int age;
  Person(this.name, this.age);
  void greet() => print("Hi, I'm $name");
}
void main() {
  final p = Person("Budi", 20);
  p.greet();
}
""",
    "Abstract Class": r"""
abstract class Shape {
  double area();
}
class Circle implements Shape {
  final double r;
  Circle(this.r);
  @override
  double area() => 3.14159 * r * r;
}
void main() {
  print(Circle(3).area());
}
""",
    "ructors": r"""
// Asumsi ini 'Constructors'
class User {
  final String id;
  String name;
  // Constructor default
  User(this.id, this.name);
  // Named constructor
  User.guest()
      : id = "guest",
        name = "Guest";
}
void main() {
  print(User("1", "Budi").name);
  print(User.guest().id);
}
""",
    "Getters and Sette..": r"""
class Box {
  double _side = 1;
  double get area => _side * _side;
  set side(double v) {
    if (v <= 0) throw ArgumentError("side must be > 0");
    _side = v;
  }
}
void main() {
  final b = Box();
  b.side = 4;
  print(b.area); // 16
}
""",
    "Inheritances": r"""
class Animal {
  void sound() => print("...");
}
class Dog extends Animal {
  @override
  void sound() => print("Woof");
}
void main() {
  Dog().sound();
}
""",
    "interface": r"""
// Di Dart, 'interface' bisa dicapai dengan 'implements'
abstract class Drivable {
  void drive();
}
class Car implements Drivable {
  @override
  void drive() => print("Vroom");
}
void main() {
  Car().drive();
}
""",
    "Polymorphism": r"""
abstract class Shape {
  double area();
}
class Rect implements Shape {
  final double w, h;
  Rect(this.w, this.h);
  @override
  double area() => w * h;
}
class Circle implements Shape {
  final double r;
  Circle(this.r);
  @override
  double area() => 3.14159 * r * r;
}
void main() {
  List<Shape> shapes = [Rect(2,3), Circle(1)];
  for (var s in shapes) {
    print(s.area()); // polymorphic call
  }
}
""",
    "Encapsulation": r"""
class BankAccount {
  double _balance = 0; // private (library)
  void deposit(double amt) => _balance += amt;
  void withdraw(double amt) {
    if (amt > _balance) throw Exception("Insufficient");
    _balance -= amt;
  }
  double get balance => _balance;
}
void main() {
  final acc = BankAccount();
  acc.deposit(100);
  acc.withdraw(30);
  print(acc.balance);
}
""",

    // --------------- Exception handling --------------
    "Try Catch": r"""
void main() {
  try {
    int.parse("abc"); // akan throw
  } on FormatException catch (e) {
    print("Format salah: $e");
  } catch (e) {
    print("Error lain: $e");
  } finally {
    print("Selesai");
  }
}
""",
    "Finally Keyword..": r"""
void main() {
  try {
    print("Coba");
  } finally {
    print("Bagian finally SELALU jalan");
  }
}
""",

    // ------------------- File handling ---------------
    "Reading from a File": r"""
import 'dart:io';
void main() async {
  final file = File('example.txt');
  if (await file.exists()) {
    final content = await file.readAsString();
    print(content);
  } else {
    print('File tidak ditemukan');
  }
}
""",
    "Write into a File": r"""
import 'dart:io';
void main() async {
  final file = File('example.txt');
  await file.writeAsString('Hello File!');
  print('Ditulis.');
}
""",

    // ------------------------- Sets ------------------
    "Simple Set": r"""
void main() {
  var s = <int>{1, 2, 3};
  print(s.contains(2)); // true
}
""",
    "Declaration Set": r"""
void main() {
  Set<String> fruits = {"apel", "jeruk"};
  print(fruits);
}
""",
    "Empty Set": r"""
void main() {
  var empty = <int>{};
  print(empty.isEmpty); // true
}
""",
    "Content Set": r"""
void main() {
  var s = {1, 2, 2, 3};
  print(s); // {1, 2, 3} (unik)
}
""",
    "Hash Set": r"""
import 'dart:collection';
void main() {
  final hs = HashSet<int>();
  hs.addAll([3,1,2,2]);
  print(hs); // urutan tidak dijamin
}
""",

    // ---------------------- Set method ---------------
    "Add Method": r"""
void main() {
  final s = <String>{};
  s.add("a");
  print(s);
}
""",
    "Add All Method": r"""
void main() {
  final s = <int>{1};
  s.addAll([2, 3, 3]);
  print(s); // {1,2,3}
}
""",
    "Remove Method": r"""
void main() {
  final s = {1, 2, 3};
  s.remove(2);
  print(s); // {1,3}
}
""",
    "Length Method": r"""
void main() {
  final s = {1, 2, 3};
  print(s.length); // 3
}
""",
    "RuntimeType Met..": r"""
void main() {
  final s = {1, 2, 3};
  print(s.runtimeType);
}
""",
    "isEmpty Method": r"""
void main() {
  final s = <String>{};
  print(s.isEmpty); // true
}
""",
    "isNotEmpty Meth..": r"""
void main() {
  final s = {1};
  print(s.isNotEmpty); // true
}
""",
    "Clear Method": r"""
void main() {
  final s = {1,2,3};
  s.clear();
  print(s); // {}
}
""",

    // --------------------- Constructor ----------------
    "Default Constru..": r"""
class Point {
  int x, y;
  Point(this.x, this.y); // default (generative) constructor
}
void main() {
  print(Point(1,2).x);
}
""",
    "Parameterised Con..": r"""
class User {
  String id;
  String name;
  User({required this.id, required this.name});
}
void main() {
  print(User(id: "1", name: "Budi").name);
}
""",
    "Named Constru..": r"""
class Color {
  final int r, g, b;
  Color(this.r, this.g, this.b);
  Color.black() : r = 0, g = 0, b = 0;
}
void main() {
  print(Color.black().r);
}
""",
    "Constant Constr..": r"""
class Size {
  final int w, h;
  const Size(this.w, this.h);
}
void main() {
  const s = Size(10, 20);
  print(s.w);
}
""",
    "Redirecting Cons..": r"""
class Line {
  final int length;
  Line(this.length);
  Line.short() : this(1); // redirecting
}
void main() {
  print(Line.short().length);
}
""",

    // ------------------------ Enums ------------------
    "Enums": r"""
enum Role { admin, user, guest }
void main() {
  Role r = Role.user;
  print(r.name); // "user"
}
""",

    // ---------------- Getter and Setter --------------
    "Default Getter and Setter": r"""
class Person {
  String name = "Anon"; // memiliki default getter & setter
}
void main() {
  final p = Person();
  p.name = "Budi";  // setter
  print(p.name);    // getter
}
""",
    "Custom Getter & Setter": r"""
class Celsius {
  double _c = 0;
  double get fahrenheit => _c * 9 / 5 + 32;
  set fahrenheit(double f) => _c = (f - 32) * 5 / 9;
}
void main() {
  final t = Celsius();
  t.fahrenheit = 212;
  print(t.fahrenheit); // 212.0 (set lalu get)
}
""",

    // --------------------- Inheritance ---------------
    "Single Inheritance": r"""
class A {
  void hello() => print("Hello from A");
}
class B extends A {}
void main() {
  B().hello();
}
""",
    "Multi-Level Inher..": r"""
class A { void a() => print("A"); }
class B extends A { void b() => print("B"); }
class C extends B { void c() => print("C"); }
void main() {
  final c = C();
  c.a(); c.b(); c.c();
}
""",
    "Hierarchical Inhe..": r"""
class Animal { void sound() => print("..."); }
class Cat extends Animal { @override void sound() => print("Meow"); }
class Dog extends Animal { @override void sound() => print("Woof"); }
void main() {
  Cat().sound();
  Dog().sound();
}
""",
  };

  PracticalsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Practicals", style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: ()  {
              Navigator.pop(context);
            },
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(10),
        itemCount: sections.length,
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemBuilder: (context, index) {
          final section = sections[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Expanded(child: Divider(thickness: 1)),
                  const SizedBox(width: 8),
                  Text(
                    section["title"],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Expanded(child: Divider(thickness: 1)),
                ],
              ),
              const SizedBox(height: 6),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: (section["items"] as List<String>).map((item) {
                    return Container(
                      width: 160,
                      margin: const EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF00C9FF), Color.fromARGB(255, 1, 151, 177)],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            blurRadius: 4,
                            offset: const Offset(2, 2),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            item,
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 6),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                              minimumSize: const Size(double.infinity, 36),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: EdgeInsets.zero,
                              elevation: 0,
                            ),
                            onPressed: () {
                              final code = exampleCodes[item] ??
                                  "// Belum ada contoh kode untuk topik \"$item\".\n// Tambahkan di 'exampleCodes' agar muncul di sini.";
                              showCodeDialog(
                                context,
                                item,
                                code,
                              );
                            },
                            child: const Text("Show"),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

/// Dialog untuk menampilkan kode & salin ke clipboard.
void showCodeDialog(BuildContext context, String title, String code) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 700),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF00D6FB), Color(0xFF007F95)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    IconButton(
                      tooltip: "Copy code",
                      icon: const Icon(Icons.copy, color: Colors.white),
                      onPressed: () {
                        Clipboard.setData(ClipboardData(text: code));
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Code copied!")),
                        );
                      },
                    ),
                    IconButton(
                      tooltip: "Close",
                      icon: const Icon(Icons.close, color: Colors.red),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),

              // Body
              Container(
                color: Colors.white,
                padding: const EdgeInsets.all(12),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SelectableText(
                    code,
                    style: const TextStyle(fontFamily: 'monospace'),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}