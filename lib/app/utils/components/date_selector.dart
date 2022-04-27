import 'package:changer/app/utils/components/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DateSelector extends StatelessWidget {
  final Function? onSelectionChanged;
  const DateSelector({
    Key? key,
    this.onSelectionChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 5,
              spreadRadius: 1,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              dateRangeSelector(),
              CustomButton(onTap: () => Get.back(), label: 'Done')
            ],
          ),
        ));
  }

  Widget dateRangeSelector() {
    return SfDateRangePicker(
      onSelectionChanged: (date) =>
          onSelectionChanged != null ? onSelectionChanged!(date) : null,
      selectionMode: DateRangePickerSelectionMode.range,
      initialSelectedRange: PickerDateRange(
          DateTime.now().subtract(const Duration(days: 4)),
          DateTime.now().add(const Duration(days: 3))),
    );
  }
}
