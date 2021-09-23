import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class DBlocal {
  var dbname = "TCT";

  Future<Database> connectDB() async {
    //หาตำแหน่ง Path ใน mobile device
    var directory = await getApplicationDocumentsDirectory();
    //print(directory);
    var location = join(directory.path, this.dbname);
    //print(location);

    //สร้าง DB File
    var createDB = databaseFactoryIo;
    var db = await createDB.openDatabase(location);
    //print(db);

    return db;
  }

  Future<void> register(name, lastname, email, password) async {
    print('$name, $lastname, $email, $password');

    var db = await this.connectDB();

    var store = intMapStoreFactory.store('users');
    //print(store);

    var user = await store.add(db, {
      'name': name,
      'lastname': lastname,
      'email': email,
      'password': password,
    });

    print(user);

    await store.find(db).then((value) {
      print(value);
    }).catchError((onError) {
      print(onError);
    });

    db.close();
  }

  Future<bool> login(email, password) async {
    var db = await this.connectDB();
    var store = intMapStoreFactory.store('users');

    var user = await store.find(db);

    for (var item in user) {
      if (item['email'] == email && item['password'] == password) {
        return true;
      }
    }
    return false;
  }
}
