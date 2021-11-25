import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

/// The hove page which hosts the calendar
class MyHomePage extends StatefulWidget {
  /// Creates the home page to display teh calendar widget.
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    void changeState(int index){
      switch(index){
        case 0: {
          Navigator.pushNamed(context, '/groups');
        }break;
        case 1:{
          //This will be the search method
          throw UnimplementedError('Search functionality not implemented yet');
        }break;
        case 2: {
          //Add Method
          // TODO look into the docs of the library to see how to add an event
          throw UnimplementedError('Add functionality not implemented yet');
        }break;
        case 3: {
          // Today
          // TODO Look into the docs on how to do this
          throw UnimplementedError('Today functionality not implemented yet');
        }break;
        case 4 : {
          Navigator.pushNamed(context, '/setting');
        }

      }
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        centerTitle: true,
        actions:<Widget> [
          Padding(padding: EdgeInsets.only(right: 25),
            child: IconButton(
              icon: const Icon(Icons.message),
              tooltip: 'Go to Messages',
              onPressed: () {
                Navigator.pushNamed(context, '/messaging');
              },
            ) ,
            
          )
         ,
          Padding(
            padding: EdgeInsets.only(right: 50) ,
            child:IconButton(
              icon: const Icon(Icons.logout),
              tooltip: 'Logout',
              onPressed: () {
                Navigator.pushNamed(context, '/signIn');
              },
            ),
          )


        ],
      ),
        body: SfCalendar(
          view: CalendarView.month,
          dataSource: MeetingDataSource(_getDataSource()),
          // by default the month appointment display mode set as Indicator, we can
          // change the display mode as appointment using the appointment display
          // mode property
          monthViewSettings: const MonthViewSettings(
              appointmentDisplayMode: MonthAppointmentDisplayMode.appointment),
        ), bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
        icon: Icon(Icons.group),
        label: 'Groups',
        ),
        BottomNavigationBarItem(
        icon: Icon(Icons.search),
        label: 'Search',
        ),
        BottomNavigationBarItem(
        icon: Icon(Icons.add),
        label: 'Add',
        ),
        BottomNavigationBarItem(
        icon: Icon(Icons.calendar_today_sharp),
        label: 'Today',
        ),
        BottomNavigationBarItem(
        icon: Icon(Icons.settings),
        label: 'Settings',
      ),
    ],
    selectedItemColor: Colors.amber[800],
      unselectedItemColor: Colors.amber[800],
      onTap: changeState,

    ),);
  }

  List<Meeting> _getDataSource() {
    final List<Meeting> meetings = <Meeting>[];
    final DateTime today = DateTime.now();
    final DateTime startTime =
    DateTime(today.year, today.month, today.day, 9, 0, 0);
    final DateTime endTime = startTime.add(const Duration(hours: 2));
    meetings.add(Meeting(
        'Conference', startTime, endTime, const Color(0xFF0F8644), false));
    return meetings;
  }
}

/// An object to set the appointment collection data source to calendar, which
/// used to map the custom appointment data to the calendar appointment, and
/// allows to add, remove or reset the appointment collection.
class MeetingDataSource extends CalendarDataSource {
  /// Creates a meeting data source, which used to set the appointment
  /// collection to the calendar
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return _getMeetingData(index).from;
  }

  @override
  DateTime getEndTime(int index) {
    return _getMeetingData(index).to;
  }

  @override
  String getSubject(int index) {
    return _getMeetingData(index).eventName;
  }

  @override
  Color getColor(int index) {
    return _getMeetingData(index).background;
  }

  @override
  bool isAllDay(int index) {
    return _getMeetingData(index).isAllDay;
  }

  Meeting _getMeetingData(int index) {
    final dynamic meeting = appointments![index];
    late final Meeting meetingData;
    if (meeting is Meeting) {
      meetingData = meeting;
    }

    return meetingData;
  }
}

/// Custom business object class which contains properties to hold the detailed
/// information about the event data which will be rendered in calendar.
class Meeting {
  /// Creates a meeting class with required details.
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  /// Event name which is equivalent to subject property of [Appointment].
  String eventName;

  /// From which is equivalent to start time property of [Appointment].
  DateTime from;

  /// To which is equivalent to end time property of [Appointment].
  DateTime to;

  /// Background which is equivalent to color property of [Appointment].
  Color background;

  /// IsAllDay which is equivalent to isAllDay property of [Appointment].
  bool isAllDay;
}

