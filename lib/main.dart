import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'dart:async';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Intl Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  late DateFormat _dateFormat;
  late DateFormat _timeFormat;

  int count = 0;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    // Инициализация периодического таймера с длительностью 1 секунда
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        // обратный вызов будет выполняться каждые 1 секунду, увеличивая значение счетчика при каждом обратном вызове
        setState(() {
          count++;
        });
      },
    );
    _setLocale('ru');
  }

  @override
  Widget build(BuildContext context) {
    var dateTime = DateTime.now();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Intl Demo Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_dateFormat.format(dateTime)),
            Text(_timeFormat.format(dateTime)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _refresh,
        tooltip: 'Refresh',
        child: const Icon(Icons.refresh),
      ),
    );
  }

  void _setLocale(String locale) {
    _dateFormat = DateFormat.yMMMMd(locale);
    _timeFormat = DateFormat.Hms(locale);
  }

  void _refresh() {
    setState(() {});
  }
}
