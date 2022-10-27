
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key, required this.title});

  final String title;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // int _counter = 4;
  Future<void> _incrementCounter() async {
    await _firestore.collection('increment').doc('inc').update({
      "value": FieldValue.increment(1),
    });

    // setState(() {
    //   _counter++;
    // });
  }

  Future<void> _decrementCounter() async {
    await _firestore.collection('increment').doc('inc').update({
      "value": FieldValue.increment(-1),
    });
  }

  Widget _body(snapshot, context) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return Text(
        'Loading....',
        style: Theme.of(context).textTheme.headline4,
      );
    }
    if (snapshot.data!.exists) {
      Map<String, dynamic>? data = snapshot.data!.data();

      // _counter = data!['value'];

      return Text(
        data!['value'].toString(),
        style: Theme.of(context).textTheme.headline4,
      );
    }
    return const Text('No connection found');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            StreamBuilder(
              stream: _firestore.collection('increment').doc('inc').snapshots(),
              builder: ((context,
                      AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>>
                          snapshot) =>
                  _body(snapshot, context)),
            ),
            // FutureBuilder(
            //   future: _firestore.collection('increment').doc('inc').get(),
            //   builder: ((context,
            //       AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>>
            //           snapshot) =>_body(snapshot, context)),
            // builder: (context,
            //     AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>>
            //         snapshot) {
            //   if (snapshot.connectionState == ConnectionState.done) {
            //     if (snapshot.data!.exists) {
            //       Map<String, dynamic>? data = snapshot.data!.data();

            //       // _counter = data!['value'];

            //       return Text(
            //         data!['value'].toString(),
            //         style: Theme.of(context).textTheme.headline4,
            //       );
            //     }

            //     return Text(snapshot.data!.toString());
            //   }

            //   return const Text('Loading....');
            // },

            // ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 1,
            onPressed: () => _decrementCounter(),
            tooltip: 'Increment',
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            heroTag: 2,
            onPressed: () => _incrementCounter(),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
