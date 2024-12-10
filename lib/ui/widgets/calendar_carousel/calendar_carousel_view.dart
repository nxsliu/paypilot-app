import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:paypilot/ui/layout/paypilot_theme.dart';
import 'package:paypilot/ui/widgets/calendar_carousel/calendar_carousel_viewmodel.dart';
import 'package:stacked/stacked.dart';

class CalendarCarouselView extends StatelessWidget {
  final String title;
  final DateTime selectedDate;

  const CalendarCarouselView(
      {super.key, required this.title, required this.selectedDate});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CalendarCarouselViewModel>.nonReactive(
      viewModelBuilder: () => CalendarCarouselViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          elevation: 4, // default value
          backgroundColor: PayPilotTheme.primaryColour,
          iconTheme: const IconThemeData(color: Colors.black),
          title: Text(title),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: CalendarCarousel(
              selectedDateTime: selectedDate,
              onDayPressed: (DateTime selectedDateTime, events) {
                model.saveDate(selectedDateTime);
              },
            ),
          ),
        ),
      ),
    );
  }
}
