import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_demo/model/employeeInfo.dart';
import 'package:test_demo/providers/employees.dart';

import '../widgets/employees_list_item.dart';
import 'employeeDetails.dart';

class EmployeeList extends StatefulWidget {
  String? filter;
  List<EmployeeInfo> employees;
   EmployeeList(this.filter,this.employees,{
    Key? key,
  }) : super(key: key);

  @override
  _EmployeeListState createState() => _EmployeeListState();
}

class _EmployeeListState extends State<EmployeeList> {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.employees.length,
        itemBuilder: (ctx, i) {
          return widget.filter == null || widget.filter == ""
              ? InkWell(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EmployeeDetailPage( widget.employees[i])),
              );
            },
              child: EmployeesListItem(widget.employees[i]))
              : widget.employees[i].name
              .toString()
              .toLowerCase()
              .contains(
              widget.filter.toString().toLowerCase()) ||
              widget.employees[i].email
                  .toString()
                  .toLowerCase()
                  .contains(
                  widget.filter.toString().toLowerCase())
              ? InkWell(
            onTap: (){

            },
              child: EmployeesListItem(widget.employees[i]))
              : Container();
        });
  }
}
