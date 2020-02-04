import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PageRoute1 extends StatefulWidget{

  @override
  State createState() {
    return _PageRoute1State();
  }
}

class _PageRoute1State extends State<PageRoute1>{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProviderPageRoute(),
    );
  }
}

class ProviderPageRoute extends StatefulWidget{

  @override
  State createState() {
    return _ProviderPageState();
  }
}

class _ProviderPageState extends State<ProviderPageRoute> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(builder: (_) => ProviderModel()),
      ],
      child: Scaffold(
        appBar: AppBar(
            title: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                var counter =  Provider.of<ProviderModel>(context);
                return new Text("Provider ${counter.count.toString()}");
              },
            )
        ),
        body: CountWidget(),
      ),
    );
  }
}

class CountWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderModel>(builder: (context, counter, _) {
      return new Column(
        children: <Widget>[
          new Expanded(child: new Center(child: new Text(counter.count.toString()))),
          new Center(
            child: new FlatButton(
                onPressed: () {
                  counter.add();
                },
                color: Colors.blue,
                child: new Text("+")),
          )
        ],
      );
    });
  }
}

class ProviderModel extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void add() {
    _count++;
    notifyListeners();
  }
}
