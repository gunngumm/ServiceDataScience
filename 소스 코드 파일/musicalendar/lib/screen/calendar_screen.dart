import 'package:musicalendar/component/main_calendar.dart';
import 'package:flutter/material.dart';
import 'package:musicalendar/component/schedule_card.dart';
import 'package:musicalendar/component/today_banner.dart';
import 'package:musicalendar/component/schedule_bottom_sheet.dart';
import 'package:musicalendar/const/colors.dart';
import 'package:get_it/get_it.dart';
import 'package:musicalendar/database/drift_database.dart';


class Calendar extends StatefulWidget {
  const Calendar({Key?key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime selectedDate = DateTime.utc(
    DateTime
        .now()
        .year,
    DateTime
        .now()
        .month,
    DateTime
        .now()
        .day,
  );


  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: PRIMARY_COLOR,
        onPressed: (){
          showModalBottomSheet(context: context,isDismissible: true, builder: (_) => ScheduleBottomSheet(selectedDate: selectedDate,),isScrollControlled: true,);
        },
        child: Icon(
          Icons.add,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            MainCalendar(
              selectedDate: selectedDate,
              onDaySelected: onDaySelected,
            ),
            SizedBox(height: 8.0),
            StreamBuilder<List<Schedule>>(
              stream: GetIt.I<LocalDatabase>().watchSchedules(selectedDate),
              builder: (context,snapshot){
                return TodayBanner(selectedDate: selectedDate, count: snapshot.data?.length ?? 0,
                );
              }
            ),

            SizedBox(height: 8.0,),
            Expanded(
                child: StreamBuilder<List<Schedule>>(
                  stream: GetIt.I<LocalDatabase>().watchSchedules(selectedDate),
                  builder: (context,snapshot){
                    if(!snapshot.hasData) {
                      return Container();
                    }
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context,index) {
                        final schedule = snapshot.data![index];
                        return Dismissible(
                          key: ObjectKey(schedule.id),
                          direction: DismissDirection.startToEnd,
                          onDismissed: (DismissDirection direction){
                            GetIt.I<LocalDatabase>().removeSchedule(schedule.id);
                          },
                          child:Padding(
                          padding: const EdgeInsets.only(bottom:8.0,left: 8.0,right: 8.0 ),
                          child: ScheduleCard(
                            startTime: schedule.startTime,
                            endTime: schedule.endTime,
                            content: schedule.content,
                          ),
                        ),
                        );
                      },
                    );
                  }
                ),
            ),
          ],
        ),
      ),
    );
  }

  void onDaySelected(DateTime selectedDate, DateTime focusedDate) {
    setState(() {
      this.selectedDate = selectedDate;
    });
  }
}

