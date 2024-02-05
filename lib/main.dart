import 'package:flutter/material.dart';
import 'package:flutter_toastr/flutter_toastr.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  void _minusCounter() {
    setState(() {
      _counter--;
    });
  }

  void showTaost(){
  }


  TextEditingController firstNameController = TextEditingController();
  TextEditingController middleNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 150),
              child: TextField(
                controller: firstNameController,
                decoration: InputDecoration(
                  labelText: "Enter First Name",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 150),
              child: TextField(
                controller: middleNameController,
                decoration: InputDecoration(
                  labelText: "Enter Middle Name",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 150),
              child: TextField(
                controller: lastNameController,
                decoration: InputDecoration(
                  labelText: "Enter Last Name",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 150),
                child: ElevatedButton(
                  onPressed: (){
                    FlutterToastr.show("Hello ${firstNameController.text} ${middleNameController.text} ${lastNameController.text}!",
                        context, duration: FlutterToastr.lengthLong, position:  FlutterToastr.top, backgroundColor: Colors.orangeAccent);
                    },
                  child: const Text("Display Name"),
                )),
          ],
        ),

      ),

      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child:Stack(
          alignment: Alignment.bottomRight,
          children: [
            Positioned(
                right: 0,
                child: FloatingActionButton(
                  onPressed: _incrementCounter,
                  tooltip: "Add",
                  child: const Icon(Icons.add),
                )),
            Positioned(
                right: 80,
                child: FloatingActionButton(
                  onPressed: _minusCounter,
                  tooltip: "Deduct",
                  child: const Icon(Icons.remove),
                )),
          ],
        )

      ),
    );
  }
}
