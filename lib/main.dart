import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

void main() {
  runApp(const MaterialApp(
    home: MyHomePage(),
  ));
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SfCalendar(
        view: CalendarView.week,
        firstDayOfWeek: 6,
        // initialDisplayDate: DateTime(2021, 03, 01, 08, 30),
        // initialSelectedDate: DateTime(2021, 03, 01, 08, 30),
        dataSource: MeetingDataSource(getAppointments()),
      ),
    );
  }
}

List<Appointment> getAppointments() {
  List<Appointment> meetings = <Appointment>[];
  final DateTime today = DateTime.now();
  final DateTime startTime =
      DateTime(today.year, today.month, today.day, 9, 0, 0);
  final DateTime endTime = startTime.add(const Duration(hours: 2));

  meetings.add(Appointment(
      startTime: startTime,
      endTime: endTime,
      subject: 'conference',
      color: Colors.blue,
      recurrenceRule: 'FREQ=DAILY;COUNT=10',
      isAllDay: true));
  return meetings;
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }
}
