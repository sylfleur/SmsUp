import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  // FirebaseFirestore firestore = FirebaseFirestore.instance;

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  int _counter = 4;

  @override
  void initState() {
    // _firestore.collection('increment').doc('inc').get().then((value) {
    //   // print(value);
    //   if (value.exists) {
    //   Map<String, dynamic>? data = value.data();

    //   int valueInc = data!['value'] ?? 0 ;

    //       setState(() {
    //   _counter = valueInc;
    // });
    //   }
    // });
    super.initState();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            FutureBuilder(
              future: _firestore.collection('increment').doc('inc').get(),
              builder: (context,
                  AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>>
                      snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.data!.exists) {
                    Map<String, dynamic>? data = snapshot.data!.data();

                    // _counter = data!['value'];

                    return Text(
                      data!['value'].toString(),
                      style: Theme.of(context).textTheme.headline4,
                    );
                  }

                  return Text(snapshot.data!.toString());
                }

                return const Text('Loading....');
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
