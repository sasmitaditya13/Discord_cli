import 'dart:io';

class Logout {
  usersout() {
    print("Enter number of users to be logged out");
    int number = int.parse(stdin.readLineSync().toString());
    print("Enter username/s");
    int i;
    for (i = 0; i < number; i++) {
      logoutuser();
    }
  }

  logoutuser() async {
    final path = "storage/users/";
    final uname = stdin.readLineSync();
    final log = "/logged";
    if (await Directory(path + uname.toString()).exists()) {
      if (await Directory(path + uname.toString() + log).exists()) {
        Directory(path + uname.toString() + log)
            .delete(recursive: true)
            .then((folder) => print("logout successful"))
            .catchError((error) => print("Error"));
      } else {
        print("User was already logged out");
      }
    } else {
      print("User not found");
    }
  }
}
