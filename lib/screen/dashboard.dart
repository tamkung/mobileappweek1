import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobileappweek1/config/constant.dart';
import 'package:http/http.dart' as http;
import 'package:mobileappweek1/model/activity.dart';
import 'package:translator/translator.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  TextEditingController textEditingController = TextEditingController();
  GoogleTranslator translator = GoogleTranslator();
  var output;
  String? dropdownValue;
  var data;

  @override
  void initState() {
    super.initState();
    print('Hello');
    callAPI();

    trans();
  }

  Future<void> callAPI() async {
    var url = Uri.parse('https://www.boredapi.com/api/activity');

    var response = await http.get(url);
    //print(response.statusCode);
    //print(response.body);

    setState(() {
      data = activityFromJson(response.body);
    });
    print(data.activity);
    print(data.type);
    //activity = data.activity!;
    //translate(data.activity);
  }

  static const Map<String, String> lang = {
    "Thai": "th",
    "English": "en",
    "Japan": "ja",
  };

  Future<void> trans() async {
    translator.translate(data.activity, to: "$dropdownValue").then((value) {
      setState(() {
        output = value;
      });
    });
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
    print('True');
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: pColor,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              title: Text(
                'Video',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              leading: Icon(
                Icons.video_call,
                color: Colors.pink,
                size: 35,
              ),
              onTap: () {
                print('Video');
                Navigator.pushNamed(context, 'Video');
              },
            ),
            ListTile(
              title: Text(
                'Image',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              leading: Icon(
                Icons.image,
                color: Colors.green,
                size: 30,
              ),
              onTap: () {
                print('Image');
                Navigator.pushNamed(context, 'Image');
              },
            ),
            ListTile(
              title: Text(
                'Location',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              leading: Icon(
                Icons.near_me,
                color: Colors.blue,
                size: 30,
              ),
              onTap: () {
                print('Location');
                Navigator.pushNamed(context, 'Location');
              },
            ),
            ListTile(
              title: Text(
                'Store',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              leading: Icon(
                Icons.store,
                color: Colors.yellow[700],
                size: 30,
              ),
              onTap: () {
                print('Store');
                Navigator.pushNamed(context, 'Store');
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.api),
            SizedBox(
              width: 10,
            ),
            Text('Dashboard'),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () async {
              callAPI();
              trans();
            },
            icon: Icon(Icons.refresh),
          ),
          IconButton(
            onPressed: () {
              logout();
              Navigator.of(context).pop();
              Navigator.pushNamed(context, 'Index', arguments: []);
            },
            icon: Icon(Icons.logout),
          )
        ],
        backgroundColor: pColor,
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "ทำอะไรดี?",
                style: sTxt1,
              ),
              SizedBox(
                height: 20,
              ),
              Image(
                image: NetworkImage(
                    "https://cdn-icons-png.flaticon.com/512/4850/4850989.png"),
                width: size.width * 0.5,
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                data?.activity ?? "loading...",
                style: sTxt2,
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                'แปลภาษา',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "เลือกภาษา =>",
                    style: TextStyle(fontSize: 18),
                  ),
                  DropdownButton<String>(
                    value: dropdownValue,
                    icon: Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (newValue) {
                      setState(() {
                        dropdownValue = newValue;
                        trans();
                      });
                    },
                    items: lang
                        .map((string, value) {
                          return MapEntry(
                            string,
                            DropdownMenuItem<String>(
                              value: value,
                              child: Text(string),
                            ),
                          );
                        })
                        .values
                        .toList(),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                output == null ? "กรุณาเลือกภาษา" : output.toString(),
                style: TextStyle(
                    color: Colors.green[700],
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
  /*
  void translate(String input) async {
    final translator = GoogleTranslator();
    //final input = "Rearrange";

    translator.translate(data.activity, to: 'th').then((result) {
      print("Source: $input\nTranslated: $result");
      //return result;
      output = translator.toString();
    });
  }*/
}
