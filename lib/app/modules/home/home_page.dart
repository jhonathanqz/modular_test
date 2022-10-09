import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:modular_test/app/modules/health/health_store.dart';

import 'home_store.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = 'Home'}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeStore store;

  @override
  void initState() {
    super.initState();
    store = Modular.get<HomeStore>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
      ),
      body: Observer(
        builder: (context) => Text('${store.counter}  home page'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          store.increment();
          //Modular.to.navigate('/health/');
          final HealthStore _controller = Modular.get();
          await _controller.checkServer();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
