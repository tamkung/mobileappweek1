void main() {
  print(callGen(1999)); //เรียกฟังชั่น callGen
  print(callColor("black")); //เรียกฟังชั่น callColor
  callWeb("Facebook", port: 443, protocal: "https"); //เรียกฟังชั่น callWeb
}

String callGen(int year) =>
    (year >= 1996) ? "Gen Z" : "Gen Y"; //เขียนแบบ arrow function และ if แบบสั้น

int callColor([String newColor = "pink"]) {
  List<dynamic> color = ["red", "green", "blue"];
  color.add(newColor);
  for (var item in color) {
    print(item); //แสดงค่าทั้งหมดที่อยู่ใน color
  }
  return color.length;
}

void callWeb(String web,
        {int port = 80,
        String protocal = "http"}) => //ฟังชั่นรับค่าแบบกำหนดชื่อ
    print("$protocal $web : $port");
