void main() {
  //print(callGen(1999));
  //print(callColor("black"));
  callWeb("Facebook", port: 443, protocal: "https");
}

String callGen(int year) => (year >= 1996) ? "Gen Z" : "Gen Y";

int callColor([String newColor = "pink"]) {
  List<dynamic> color = ["red", "green", "blue"];
  color.add(newColor);
  for (var item in color) {
    print(item);
  }
  return color.length;
}

void callWeb(String web, {int port = 80, String protocal = "http"}) =>
    print("$protocal $web : $port");
