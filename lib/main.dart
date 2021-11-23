import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DemoApp(),
    );
  }
}

class DemoApp extends StatefulWidget {
  DemoApp({Key? key}) : super(key: key);

  @override
  _DemoAppState createState() => _DemoAppState();
}

class _DemoAppState extends State<DemoApp> {
  bool isScrolled = true;
  List myList = List.generate(
      40,
      (index) => Text(
            'Number $index',
            style: const TextStyle(fontSize: 30),
          ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FloatingActionButton Animation'),
      ),
      body: NotificationListener<UserScrollNotification>(
        onNotification: (notification) {
          if (notification.direction == ScrollDirection.forward) {
            setState(() {
              isScrolled = true;
            });
          } else if (notification.direction == ScrollDirection.reverse) {
            setState(() {
              isScrolled = false;
            });
          }
          return true;
        },
        child: ListView.builder(
            itemCount: myList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: myList[index],
              );
            }),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        isExtended: isScrolled,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        label: const Text('Compose'),
        icon: const Icon(Icons.edit_outlined),
      ),
    );
  }
}
