//Imports
import 'package:flutter_test/flutter_test.dart';
import 'package:sleepingcycles/sleepcycles.dart';

void main() {
  test('Testing timeWrapper function', () {
    var time = DateTime(2022);
    var sample = timeWrapper(time);
    expect(sample, equals([
      ['01:30 AM', '03:00 AM', '04:30 AM', '06:00 AM', '07:30 AM', '09:00 AM', '10:30 AM'],
      ['01:50 AM', '03:40 AM', '05:30 AM', '07:20 AM', '09:10 AM', '11:00 AM', '12:50 PM']]));
  });
}
