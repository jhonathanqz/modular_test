import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:modular_test/app/modules/health/health_store.dart';

class HealthPage extends StatefulWidget {
  final String title;
  const HealthPage({Key? key, this.title = 'HealthPage'}) : super(key: key);
  @override
  HealthPageState createState() => HealthPageState();
}

class HealthPageState extends State<HealthPage> {
  final HealthStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              const Center(
                child: Text("Health Page"),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    await store.checkServer();
                  },
                  child: Text('Teste health'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
