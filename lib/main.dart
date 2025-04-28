import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Para formatear fechas

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Formulario con Date Pickers',
        debugShowCheckedModeBanner: false,
        home: DateForm(

        ));
  }
}

class DateForm extends StatefulWidget {
  @override
  _DateFormState createState() => _DateFormState();
}

class _DateFormState extends State<DateForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();
  bool _showDescription = false; // Variable para controlar la visibilidad de la descripción

  DateTime? _startDate;
  DateTime? _endDate;
  int _difference = 0;
  double _acumulado = 0;
  Future<void> _selectDate(BuildContext context, bool isStartDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        if (isStartDate) {
          _startDate = picked;
          _startDateController.text = DateFormat('dd/MM/yyyy').format(picked);
        } else {
          _endDate = picked;
          _endDateController.text = DateFormat('dd/MM/yyyy').format(picked);
        }

        if (_startDate != null && _endDate != null) {
          _difference = _endDate!.difference(_startDate!).inDays ~/ 30;
          _acumulado = _difference * 204;
        }
      });
    }
  }

  void _toggleDescription() {
    setState(() {
      _showDescription = !_showDescription; // Cambia el estado de la descripción
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('')),
      body: SingleChildScrollView(  // Aquí envuelves todo en un ScrollView
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text('Realizar cálculo',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900,),
              textAlign: TextAlign.center),
              const SizedBox(height: 30),
              Container(
                margin: const EdgeInsets.all(10.0),
                width: 300,
                height: 100,
                padding: EdgeInsets.all(2),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all( color: Colors.purpleAccent, width: 0.5 ),
                  
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),

                      spreadRadius: 3,
                      blurRadius: 3,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                
                child: Text("Salario Mensual = B/340.00"
                    "\n60% del salario = B/204.00",
                    style: TextStyle(fontSize: 18)),
              ),
              const SizedBox(height: 30),

              // Campo Fecha Inicio
              TextFormField(
                controller: _startDateController,
                decoration: InputDecoration(
                  labelText: 'Fecha de Afiliación',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.calendar_today),
                    onPressed: () => _selectDate(context, true),
                  ),
                ),
                readOnly: true,
                onTap: () => _selectDate(context, true),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor seleccione una fecha';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              // Campo Fecha Fin
              TextFormField(
                controller: _endDateController,
                decoration: InputDecoration(
                  labelText: 'Fecha de Defunción',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.calendar_today),
                    onPressed: () => _selectDate(context, false),
                  ),
                ),
                readOnly: true,
                onTap: () => _selectDate(context, false),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor seleccione una fecha';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              Container(
                margin: const EdgeInsets.all(10.0),
                width: 250,
                height: 50,
                padding: EdgeInsets.all(2),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.purpleAccent,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(50, 0, 30, 100),

                      spreadRadius: 3,
                      blurRadius: 3,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Text(
                  'Acumulado: B/$_acumulado',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 255, 239, 239),
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                  ),
              ),

              const SizedBox(height: 30),

              InkWell(
                onTap: _toggleDescription,
                child: Align(
                  alignment: Alignment.centerLeft,
                child: Text(
                  'Toca aquí para ver: Artículo 204 de la Ley 462 del 18 de Marzo de 2025',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
              if (_showDescription)
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Prestaciones por muerte en el Componente de Ahorro Personal del Subsistema Mixto. A la muerte de un asegurado o asegurada o del pensionado o pensionada por invalidez o vejez, tendrán derecho a recibir la suma total acumulada y capitalizada en su cuentade ahorro personala la fecha del fallecimiento del causante ola causante de acuerdo con la distribución que determine el Reglamento para el Cálculo de las prestaciones Económicas.',
                    style: TextStyle(fontSize: 15),
                    ),
                    ),
            
            
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _startDateController.dispose();
    _endDateController.dispose();
    super.dispose();
  }
}
