import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:paypilot/app/app.locator.dart';
import 'package:paypilot/app/app.router.dart';
import 'package:paypilot/models/business.dart';
import 'package:paypilot/models/invoice.dart';
import 'package:paypilot/models/invoice_item.dart';
import 'package:paypilot/services/business_service.dart';
import 'package:paypilot/services/invoice_service.dart';
import 'package:paypilot/ui/layout/paypilot_theme.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:uuid/uuid.dart';

class InvoiceEditViewModel extends ReactiveViewModel {
  final _invoiceService = locator<InvoiceService>();
  final _navigationService = locator<NavigationService>();
  final _snackbarService = locator<SnackbarService>();
  final _dialogueService = locator<DialogService>();
  final _businessService = locator<BusinessService>();

  bool get isInvoiceValid =>
      invoiceBeingEdited!.invoiceNumber > 0 &&
      invoiceBeingEdited!.customer != null &&
      invoiceBeingEdited!.invoiceItems.isNotEmpty;

  Invoice? invoiceBeingEdited;
  Business? businessBeingEdited;

  InvoiceEditViewModel() {
    businessBeingEdited = _businessService.business;
    invoiceBeingEdited = _invoiceService.invoiceBeingEdited;
  }

  @override
  List<ReactiveServiceMixin> get reactiveServices =>
      [_businessService, _invoiceService];

  void updateInvoiceNumber(String invioceNumber) {
    invoiceBeingEdited!.invoiceNumber = int.parse(invioceNumber);
  }

  Future<void> uploadBusinessLogo() async {
    try {
      final selectImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);

      if (selectImage != null) {
        final imageSize = (await selectImage.readAsBytes()).lengthInBytes;

        final croppedImage = await ImageCropper().cropImage(
            sourcePath: selectImage.path,
            maxHeight: 200,
            maxWidth: 200,
            aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
            compressQuality: imageSize > 6 * 1024 * 1024
                ? 40
                : 100, // <-- test the cropping logic is correct
            uiSettings: [
              AndroidUiSettings(
                  toolbarTitle: 'Crop image',
                  toolbarColor: Colors.white,
                  toolbarWidgetColor: PayPilotTheme.primaryColour,
                  initAspectRatio: CropAspectRatioPreset.square,
                  lockAspectRatio: true),
              IOSUiSettings(
                  title: 'Crop image',
                  minimumAspectRatio: 1.0,
                  aspectRatioLockEnabled: true,
                  resetAspectRatioEnabled: false),
            ]);

        if (croppedImage != null) {
          setBusy(true);

          await _businessService.updateBusinessLogo(File(croppedImage.path));

          await _businessService.getBusiness();

          businessBeingEdited = _businessService.business;

          notifyListeners();
        }
      }
    } on PlatformException catch (e) {
      if (e.code == 'photo_access_denied') {
        final openSettings = await _dialogueService.showConfirmationDialog(
            title: 'Photo access permission required',
            description:
                'To select a business logo image from your phone, please open settings and grant permissions to photos.',
            cancelTitle: 'Cancel',
            confirmationTitle: 'Open Settings');

        if (openSettings != null && openSettings.confirmed) {
          // For permission setup on iOS and Android
          // see https://pub.dev/packages/permission_handler#setup
          await openAppSettings();
        }
      }
    } catch (e) {
      _snackbarService.showSnackbar(message: e.toString());
    } finally {
      setBusy(false);
    }
  }

  Future<void> editInvoiceDate() async {
    final dueDate = await _navigationService.navigateTo(
        Routes.calendarCarouselView,
        arguments: CalendarCarouselViewArguments(
            title: 'Invoice date',
            selectedDate: invoiceBeingEdited!.invoiceDateLocal));

    if (dueDate != null) {
      invoiceBeingEdited!.invoiceDateLocal = dueDate as DateTime;
    }

    notifyListeners();
  }

  Future<void> editDueDate() async {
    final dueDate = await _navigationService.navigateTo(
        Routes.calendarCarouselView,
        arguments: CalendarCarouselViewArguments(
            title: 'Due date', selectedDate: invoiceBeingEdited!.dueDateLocal));

    if (dueDate != null) {
      invoiceBeingEdited!.dueDateLocal = dueDate as DateTime;
    }

    notifyListeners();
  }

  void editCustomer() {
    _navigationService.navigateTo(Routes.customerEditView)?.then((value) => {
          invoiceBeingEdited = _invoiceService.invoiceBeingEdited,
          notifyListeners()
        });
  }

  Future<void> newInvoiceItem() async {
    const uuid = Uuid();
    InvoiceItem newInvoiceItem = InvoiceItem(uuid.v4());

    final invoiceItem = await _navigationService.navigateTo(
        Routes.invoiceItemEditView,
        arguments: InvoiceItemEditViewArguments(invoiceItem: newInvoiceItem));

    if (invoiceItem != null) {
      invoiceBeingEdited!.invoiceItems.add(invoiceItem);
    }

    notifyListeners();
  }

  Future<void> editInvoiceItem(InvoiceItem editInvoiceItem) async {
    final invoiceItem = await _navigationService.navigateTo(
        Routes.invoiceItemEditView,
        arguments: InvoiceItemEditViewArguments(invoiceItem: editInvoiceItem));

    if (invoiceItem != null) {
      editInvoiceItem.name = invoiceItem.name;
      editInvoiceItem.unitCost = invoiceItem.unitCost;
      editInvoiceItem.quantity = invoiceItem.quantity;
      editInvoiceItem.GST = invoiceItem.GST;
    }

    notifyListeners();
  }

  void removeInvoiceItem(String invoiceItemId) {
    invoiceBeingEdited!.invoiceItems
        .removeWhere((item) => item.id == invoiceItemId);

    notifyListeners();
  }

  void saveMessage(String message) {
    invoiceBeingEdited!.message = message;
  }

  Future<void> saveAndPreviewInvoice() async {
    if (isInvoiceValid) {
      try {
        setBusy(true);
        if (invoiceBeingEdited!.id == null) {
          invoiceBeingEdited =
              await _invoiceService.createInvoice(invoiceBeingEdited!);
        } else {
          invoiceBeingEdited =
              await _invoiceService.updateInvoice(invoiceBeingEdited!);
        }
        await _invoiceService.getAllInvoices();
        notifyListeners();

        _navigationService.navigateTo(Routes.invoicePreviewView,
            arguments:
                InvoicePreviewViewArguments(invoice: invoiceBeingEdited!));
      } catch (e) {
        _snackbarService.showSnackbar(message: e.toString());
      } finally {
        setBusy(false);
      }
    }
  }

  Future<void> deleteInvoice(String invoiceId) async {
    try {
      if (invoiceId == 'newInvoice') {
        _navigationService.clearStackAndShow(Routes.invoiceListView);
      } else {
        final dialogueResponse = await _dialogueService.showConfirmationDialog(
            title: 'Confirm delete',
            description: 'Are you sure you want to delete this invoice?',
            barrierDismissible: false,
            confirmationTitle: 'Delete');

        if (dialogueResponse != null && dialogueResponse.confirmed) {
          setBusy(true);

          await _invoiceService.deleteInvoice(invoiceId);

          notifyListeners();

          _navigationService.clearStackAndShow(Routes.invoiceListView);
        }
      }
    } catch (e) {
      _snackbarService.showSnackbar(message: e.toString());
    } finally {
      setBusy(false);
    }
  }
}
