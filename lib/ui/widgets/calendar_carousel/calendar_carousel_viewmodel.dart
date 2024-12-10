import 'package:paypilot/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CalendarCarouselViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

/*
  late DateTime dateBeingEdited;

  CalendarCarouselViewModel(DateTime selectDate) {
    // create a new instance of InvoiceItem for editing
    // as we only want to save changes when we click
    // save button and disgard changes when we click
    // the back button
    dateBeingEdited =
        DateTime(selectDate.year, selectDate.month, selectDate.day);
  }
  */

  void saveDate(DateTime selectedDate) {
    _navigationService.back(result: selectedDate);
  }
}
