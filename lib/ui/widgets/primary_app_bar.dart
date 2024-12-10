import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// this widget is currently not being used.

class PrimaryAppBar extends StatelessWidget with PreferredSizeWidget {
  final Widget? leadingWidget;
  final Widget actionWidget;

  const PrimaryAppBar(
      {super.key, this.leadingWidget, required this.actionWidget});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leadingWidget,
      actions: [actionWidget],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
