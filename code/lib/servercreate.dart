import 'dart:io';

class Createserver {
  servers() {
    print("Enter number of servers to be registered");
    int number = int.parse(stdin.readLineSync().toString());
    print("Enter servername/s");
    int i;
    for (i = 0; i < number; i++) {
      registerserver();
    }
  }

  registerserver() async {
    final path = "storage/servers/";
    final sname = stdin.readLineSync();
    if (await Directory(path + sname.toString()).exists()) {
      print("Server $sname already exists");
    } else {
      Directory(path + sname.toString())
          .create(recursive: true)
          .then((folder) => print("Server $sname successfully created"))
          .catchError((error) => print("Error"));
      Directory(path + sname.toString() + "/modusers".toString())
          .create(recursive: true);
      Directory(path + sname.toString() + "/users".toString())
          .create(recursive: true);
      Directory(path + sname.toString() + "/channels".toString())
          .create(recursive: true);
    }
  }
}
