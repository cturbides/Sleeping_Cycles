/*
There are 6 cycles.
Each one has a estimate duration of 90 to 110 minutes.
The time will be 24h format.

Pseudo-code:

Time = 11:45:26;
ninety_SleepCycles = list[Time+1:30];
hundredTen_SleepCycles = list[Time+1:50];

for(var i = 0; i < 6; i++){
  Time ninety_calculated_time = ninety_SleepCycles[i] + 1:30;
  Time hundredTen_calculated_time = hundredTen_SleepCycles[i] + 1:50;

  ninety_SleepCycles.append(ninety_calculated_time);
  hundredTen_SleepCycles.append(hundredTen_calculated_time);
}

Now I will create a function that take the list of list with dateTime values on it
 * and convert each value from each list into a String with only Time (in 12h format).
 Pseudo-Code:
 ninetySleepCycles; -> List with DateTime values
 hundredTenSleepCycles; -> List with DateTime values

 ninetySleepCyclesStrings = list();
 hundredTenSleepCyclesStrings = list();

 for (var i = 0; i < 7; i++){
   var newTime = "ninetySleepCycles[i].hour:ninetySleepCycles[i].minutes prefix";
 }

 */
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

DateTime timeOfDayToDateTime(TimeOfDay? timeOfDay){
  //Getting the actual date
  final DateTime now =  DateTime.now(); 
  //Returning a dateTime value
  return DateTime(now.year, now.month, now.day, timeOfDay!.hour, timeOfDay.minute);
}

String dateTimeToString(DateTime dateTime) => DateFormat('hh:mm a').format(dateTime);

List<List<String>> timeWrapper(DateTime time){
  //Creating calculated variables
  DateTime ninetyCalcTime = time.add(const Duration(hours: 1, minutes: 30));
  DateTime hundredTenCalcTime = time.add(const Duration(hours: 1, minutes: 50));

  //Creating string calcTime variables
  String ninetyCalcTimeString = DateFormat('hh:mm a').format(ninetyCalcTime);
  String hundredTenCalcTimeString = DateFormat('hh:mm a').format(hundredTenCalcTime);
  
  //Initializating lists with string variables as first values
  List<String> ninetySleepCycles = [ninetyCalcTimeString];
  List<String> hundredTenSleepCycles = [hundredTenCalcTimeString];

  for (var i = 0; i < 5; i++) {
    //Updating calcTimes
    ninetyCalcTime = ninetyCalcTime.add(const Duration(hours: 1, minutes: 30));
    hundredTenCalcTime = hundredTenCalcTime.add(const Duration(hours: 1, minutes: 50));

    //Updating string calcTimes
    ninetyCalcTimeString = DateFormat('hh:mm a').format(ninetyCalcTime);
    hundredTenCalcTimeString = DateFormat('hh:mm a').format(hundredTenCalcTime);

    //Saving strings into each list
    ninetySleepCycles.add(ninetyCalcTimeString);
    hundredTenSleepCycles.add(hundredTenCalcTimeString);
  }

  //returning a list of lists with DateTime values in it.
  return [ninetySleepCycles, hundredTenSleepCycles];
}
