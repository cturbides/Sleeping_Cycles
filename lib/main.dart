//Imports
import 'package:flutter/material.dart';
import 'mainselector.dart';
import 'resultScreen.dart';

//main function
void main() => runApp(const MyApp()); //Function provided by material.dart

/*
  There are two types of widgets or windows:
  The Stateless -> Can't change their state during runtime.
    Ex: Buttons and images
  The Stateful -> Can change their state during runtime.
    We change their state using the setState function, that allow us make changes in runtime.
 */

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  //Creating an stateful widget that will contain all elements
  @override //Good practice
  Widget build(BuildContext context) {
    //Build method return a Widget
    return MaterialApp(
      title: "Sleeping cycles",
      debugShowCheckedModeBanner: false,
      home: const MainPage(),
      theme: ThemeData(primarySwatch: Colors.amber),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  TimeOfDay? _selectedTime;

  Future<void> _selectTime() async {
    final TimeOfDay? result =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (result != null) {
      setState(() {
        _selectedTime = result;
        //Sending to other stateful widget with the option for going back
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ResultScreen(time: _selectedTime)));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Sleeping Cycles'),
          centerTitle: true,
        ),
        body: HomeSelector(
          time: _selectedTime,
          selectTime: _selectTime,
        ));
  }
}
