import 'package:code/code.dart' as code;
import 'dart:io';

import 'package:code/register.dart';
import 'package:code/servercreate.dart';
import 'package:code/login.dart';
import 'package:code/logout.dart';

void main(List<String> arguments) {
  print(
      "Enter 1 for register \nEnter 2 for login \nEnter 3 for Server creation");
  final choice = stdin.readLineSync();
  final registration = Registration();
  final createserver = Createserver();
  final login = Login();
  final logout = Logout();
  if (choice == "1") {
    registration.users();
  }
  if (choice == '2') {
    login.userslog();
  }
  if (choice == "3") {
    createserver.servers();
  }
  if (choice == "4") {
    logout.usersout();
  }
}
