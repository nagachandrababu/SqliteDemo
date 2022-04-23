import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_demo/providers/employees.dart';
import 'package:test_demo/screens/employees_list_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Employees>.value(
      value: Employees(context),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
          title: 'Employees List',
          theme: ThemeData(
            primarySwatch: Colors.indigo,
            accentColor: Colors.amber,
          ),
          home: const EmployeesListScreen(),
         ),
    );
  }
}
