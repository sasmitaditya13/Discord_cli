import 'dart:io';

class Login {
  userslog() {
    print("Enter number of users to be logged in");
    int number = int.parse(stdin.readLineSync().toString());
    print("Enter username/s");
    int i;
    for (i = 0; i < number; i++) {
      loginuser();
    }
  }

  loginuser() async {
    final path = "storage/users/";
    final uname = stdin.readLineSync();
    final log = "/logged";
    if (await Directory(path + uname.toString()).exists()) {
      if (await Directory(path + uname.toString() + log).exists()) {
        print("User $uname was already logged in");
      } else {
        print("User $uname logged in");
        Directory(path + uname.toString() + log)
            .create(recursive: true)
            .then((folder) => print(""))
            .catchError((error) => print("Unable to login"));
      }
      var duration = const Duration(seconds: 2);
      sleep(duration);
      print("What would you like to do?");
    } else {
      print("User not found");
    }
  }
}
