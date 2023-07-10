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
    if (await Directory(path + uname.toString()).exists()) {
      print("User $uname already exists");
    } else {
      Directory(path + uname.toString())
          .create(recursive: true)
          .then((folder) => print("Registration successful"))
          .catchError((error) => print("Error"));
    }
  }
}
