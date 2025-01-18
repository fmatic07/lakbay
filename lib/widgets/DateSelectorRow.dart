import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import for date formatting

class DateSelectorRow extends StatefulWidget {
  const DateSelectorRow({Key? key}) : super(key: key);

  @override
  State<DateSelectorRow> createState() => _DateSelectorRowState();
}

class _DateSelectorRowState extends State<DateSelectorRow> {
  DateTime _fromDate = DateTime.now();
  DateTime _toDate = DateTime.now().add(Duration(days: 3));


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildDateSelector(context, 'From', _fromDate),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.015, // 10% of screen width
          ),
          _buildDateSelector(context, 'To', _toDate), // Example: To date is 3 days from now
        ],
      ),
    );
  }

  Widget _buildDateSelector(BuildContext context, String label, DateTime initialDate) {
    return Expanded(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              DateTime? selectedDate = await showDatePicker(
                context: context,
                initialDate: initialDate,
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
              );

              if (selectedDate != null) {
                setState(() {
                  if (label == 'From') {
                    _fromDate = selectedDate;
                  } else {
                    _toDate = selectedDate;
                  }
                });
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF94DBC3),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  DateFormat('MMM d, yyyy').format(initialDate),
                  style: const TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500, // Medium weight
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(Icons.calendar_today),
              ],
            ),
          ),
        ],
      ),
    );
  }
}