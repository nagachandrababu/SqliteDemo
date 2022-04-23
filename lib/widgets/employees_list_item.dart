import 'package:flutter/material.dart';
import 'package:test_demo/model/employeeInfo.dart';

class EmployeesListItem extends StatelessWidget {
  EmployeeInfo employeeInfo;
   EmployeesListItem(this.employeeInfo,{Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CircleAvatar(
                radius: 28,
                child: employeeInfo.profileImage != ""
                    ? Image.network(
                  employeeInfo.profileImage!,
                  fit: BoxFit.contain,
                )
                    : Container(),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 2.0, bottom: 2.0),
                      child: Text(
                        employeeInfo.name.toString(),
                        style: const TextStyle(color:Colors.black,
                            fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                     const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(top: 2.0, bottom: 2.0),
                      child: Text(
                         employeeInfo.company.toString(),
                        style: const TextStyle(color:Colors.blueGrey ,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Container(
            height: 1,
            color: Colors.grey.withOpacity(0.3),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }

}
