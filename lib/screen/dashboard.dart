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

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
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
              Text(
                data?.type ?? '',
                style: sTxt1,
              ),
              Text(
                '${data?.price ?? ""}',
                style: sTxt1,
              ),
              Text(
                '${data?.participants ?? ""}',
                style: sTxt1,
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
