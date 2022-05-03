import 'package:flutter/material.dart';
import 'resultScreen.dart';

class HomeSelector extends StatelessWidget {
  final TimeOfDay? time;
  final Function selectTime;
  const HomeSelector(
      {Key? key,
      required this.time,
      required this.selectTime})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Center(
          child: Text(
            "Please select your today's sleeping time",
            style: TextStyle(fontSize: 26),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 14,
        ), //Padding
        ElevatedButton(
            onPressed: () => selectTime(),
            style: ElevatedButton.styleFrom(
                shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(5))),
            child: const Text(
              'Select new Time',
              style: TextStyle(fontSize: 25),
            )),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'or',
          style: TextStyle(fontSize: 26),
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(5))),
            child: Text(
              'Calculate with ${TimeOfDay.now().format(context)}',
              style: const TextStyle(fontSize: 25),
            ),
            onPressed: () => Navigator.push( //Sending to other stateful widget with the option for going back
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        ResultScreen(time: TimeOfDay.now())))),
        const SizedBox(
          height: 20,
        ),
        const Text(
          "In a normal day you should sleep at least\n"
          "4 cycles to feel somewhat rested.\n"
          "Use this app to configure your alarm as best as possible",
          style: TextStyle(fontWeight: FontWeight.w200),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
