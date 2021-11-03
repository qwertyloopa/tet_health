import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tet_health/models/grid_health_data.dart';

class PatientData extends StatelessWidget {
  const PatientData({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Медицинские данные'),),
      body: GridDashboard()
    );
  }
}
