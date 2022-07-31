import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiData{

  static ApiData apiData = ApiData._();
  ApiData._(){

  }

  List<String> _gifUrls = []; // URL listesi
  var entryValue = "";
  var _gifData;

  Future<void> getGIFsData(String readData) async {
    // API'den GIF'leri çekiyoruz
    var _url =
        "https://g.tenor.com/v1/search?q=${readData.replaceAll(" ", "").toLowerCase()}&key=LIVDSRZULELA&limit=8";
    _gifData = await http.get(Uri.parse(_url));
    // 8 tane GIF çektik
    for (int i = 0; i < 8; i++) {
      var apiFetchDataUrl = json.decode(_gifData.body)['results'][i]['media'][0]['tinygif']['url']; //JSON parser
      _gifUrls.add(apiFetchDataUrl);
    }
  }

  List<String> get getGifUrls{
    return _gifUrls;
  }


  void delayFiveSecond(){
    Future.delayed(Duration(seconds: 5),);
  }

  static ApiData get getApiDataSingle{
    return apiData;
  }



}