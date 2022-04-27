import 'package:changer/app/utils/colors.dart';
import 'package:changer/app/utils/components/date_selector.dart';
import 'package:changer/app/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DateField extends StatefulWidget {
  const DateField({Key? key}) : super(key: key);

  @override
  State<DateField> createState() => _DateFieldState();
}

class _DateFieldState extends State<DateField> {
  String _selectedDate = '';
  String _dateCount = '';
  String _range = '';
  String _rangeCount = '';

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.bottomSheet(
          DateSelector(onSelectionChanged: _onSelectionChanged)),
      child: Container(
        width: AppSizes.percentWidth(100),
        height: AppSizes.percentHeight(5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.grey,
            width: 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.calendar_today_outlined, color: primaryColor),
              Text(
                _range,
                style: TextStyle(
                  fontSize: AppSizes.percentHeight(1.5),
                  fontWeight: FontWeight.w600,
                  color: primaryColor,
                ),
              ),
              Text('Select Date',
                  style: TextStyle(
                      color: primaryColor,
                      fontSize: AppSizes.percentHeight(1.5),
                      fontWeight: FontWeight.w600))
            ],
          ),
        ),
      ),
    );
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      if (args.value is PickerDateRange) {
        _range = '${DateFormat('dd/MM/yyyy').format(args.value.startDate)} -'
            // ignore: lines_longer_than_80_chars
            ' ${DateFormat('dd/MM/yyyy').format(args.value.endDate ?? args.value.startDate)}';
      } else if (args.value is DateTime) {
        _selectedDate = args.value.toString();
      } else if (args.value is List<DateTime>) {
        _dateCount = args.value.length.toString();
      } else {
        _rangeCount = args.value.length.toString();
      }
    });
  }
}
