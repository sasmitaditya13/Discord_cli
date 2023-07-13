// ignore_for_file: invalid_return_type_for_catch_error

import 'dart:io';
import 'package:code/login.dart';

class Messages {
  dms1() {
    dms();
  }

  dms() async {
    final login = Login();
    final path = "storage/users/";
    print("Who is sending the message?");
    final user1 = stdin.readLineSync();
    if ((await Directory(path + user1.toString()).exists())) {
      if (await login.checklog(user1)) {
        print("To whom is the message being sent?");
        final user2 = stdin.readLineSync();

        if ((await Directory(path + user2.toString()).exists())) {
          print("Enter message");
          final message = stdin.readLineSync();
          sendmessages(user1, user2, message);
        } else {
          print("User $user2 does not exist");
        }
      } else {
        print("User $user1 not logged in");
      }
    } else {
      print("User $user1 does not exist");
    }
  }

  sendmessages(final user3, final user4, final mess) {
    final path = "storage/users/";
    File(path + "$user3/dms/$user4.txt".toString())
        .writeAsString(" YOU: $mess", mode: FileMode.append)
        .then((value) => null)
        .catchError((e) => print("Message not sent due to $e"));
    File(path + "$user3/dms/$user4.txt".toString())
        .openWrite(mode: FileMode.append)
        .write("\n");
    File(path + "$user4/dms/$user3.txt".toString())
        .writeAsString(" $user3: $mess", mode: FileMode.append)
        .then((value) => null)
        .catchError((e) => print("Message not sent due to $e"));
    File(path + "$user4/dms/$user3.txt".toString())
        .openWrite(mode: FileMode.append)
        .write("\n");
  }
}
