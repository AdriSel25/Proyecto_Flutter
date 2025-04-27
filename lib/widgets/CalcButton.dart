import 'package:flutter/material.dart';

class DatePickerField extends StatefulWidget {
  final Function(DateTime) onDateSelected;

  const DatePickerField({super.key, required this.onDateSelected});

  @override
  State<DatePickerField> createState() => _DatePickerFieldState();
}

class _DatePickerFieldState extends State<DatePickerField> {
  DateTime? _selectedDate;

  Future<void> _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
      widget.onDateSelected(picked); // Llama a la función y pasa la fecha
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickDate,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          _selectedDate != null
              ? "${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}"
              : 'Selecciona una fecha',
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
