import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

void main() {
  return runApp(CalendarApp());
}

/// The app which hosts the home page which contains the calendar on it.
class CalendarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Calendar Demo' ,
    initialRoute: "/",
    routes: {
    '/'       : (context) => Login(),
    '/signIn' : (context) => SignIn() ,
    '/signUp' : (context) => SignUp() ,
    '/home'   : (context)=> MyHomePage(),
    '/friends': (context) => Friends(),
    '/groups' : (context) => Groups(),
    '/messaging' : (context) => Messenger(),
    '/setting' : (context) => Settings(),
    }
    );
  }
}

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
    return Scaffold(
        body: SfCalendar(
          view: CalendarView.month,
          dataSource: MeetingDataSource(_getDataSource()),
          // by default the month appointment display mode set as Indicator, we can
          // change the display mode as appointment using the appointment display
          // mode property
          monthViewSettings: const MonthViewSettings(
              appointmentDisplayMode: MonthAppointmentDisplayMode.appointment),
        ));
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



/// Friends Page which will display all your friends in a list and maybe allow to see your friends calendars
class Friends extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("Friends Page"),
      ),
      body: Center(
        child: Text("Welcome to the Friends Page ") ,
      ),
    );

  }

}
/// Where Friends will be able to message each other
class Messenger extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("Messenger Page"),
      ),
      body: Center(
        child: Text("Welcome to the Messenger Page ") ,
      ),
    );

  }

}


/// The groups page where you will be able to see your groups and maybe group calendars
 class Groups extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("Groups Page"),
      ),
      body: Center(
        child: Text("Welcome to the Groups Page ") ,
      ),
    );

  }

}

/// Login Page
class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("Login Page"),
      ),
      body: Center(
        child: Column(
          children:  <Widget>[
              ElevatedButton(
                child: Text("Sign in"),
              onPressed: () {
                Navigator.pushNamed(context, '/signIn');
              },
            ),
            ElevatedButton(
              child: Text("Sign Up"),
              onPressed: () {
                Navigator.pushNamed(context, '/signUp');
              },
            ),
            ElevatedButton(
              child: Text("Home"),
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
            ),
            ElevatedButton(
              child: Text("Friends"),
              onPressed: () {
                Navigator.pushNamed(context, '/friends');
              },
            ),
            ElevatedButton(
              child: Text("Settings"),
              onPressed: () {
                Navigator.pushNamed(context, '/setting');
              },
            ),
            ElevatedButton(
              child: Text("Groups"),
              onPressed: () {
                Navigator.pushNamed(context, '/groups');
              },
            ),
            ElevatedButton(
              child: Text("Messenger"),
              onPressed: () {
                Navigator.pushNamed(context, '/messaging');
              },
            ),
          ],
        )
      ),
    );

  }

}

/// sign in Page
class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("Sign in Page"),
      ),
      body: Center(
        child: Text("Welcome to the Sign in Page ") ,
      ),
    );

  }

}

/// Sign Up page where the user will enter there info
/// TODO: find out how to have the user login with their google apple and other emails / accounts
/// Prob some API but hey who knows
/// ?AWS MAYBE AWS cognito could be something fun
class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("Sign Up Page"),
      ),
      body: Center(
        child: Text("Welcome to the Sign up Page\n "
            "who wants to make this form?  ") ,
      ),
    );

  }

}

/// Setting page
class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("Settings Page"),
      ),
      body: Center(
        child: Text("Welcome to the settings Page ") ,
      ),
    );

  }

}