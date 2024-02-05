import 'package:flutter/material.dart';
import 'package:flutter_toastr/flutter_toastr.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Details App',
      theme: ThemeData(
        primaryColor: Colors.white,
        appBarTheme: AppBarTheme(
          color: Colors.purpleAccent,
        ),
      ),
      home: UserDetailsScreen(),
    );
  }
}

class UserDetailsScreen extends StatefulWidget {
  @override
  _UserDetailsScreenState createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController middleNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  void showDetailsSnackBar() {
    String firstName = firstNameController.text;
    String middleName = middleNameController.text;
    String lastName = lastNameController.text;

    if (firstName.isNotEmpty && middleName.isNotEmpty && lastName.isNotEmpty) {
      final snackBar = SnackBar(
        content: Text('Name: $firstName $middleName $lastName'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      final snackBar = SnackBar(
        content: Text('Please enter all names'),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details App'),
      ),
      body:
      Padding(
        padding: const EdgeInsets.all(16),
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'C:/Users/USER/desktop/herta.gif', // Replace with the URL of your GIF
              width: 250,
              height: 250,),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: TextField(
                controller: firstNameController,
                decoration: InputDecoration(
                  labelText: 'First Name',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: TextField(
                controller: middleNameController,
                decoration: InputDecoration(
                  labelText: 'Middle Name',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: TextField(
                controller: lastNameController,
                decoration: InputDecoration(
                  labelText: 'Last Name',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,

              ),
              onPressed: (){
                FlutterToastr.show("Hello ${firstNameController.text} ${middleNameController.text} ${lastNameController.text} !",
                    context, duration: FlutterToastr.lengthLong, position:  FlutterToastr.top, backgroundColor: Colors.purpleAccent);

              },
              child: Text('Show Details',
                style: TextStyle(fontWeight: FontWeight.bold,
                color: Colors.white
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
