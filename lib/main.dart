//import 'package:flutter/material.dart';
//
//void main() => runApp(MyApp());
//
//class MyApp extends StatelessWidget {
//  // This widget is the root of your application.
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'Flutter Demo',
//      theme: ThemeData(
//        // This is the theme of your application.
//        //
//        // Try running your application with "flutter run". You'll see the
//        // application has a blue toolbar. Then, without quitting the app, try
//        // changing the primarySwatch below to Colors.green and then invoke
//        // "hot reload" (press "r" in the console where you ran "flutter run",
//        // or simply save your changes to "hot reload" in a Flutter IDE).
//        // Notice that the counter didn't reset back to zero; the application
//        // is not restarted.
//        primarySwatch: Colors.blue,
//      ),
//      home: MyHomePage(title: 'Flutter Demo Home Page'),
//      // 注册路由表
//      routes: {

////        "new_page": (context) => NewRoute(),
//        "new_page": (context) => EchoRoute(),
//        // 注册首页路由
////        "/": (context) => MyHomePage(
////              title: "Flutter Demo Home Page",
////            ),
//      },
//    );
//  }
//}
//
//class MyHomePage extends StatefulWidget {
//  MyHomePage({Key key, this.title}) : super(key: key);
//
//  // This widget is the home page of your application. It is stateful, meaning
//  // that it has a State object (defined below) that contains fields that affect
//  // how it looks.
//
//  // This class is the configuration for the state. It holds the values (in this
//  // case the title) provided by the parent (in this case the App widget) and
//  // used by the build method of the State. Fields in a Widget subclass are
//  // always marked "final".
//
//  final String title;
//
//  @override
//  _MyHomePageState createState() => _MyHomePageState();
//}
//
//class _MyHomePageState extends State<MyHomePage> {
//  int _counter = 0;
//
//  void _incrementCounter() {
//    setState(() {
//      // This call to setState tells the Flutter framework that something has
//      // changed in this State, which causes it to rerun the build method below
//      // so that the display can reflect the updated values. If we changed
//      // _counter without calling setState(), then the build method would not be
//      // called again, and so nothing would appear to happen.
//      _counter++;
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    // This method is rerun every time setState is called, for instance as done
//    // by the _incrementCounter method above.
//    //
//    // The Flutter framework has been optimized to make rerunning build methods
//    // fast, so that you can just rebuild anything that needs updating rather
//    // than having to individually change instances of widgets.
//    return Scaffold(
//      appBar: AppBar(
//        // Here we take the value from the MyHomePage object that was created by
//        // the App.build method, and use it to set our appbar title.
//        title: Text(widget.title),
//      ),
//      body: Center(
//        // Center is a layout widget. It takes a single child and positions it
//        // in the middle of the parent.
//        child: Column(
//          // Column is also a layout widget. It takes a list of children and
//          // arranges them vertically. By default, it sizes itself to fit its
//          // children horizontally, and tries to be as tall as its parent.
//          //
//          // Invoke "debug painting" (press "p" in the console, choose the
//          // "Toggle Debug Paint" action from the Flutter Inspector in Android
//          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//          // to see the wireframe for each widget.
//          //
//          // Column has various properties to control how it sizes itself and
//          // how it positions its children. Here we use mainAxisAlignment to
//          // center the children vertically; the main axis here is the vertical
//          // axis because Columns are vertical (the cross axis would be
//          // horizontal).
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            Text(
//              'You have clicked the button this many times:',
//            ),
//            Text(
//              '$_counter',
//              style: Theme.of(context).textTheme.display1,
//            ),
//            FlatButton(
//              child: Text("open new route"),
//              textColor: Colors.blue,
//              onPressed: () {
//                // 导航到新路由
////                Navigator.push(context, MaterialPageRoute(builder: (context) {
////                  return RouteTestRoute();
////                }));
//                // 通过路由名打开新的路由页
//                Navigator.pushNamed(context, "new_page",arguments: "hello");
//              },
//            )
//          ],
//        ),
//      ),
//      floatingActionButton: FloatingActionButton(
//        onPressed: _incrementCounter,
//        tooltip: 'Increment',
//        child: Icon(Icons.add),
//      ), // This trailing comma makes auto-formatting nicer for build methods.
//    );
//  }
//}
//////////import 'package:english_words/english_words.dart';
//////////import 'package:flutter/material.dart';
//////////
//////////void main() => runApp(MyApp());
//////////
//////////class MyApp extends StatelessWidget {
//////////  @override
//////////  Widget build(BuildContext context) {
//////////    final wordPair = WordPair.random();
//////////    return MaterialApp(
////////////      title: 'Welcome to Flutter',
////////////      home: Scaffold(
////////////        appBar: AppBar(
////////////          title: Text('Welcome to Flutter'),
////////////        ),
////////////        body: Center(
////////////          child: RandomWords(),
////////////        ),
////////////      ),
//////////      title: 'Startup name generator',
//////////      home: RandomWords(),
//////////    );
//////////  }
//////////}
//////////
//////////class RandomWordsState extends State<RandomWords> {
//////////  final _suggestions = <WordPair>[];
//////////  final _biggerFont = const TextStyle(fontSize: 18.0);
//////////
//////////  @override
//////////  Widget build(BuildContext context) {
////////////    final wordPair = WordPair.random();
////////////    return Text(wordPair.asPascalCase);
//////////    //
//////////    return Scaffold(
//////////      appBar: AppBar(
//////////        title: Text('Startup name generator'),
//////////      ),
//////////      body: _buildSuggestions(),
//////////    );
//////////  }
//////////
//////////  Widget _buildSuggestions() {
//////////    return ListView.builder(
//////////        padding: EdgeInsets.all(16.0),
//////////        itemBuilder: (context, i) {
//////////          if (i.isOdd) {
//////////            // 奇数
//////////            return Divider();
//////////          }
//////////          final index = i ~/ 2;
//////////          if (index >= _suggestions.length) {
//////////            _suggestions.addAll(generateWordPairs().take(10));
//////////          }
//////////          return _buildRow(_suggestions[index]);
//////////        });
//////////  }
//////////
//////////  Widget _buildRow(WordPair pair) {
//////////    return ListTile(
//////////      title: Text(
//////////        pair.asPascalCase,
//////////        style: _biggerFont,
//////////      ),
//////////    );
//////////  }
//////////}
//////////
//////////class RandomWords extends StatefulWidget {
//////////  @override
//////////  State<StatefulWidget> createState() => RandomWordsState();
//////////}
////////
////////import 'package:flutter/material.dart';
////////
////////class MyAppBar extends StatelessWidget {
////////  MyAppBar({this.title});
////////
////////  // Fields in a Widget subclass are always marked "final".
////////
////////  final Widget title;
////////
////////  @override
////////  Widget build(BuildContext context) {
////////    return Container(
////////      height: 56.0, // in logical pixels
////////      padding: const EdgeInsets.symmetric(horizontal: 8.0),
////////      decoration: BoxDecoration(color: Colors.blue[500]),
////////      // Row is a horizontal, linear layout.
////////      child: Row(
////////        // <Widget> is the type of items in the list.
////////        children: <Widget>[
////////          IconButton(
////////            icon: Icon(Icons.menu),
////////            tooltip: 'Navigation menu',
////////            onPressed: null, // null disables the button
////////          ),
////////          // Expanded expands its child to fill the available space.
////////          Expanded(
////////            child: title,
////////          ),
////////          IconButton(
////////            icon: Icon(Icons.search),
////////            tooltip: 'Search',
////////            onPressed: null,
////////          ),
////////        ],
////////      ),
////////    );
////////  }
////////}
////////
////////class MyScaffold extends StatelessWidget {
////////  @override
////////  Widget build(BuildContext context) {
////////    // Material is a conceptual piece of paper on which the UI appears.
////////    return Material(
////////      // Column is a vertical, linear layout.
////////      child: Column(
////////        children: <Widget>[
////////          MyAppBar(
////////            title: Text(
////////              'Example title',
////////              style: Theme.of(context).primaryTextTheme.title,
////////            ),
////////          ),
////////          Expanded(
////////            child: Center(
////////              child: Text('Hello, world!'),
////////            ),
////////          ),
////////        ],
////////      ),
////////    );
////////  }
////////}
////////
////////class TutorialHome extends StatelessWidget {
////////  @override
////////  Widget build(BuildContext context) {
////////    // Scaffold is a layout for the major Material Components.
////////    return Scaffold(
////////      appBar: AppBar(
////////        leading: IconButton(
////////          icon: Icon(Icons.menu),
////////          tooltip: 'Navigation menu',
////////          onPressed: null,
////////        ),
////////        title: Text('Example title'),
////////        actions: <Widget>[
////////          IconButton(
////////            icon: Icon(Icons.search),
////////            tooltip: 'Search',
////////            onPressed: null,
////////          ),
////////        ],
////////      ),
////////      // body is the majority of the screen.
////////      body: Center(
////////        child: Text('Hello, world!'),
////////      ),
//////////      floatingActionButton: FloatingActionButton(
//////////        tooltip: 'Add', // used by assistive technologies
//////////        child: Icon(Icons.add),
//////////        onPressed: null,
//////////      ),
////////      floatingActionButton: Counter(),
////////    );
////////  }
////////}
////////
////////class MyButton extends StatelessWidget {
////////  @override
////////  Widget build(BuildContext context) {
////////    return GestureDetector(
////////      onTap: () {
////////        print('MyButton was tapped!');
////////      },
////////      onDoubleTap: () {
////////        print('MyButton was double tapped');
////////      },
////////      child: Container(
////////        height: 36.0,
////////        padding: const EdgeInsets.all(8.0),
////////        margin: const EdgeInsets.symmetric(horizontal: 8.0),
////////        decoration: BoxDecoration(
////////          borderRadius: BorderRadius.circular(5.0),
////////          color: Colors.lightGreen[500],
////////        ),
////////        child: Center(
////////          child: Text('Engage'),
////////        ),
////////      ),
////////    );
////////  }
////////}
////////
////////class Counter extends StatefulWidget {
////////  // This class is the configuration for the state. It holds the
////////  // values (in this case nothing) provided by the parent and used by the build
////////  // method of the State. Fields in a Widget subclass are always marked "final".
////////
////////  @override
////////  _CounterState createState() => _CounterState();
////////}
////////
////////class _CounterState extends State<Counter> {
////////  int _counter = 0;
////////
////////  void _increment() {
////////    setState(() {
////////      // This call to setState tells the Flutter framework that
////////      // something has changed in this State, which causes it to rerun
////////      // the build method below so that the display can reflect the
////////      // updated values. If you change _counter without calling
////////      // setState(), then the build method won't be called again,
////////      // and so nothing would appear to happen.
////////      _counter++;
////////    });
////////  }
////////
////////  @override
////////  Widget build(BuildContext context) {
////////    // This method is rerun every time setState is called,
////////    // for instance, as done by the _increment method above.
////////    // The Flutter framework has been optimized to make rerunning
////////    // build methods fast, so that you can just rebuild anything that
////////    // needs updating rather than having to individually change
////////    // instances of widgets.
////////    return Row(
////////      children: <Widget>[
//////////        RaisedButton(
//////////          onPressed: _increment,
//////////          child: Text('Increment'),
//////////        ),
//////////        Text('Count: $_counter'),
////////        CounterIncrementor(
////////          onPressed: _increment,
////////        ),
////////        CounterDisplay(
////////          count: _counter,
////////        )
////////      ],
////////    );
////////  }
////////}
////////
////////class CounterDisplay extends StatelessWidget {
////////  CounterDisplay({this.count});
////////
////////  final int count;
////////
////////  @override
////////  Widget build(BuildContext context) {
////////    return Text('Count: $count');
////////  }
////////}
////////
////////class CounterIncrementor extends StatelessWidget {
////////  CounterIncrementor({this.onPressed});
////////
////////  final VoidCallback onPressed;
////////
////////  @override
////////  Widget build(BuildContext context) {
////////    return RaisedButton(
////////      onPressed: onPressed,
////////      child: Text('Increment'),
////////    );
////////  }
////////}
////////
////////void main() {
////////  runApp(MaterialApp(
////////    title: 'My app', // used by the OS task switcher
//////////    home: MyScaffold(),
////////    home: TutorialHome(),
////////  ));
////////}
//////
//////class Product {
//////  const Product({this.name});
//////  final String name;
//////}
//////
//////typedef void CartChangedCallback(Product product, bool inCart);
//////
//////class ShoppingListItem extends StatelessWidget {
//////  ShoppingListItem({Product product, this.inCart, this.onCartChanged})
//////      : product = product,
//////        super(key: ObjectKey(product));
//////
//////  final Product product;
//////  final bool inCart;
//////  final CartChangedCallback onCartChanged;
//////
//////  Color _getColor(BuildContext context) {
//////    // The theme depends on the BuildContext because different parts of the tree
//////    // can have different themes.  The BuildContext indicates where the build is
//////    // taking place and therefore which theme to use.
//////
//////    return inCart ? Colors.black54 : Theme.of(context).primaryColor;
//////  }
//////
//////  TextStyle _getTextStyle(BuildContext context) {
//////    if (!inCart) return null;
//////
//////    return TextStyle(
//////      color: Colors.black54,
//////      decoration: TextDecoration.lineThrough,
//////    );
//////  }
//////
//////  @override
//////  Widget build(BuildContext context) {
//////    return ListTile(
//////      onTap: () {
//////        onCartChanged(product, inCart);
//////      },
//////      leading: CircleAvatar(
//////        backgroundColor: _getColor(context),
//////        child: Text(product.name[0]),
//////      ),
//////      title: Text(product.name, style: _getTextStyle(context)),
//////    );
//////  }
//////}
//////
//////class ShoppingList extends StatefulWidget {
//////  ShoppingList({Key key, this.products}) : super(key: key);
//////
//////  final List<Product> products;
//////
//////  // The framework calls createState the first time a widget appears at a given
//////  // location in the tree. If the parent rebuilds and uses the same type of
//////  // widget (with the same key), the framework re-uses the State object
//////  // instead of creating a new State object.
//////
//////  @override
//////  _ShoppingListState createState() => _ShoppingListState();
//////}
//////
//////class _ShoppingListState extends State<ShoppingList> {
//////  Set<Product> _shoppingCart = Set<Product>();
//////
//////  void _handleCartChanged(Product product, bool inCart) {
//////    setState(() {
//////      // When a user changes what's in the cart, you need to change
//////      // _shoppingCart inside a setState call to trigger a rebuild.
//////      // The framework then calls build, below,
//////      // which updates the visual appearance of the app.
//////
//////      if (!inCart)
//////        _shoppingCart.add(product);
//////      else
//////        _shoppingCart.remove(product);
//////    });
//////  }
//////
//////  @override
//////  Widget build(BuildContext context) {
//////    return Scaffold(
//////      appBar: AppBar(
//////        title: Text('Shopping List'),
//////      ),
//////      body: ListView(
//////        padding: EdgeInsets.symmetric(vertical: 8.0),
//////        children: widget.products.map((Product product) {
//////          return ShoppingListItem(
//////            product: product,
//////            inCart: _shoppingCart.contains(product),
//////            onCartChanged: _handleCartChanged,
//////          );
//////        }).toList(),
//////      ),
//////    );
//////  }
//////}
//////
//////void main() {
//////  runApp(MaterialApp(
//////    title: 'Shopping App',
//////    home: ShoppingList(
//////      products: <Product>[
//////        Product(name: 'Eggs'),
//////        Product(name: 'Flour'),
//////        Product(name: 'Chocolate chips'),
//////      ],
//////    ),
//////  ));
//////}
////
////import 'package:flutter/cupertino.dart';
////import 'package:flutter/material.dart';
////void main(){
////  runApp(MyApp());
////}
////
////
////class MyApp extends StatelessWidget {
////  @override
////  Widget build(BuildContext context) {
////    return Container(
////      decoration: BoxDecoration(color: Colors.red),
////      child: Center(
////        child: Text(
////          'Hello World',
////          textDirection: TextDirection.ltr,
////          style: TextStyle(
////            backgroundColor: Colors.black12,
////            fontSize: 32,
////            color: Colors.blue,
////          ),
////        ),
////      ),
////    );
////  }
////}
//
////import 'package:flutter/material.dart';
////import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;
////
////void main() {
////  debugPaintSizeEnabled = true; // Remove to suppress visual layout
////  runApp(MyApp());
////}
////
////class MyApp extends StatelessWidget {
////  @override
////  Widget build(BuildContext context) {
////    return MaterialApp(
////      title: 'Flutter layout demo',
////      home: Scaffold(
////        appBar: AppBar(
////          title: Text('Flutter layout demo'),
////        ),
////        // Change to buildColumn() for the other column example
////        body: Center(child: buildStar()),
////      ),
////    );
////  }
////
////  Widget buildRow() =>
////      // #docregion Row
////      Row(
////        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
////        children: [
////          Image.asset('images/pic1.jpg'),
////          Image.asset('images/pic2.jpg'),
////          Image.asset('images/pic3.jpg'),
////        ],
////      );
////
////  // #enddocregion Row
////
////  Widget buildColumn() =>
////      // #docregion Column
////      Column(
////        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
////        children: [
////          Expanded(
////            child: Image.asset('images/pic1.jpg'),
////          ),
////          Expanded(
////            child: Image.asset('images/pic2.jpg'),
////          ),
////          Expanded(
////            child: Image.asset('images/pic3.jpg'),
////          ),
////        ],
////      );
////
////  Widget buildStar() => Row(
////        mainAxisSize: MainAxisSize.min,
////        children: <Widget>[
////          Icon(Icons.star, color: Colors.green[500]),
////          Icon(Icons.star, color: Colors.green[500]),
////          Icon(Icons.star, color: Colors.green[500]),
////          Icon(
////            Icons.star,
////          ),
////          Icon(
////            Icons.star,
////          ),
////        ],
////      );
////// #enddocregion Column
////}
//
//class NewRoute extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text("new route"),
//      ),
//      body: Center(
//        child: Text("this is new route"),
//      ),
//    );
//  }
//}
//
//class RouteTestRoute extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Center(
//      child: RaisedButton(
//        onPressed: () async {
//          // 打开‘TipRoute’并等待返回结果
//          var result = await Navigator.push(context,
//              MaterialPageRoute(builder: (context) {
//            return TipRoute(
//              // 路由参数
//              text: "我是提示xxx",
//            );
//          }));
//          // 输出TIpRoute返回的路由结果
//          print("路由返回值：$result");
//        },
//        child: Text("打开提示页"),
//      ),
//    );
//  }
//}
//
//class TipRoute extends StatelessWidget {
//  TipRoute({
//    Key key,
//    @required this.text, // 接收一个text参数
//  }) : super(key: key);
//
//  final String text;
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text("提示"),
//      ),
//      body: Padding(
//        padding: EdgeInsets.all(18.0),
//        child: Column(
//          children: <Widget>[
//            Text(text),
//            RaisedButton(
//              onPressed: () => Navigator.pop(context, "我是返回值"),
//              child: Text("返回"),
//            )
//          ],
//        ),
//      ),
//    );
//  }
//}
//
//class EchoRoute extends StatelessWidget{
//
//  @override
//  Widget build(BuildContext context) {
//    // 获取路由参数
//    var args = ModalRoute.of(context).settings.arguments;
//    print(args);
//    return Scaffold(
//      appBar: AppBar(
//        title: Text("echo route"),
//      ),
//      body: Center(
//        child: Text("this is echo route"),
//      ),
//    );
//  }
//}
import 'package:flutter/material.dart';
import 'package:flutter_app1/test2/encrypt/encrypt_decrypt_test_route.dart';
import 'package:flutter_app1/test2/eventHandleNotification/custom_notification.dart';
import 'package:flutter_app1/test2/eventHandleNotification/gesture_recognizer_test_route.dart';
import 'package:flutter_app1/test2/eventHandleNotification/point_event_listener.dart';
import 'package:flutter_app1/test2/fileNetwork/dio_operation.dart';
import 'package:flutter_app1/test2/fileNetwork/file_operation.dart';
import 'package:flutter_app1/test2/fileNetwork/json_dart_model.dart';
import 'package:flutter_app1/test2/fileNetwork/web_socket.dart';
import 'package:flutter_app1/test2/functionwidget/alert_dialog_test_route.dart';
import 'package:flutter_app1/test2/functionwidget/cartModel.dart';
import 'package:flutter_app1/test2/functionwidget/cart_test_route.dart';
import 'package:flutter_app1/test2/functionwidget/future_builder_test_route.dart';
import 'package:flutter_app1/test2/functionwidget/nav_bar_test_route.dart';
import 'package:flutter_app1/test2/functionwidget/theme_test_route.dart';
import 'package:flutter_app1/test2/functionwidget/will_pop_scope_test_route.dart';
import 'package:flutter_app1/test2/listview/custom_scroll_view.dart';
import 'package:flutter_app1/test2/listview/infinite_listview.dart';
import 'package:flutter_app1/test2/listview/infinite_listview2.dart';
import 'package:flutter_app1/test2/listview/refresh_model.dart';
import 'package:flutter_app1/test2/listview/scroll_controller_test_route.dart';
import 'package:flutter_app1/test2/test.dart';
import 'package:provider/provider.dart';

void main() {
//  debugPaintSizeEnabled = true; // Remove to suppress visual layout
//  runApp(SwitchAndCheckBoxTestRoute());
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: <SingleChildCloneableWidget>[
        ChangeNotifierProvider.value(value: CartModel()),
        ChangeNotifierProvider.value(value: RefreshModel()),
      ],
      child: MaterialApp(
        title: "my app",
        home: TestRoute(),
        routes: <String, WidgetBuilder>{
          "scrollControllerTest": (context) => ScrollControllerTestRoute(),
          "customScrollViewTest": (context) => CustomScrollViewTestRoute(),
          "willPopScopeTest": (context) => WillPopScopeTestRoute(),
          "cartTest": (context) => CartTestRoute(),
          "navBarTest": (context) => NavBarTestRoute(),
          "themeTest": (context) => ThemeTestRoute(),
          "futureBuilderTest": (context) => FutureBuilderTestRoute(),
          "alertDialogTest": (context) => AlertDialogTestRoute(),
          "pointEventListenerTest": (context) => PointEventListenerTestRoute(),
          "gestureRecognizerTest": (context) => GestureRecognizerTestRoute(),
          "notificationTest": (context) => NotificationTestRoute(),
          "fileTest": (context) => FileTestRoute(),
          "dioTest": (context) => DioTestRoute(),
          "webSocket": (context) => WebSocketRoute(),
          "jsonDartModelTest": (context) => JsonDartModelTestRoute(),
          "encryptDecryptTest": (context) => EncryptDecryptTestRoute(),
          "infiniteListView": (context) => InfiniteListView(),
          "infiniteListView2": (context) => InfiniteListView2(),
        },
      ),
    );
  }
}
