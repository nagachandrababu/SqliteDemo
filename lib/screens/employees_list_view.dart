import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_demo/providers/employees.dart';
import 'package:test_demo/screens/employees_list.dart';

import '../widgets/employees_list_item.dart';

class EmployeesListScreen extends StatefulWidget {
  const EmployeesListScreen({
    Key? key,
  }) : super(key: key);

  @override
  _EmployeesListScreenState createState() => _EmployeesListScreenState();
}

class _EmployeesListScreenState extends State<EmployeesListScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController searchController = TextEditingController();
  String filter = "";
  @override
  void initState() {
    super.initState();
    searchController.addListener(() {
      setState(() {
        filter = searchController.text;
      });
    });
  }


  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employees'),
        centerTitle: true,
      ),
      body: ChangeNotifierProvider<Employees>(
        create: (context) => Employees(context),
        child: Consumer<Employees>(
                child: const Center(
                  child: Text('No Employees List Yet'),
                ),
                builder: (ctx, employees, _) => employees.items.isEmpty
                    ? Container()
                    : Column(
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          _buildSearchView(context),
                          const SizedBox(
                            height: 15,
                          ),
                          Expanded(
                            child:EmployeeList(filter,employees.items),
                          ),
                        ],
                      ),
              ),
      ),
    );
  }

  Widget _buildSearchView(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: searchController,
        decoration: InputDecoration(
          hintText: 'Search...',
          contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        ),
      ),
    );
  }
}
