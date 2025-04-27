import 'package:flutter_proyect_1/widgets/CalcButton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:date_field/date_field.dart';

void main() {
  runApp(const CalcApp());
}

class CalcApp extends StatelessWidget {
  const CalcApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Proy 1. Articulo 204 Ley CSS',
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Salario Minimo promedio = B/340.00 al mes "
                "\n60% del salario = B/204.00", textAlign: ,
                style: TextStyle(fontSize: 20)),
            Text("Fecha Afiliacion", style: TextStyle(fontSize: 24)),
            SizedBox(width: 300, child:  DatePickerField()),
            Text("Fecha Defuncion",style: TextStyle(fontSize: 24)),
            SizedBox(width: 300, child: const DatePickerField()),
            const SizedBox(child: "",)
            TextButton(onPressed: (){


            }, child: const Text(
              "Calcular Acumulado"
            ))
          ],
        ),

      ),
    );
  }
}

//class Calculo

class DatePickerField extends StatefulWidget {
  const DatePickerField({super.key});

  @override
  _DatePickerFieldState createState() => _DatePickerFieldState();
}

class _DatePickerFieldState extends State<DatePickerField> {
  DateTime? _selectedDate;
  final TextEditingController _dateController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2030),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dateController.text = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextFormField(
        controller: _dateController,
        decoration: InputDecoration(
          labelText: 'Selecciona una fecha',
          suffixIcon: IconButton(
            icon: const Icon(Icons.calendar_today),
            onPressed: () => _selectDate(context),
          ),
        ),
        readOnly: true, // Evita que el teclado aparezca al tocar
        onTap: () => _selectDate(context),
      ),
    );
  }
}
