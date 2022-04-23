import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:test_demo/core/response/users_list_api_response.dart';
import 'package:test_demo/utils/common/app_network_check.dart';
import 'package:test_demo/utils/dialog/alertDialogUtil.dart';

import '../model/employeeInfo.dart';
import '../helper/database_helper.dart';

class Employees with ChangeNotifier {
  List<EmployeeInfo> _items = [];
  bool? _isLoading;
  List<Employee>? _getEmployeesList;

  get isLoading => _isLoading;

  set isLoading(value) {
    _isLoading = value;
    notifyListeners();
  }

  List<Employee>? get getEmployeesList => _getEmployeesList;

  set setEmployeesList(List<Employee>? value) {
    _getEmployeesList = value;
    notifyListeners();
  }

  Employees(BuildContext context) {
    if (_items.isEmpty) {
      callEmployeesListApi(context);
      _isLoading = false;
    }
  }

  Future<List<Employee>?> callEmployeesListApi(BuildContext context) async {
    _isLoading = true;

    bool isNetworkAvail = await NetworkCheck().check();
    List<Employee>? employeesList;
    if (isNetworkAvail) {
      try {
        Map<String, String> headers = {"Content-type": "application/json"};
        const productListURL =
            'http://www.mocky.io/v2/5d565297300000680030a986';
        await http
            .get(Uri.parse(productListURL), headers: headers)
            .then((response) async {
          employeesList = employeeFromJson(response.body);
          employeesList!.forEach((element) {
            addEmployee(element);
          });
        });
      } catch (e) {
        AlertDialogUtil.showAlertDialog(context, 'Connection Error',
            'Our systems are offline, Please try again later.');
        // BotToast.showText(text: 'Please connect Internet');
        isLoading = false;
        print('Not Connected?');
        print(e);
      }
    } else {
      AlertDialogUtil.showAlertDialog(
          context, "Error", 'Network Connection Error !!');
      isLoading = false;
    }
    return employeesList;
  }

  List<EmployeeInfo> get items {
    return [..._items];
  }

  EmployeeInfo findById(String id) {
    return _items.firstWhere((employee) => employee.id == id);
  }

  Future<void> addEmployee(Employee employee) async {
    String id = employee.id.toString();
    String name = employee.name.toString();
    String username = employee.username.toString();
    String email = employee.email.toString();
    String phone = employee.phone.toString();
    String website = employee.website.toString();
    String profileImage = employee.profileImage.toString();
    String address = employee.address!.street.toString() +
        ',' +
        employee.address!.suite.toString() +
        ',' +
        employee.address!.city.toString() +
        ',' +
        employee.address!.zipcode.toString();
    String company = employee.company!= null ? employee.company!.name.toString():"";

    final employeeInfo = EmployeeInfo(
        id: id,
        name: name,
        username: username,
        email: email,
        profileImage: profileImage,
        address: address,
        company: company,
        phone: phone,
        website: website);
    _items.add(employeeInfo);
    notifyListeners();
    DBHelper.insert('employees', {
      'id': employeeInfo.id.toString(),
      'name': employeeInfo.name.toString(),
      'username': employeeInfo.username.toString(),
      'email': employeeInfo.email.toString(),
      'profileImage': employeeInfo.profileImage.toString(),
      'address': employeeInfo.address.toString(),
      'phone': employeeInfo.phone.toString(),
      'website': employeeInfo.website.toString(),
      'company': employeeInfo.company.toString(),
    });
  }

  Future<void> fetchAndSetBooks() async {
    final dataList = await DBHelper.getData('employees');
    _items = dataList
        .map(
          (item) => EmployeeInfo(
            id: item['id'],
            name: item['name'],
            username: item['username'],
            email: item['email'],
            profileImage: item['profileImage'],
            address: item['address'],
            phone: item['phone'],
            website: item['website'],
            company: item['company'],
          ),
        )
        .toList();
    notifyListeners();
  }
}
