import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:myapp/components/notification.dart';
import 'package:myapp/components/tasks_page.dart';
import 'package:myapp/components/theme.dart';
import 'package:myapp/components/theme_notifier.dart';
import 'package:myapp/components/widget/button.dart';
import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:timezone/timezone.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  NotificationServices notificationServices = NotificationServices();

  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: SingleChildScrollView(
        child: Column(children: [
          _addTaskBar(context),
          _addDateBar(),
          Text(_selectedDate.toString()),
          Text(_selectedDate.toString()),
          Text(_selectedDate.toString()),
          Text(_selectedDate.toString()),
          Text(_selectedDate.toString()),
          Text(_selectedDate.toString()),
          Text(_selectedDate.toString()),
          Text(_selectedDate.toString()),
          Text(_selectedDate.toString()),
        ]),
      ),
    );
  }

  _appBar(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return AppBar(
      leading: GestureDetector(
        onTap: () {
          themeNotifier.toggleTheme();
          // notificationServices.sendNotifications("This is a notification",
          //     "And This is what a body of notification looks like......");
        },
        child: Icon(
          themeNotifier.isDarkMode ? Icons.light_mode : Icons.dark_mode,
          size: 23,
          color: Theme.of(context).colorScheme.inverseSurface,
        ),
      ),
      actions: const [
        CircleAvatar(
          backgroundImage: AssetImage("images/user_avatar.png"),
        ),
        SizedBox(
          width: 20,
        )
      ],
      backgroundColor: Theme.of(context).colorScheme.background,
      // title: Text(widget.title),
    );
  }

  _addTaskBar(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15, top: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat.yMMMEd().format(DateTime.now()),
                style: subHeadingStyle,
              ),
              Text(
                "Today",
                style: headingStyle,
              ),
            ],
          ),
          MyButton(
            icon: true,
            label: 'Add task',
            onTap: () => Get.to(() => const AddTaskPage()),
          ),
        ],
      ),
    );
  }

  _addDateBar() {
    return Container(
      margin: const EdgeInsets.only(left: 5, top: 8),
      child: DatePicker(
        DateTime.now(),
        onDateChange: (selectedDate) {
          setState(() {
            _selectedDate = selectedDate;
          });
        },
        height: 100,
        width: 80,
        initialSelectedDate: DateTime.now(),
        selectionColor: primaryColor,
        dateTextStyle: GoogleFonts.lato(
            textStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: greyColor,
        )),
        monthTextStyle: GoogleFonts.lato(
            textStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: greyColor,
        )),
        dayTextStyle: GoogleFonts.lato(
            textStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: greyColor,
        )),
      ),
    );
  }
}
