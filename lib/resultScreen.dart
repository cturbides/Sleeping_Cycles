//Imports
import 'package:flutter/material.dart';
import 'sleepcycles.dart';

//Creating an stateless widget to show up the info
class ResultScreen extends StatefulWidget {
  final TimeOfDay? time;
  const ResultScreen({Key? key, required this.time}) : super(key: key);

  @override
  State<ResultScreen> createState() =>
      _ResultScreenState(); //Saving the time variable in a different var
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    //Initializing all variables
    DateTime timeToWrap = timeOfDayToDateTime(widget.time);
    String formatTime = dateTimeToString(timeToWrap);
    List<List<String>> timeWrapped = timeWrapper(timeToWrap);

    return Scaffold(
      appBar: AppBar(
        title: Text('Sleeping Cycles at $formatTime'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              "Each hour correspond to the end of the current cycle\nand the beginning of the next one."
              "\nUse this app to configure your alarm as best as possible",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w200),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Column(
            children: <Widget>[
              const Center(
                child: Text("Cycles length: 90 minutes",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center),
              ),
              const SizedBox(
                height: 10,
              ),
              for (var item in timeWrapped[0])
                Text(
                  "Cycle no.${timeWrapped[0].indexOf(item) + 1} -> $item",
                  style: const TextStyle(fontSize: 26),
                )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            children: <Widget>[
              const Center(
                child: Text("Cycles length: 110 minutes",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center),
              ),
              const SizedBox(
                height: 10,
              ),
              for (var item in timeWrapped[1])
                Text(
                  "Cycle no.${timeWrapped[1].indexOf(item) + 1} -> $item",
                  style: const TextStyle(fontSize: 26),
                )
            ],
          )
        ],
      ),
    );
  }
}
