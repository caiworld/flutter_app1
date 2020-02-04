import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: <SingleChildCloneableWidget>[
//        ChangeNotifierProvider(
//          create: (_) => CounterModel(),
//        )
        ChangeNotifierProvider.value(value: CounterModel())
      ],
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.green),
        home: Scaffold(
          appBar: AppBar(
            title: Builder(builder: (context) {
              var counter = Provider.of<CounterModel>(context);
              return new Text("Provider ${counter.count.toString()}");
            }),
          ),
          body: Consumer<CounterModel>(
            builder: (context, counter, child) {
              return Column(
                children: <Widget>[
                  new Expanded(
                      child: Center(
                        child: Text(counter.count.toString()),
                      )),
                  Center(
                    child: FlatButton(
                      onPressed: () {
                        print(counter == null);
                        counter.add();
                      },
                      child: Text("+"),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class CounterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CounterModel>(
      builder: (context, counter, child) {
        return Column(
          children: <Widget>[
            new Expanded(
                child: Center(
              child: Text(counter.count.toString()),
            )),
            Center(
              child: FlatButton(
                onPressed: () {
                  print(counter == null);
                  counter.add();
                },
                child: Text("+"),
              ),
            )
          ],
        );
      },
    );
  }
}

class CounterModel extends ChangeNotifier {
  int _count = 0;

  int get count {
    return _count;
  }

  void add() {
    print(_count);
    _count++;
    notifyListeners();
  }
}
