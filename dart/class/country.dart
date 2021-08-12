class Country {
  var country = "Japan";
  var city;
  var _anime = "วันพีช";
  static var color = "RED";

  Country(this.city, this._anime);

  Country.japan(String city, String anime)
      : this(city, anime); //Redirect Constructor

  void callHello() {
    print("สวัสดีชาวโลก");
  }

  String callAnime() => this._anime;
}
