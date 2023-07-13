import 'package:code/code.dart' as code;
import 'dart:io';

import 'package:code/register.dart';
import 'package:code/servercreate.dart';
import 'package:code/login.dart';
import 'package:code/logout.dart';
import 'package:code/message2.dart';
import 'package:code/serverusers.dart';

void main(List<String> arguments) {
  print(
      "Enter 1 for register \nEnter 2 for login \nEnter 3 for Server creation \nEnter 4 for logout \nEnter 5 for dms");
  final choice = stdin.readLineSync();
  final registration = Registration();
  final createserver = Createserver();
  final login = Login();
  final logout = Logout();
  final message = Messages();
  final serverusers = Serverusers();
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
  if (choice == "5") {
    message.dms1();
  }
  if (choice == "6") {
    serverusers.userstojoin();
  }
}

void afterlogin() {}
