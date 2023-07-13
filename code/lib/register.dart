import 'dart:io';

class Registration {
  users() {
    print("Enter number of users to be registered");
    int number = int.parse(stdin.readLineSync().toString());
    print("Enter username/s");
    int i;
    for (i = 0; i < number; i++) {
      registeruser();
    }
  }

  registeruser() async {
    final path = "storage/users/";
    final uname = stdin.readLineSync();
    final dm = "/dms";
    if (await Directory(path + uname.toString()).exists()) {
      print("User $uname already exists");
    } else {
      Directory(path + uname.toString())
          .create(recursive: true)
          .then((folder) => print("Registration successful"))
          .catchError((error) => print("Error"));
      Directory(path + uname.toString() + dm)
          .create(recursive: true)
          .then((folder) => print(""))
          .catchError((error) => print("Error"));
    }
  }

  checkuser() async {
    final path = "storage/users/";
    final uname = stdin.readLineSync();
    final log = "/logged";
    if (await Directory(path + uname.toString()).exists()) {
      return true;
    } else {
      return false;
    }
  }
}
