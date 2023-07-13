import 'dart:io';
import 'package:code/login.dart';
import 'package:code/register.dart';

class Serverusers {
  userstojoin() async {
    print("Enter 1 to join as moduser and 2 to join as normal user");
    final role = stdin.readLineSync();
    print("Enter number of users to join server");
    int number = int.parse(stdin.readLineSync().toString());
    print("Enter server to join");
    final sname = stdin.readLineSync();
    if (await Directory("storage/servers/" + sname.toString()).exists()) {
      print("Enter username/s");
      int i;
      for (i = 0; i < number; i++) {
        joinuser(role, sname);
      }
    } else {
      print("Server $sname does not exist");
    }
  }

  joinuser(final role, final sname) async {
    final path = "storage/servers/";
    final uname = stdin.readLineSync();
    String rl = "\n";
    if (role == "1") {
      rl = "/modusers/";
    } else if (role == "2") {
      rl = "/users/";
    }
    final register = Registration();
    final login = Login();
    if (await register.checkuser()) {
      if (await login.checklog(uname)) {
        Directory(path + sname + rl + uname.toString())
            .create(recursive: true)
            .then((folder) => print("User $uname joined server "))
            .catchError((error) => print("User $uname unable to join"));
      } else {
        print("User $uname not logged in");
      }
    } else {
      print("User $uname does not exist");
    }
  }
}
