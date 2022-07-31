import 'package:flutter/material.dart';
import 'package:gif_api/Singleton.dart';
import '../API/ApiData.dart';
import '../Widgets/GifCards.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //Singleton singleton = Singleton.getSingleton;
  static ApiData apiData = ApiData();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children:<Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
            child: TextField(
              onChanged: (value) {
                apiData.entryValue = value;
              },
              maxLines: 1,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(),
              )),
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                backgroundColor: Colors.blue),
            child: Text(
              "Get GIF's",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () async {
              apiData.getGifUrls.clear();
              await apiData.getGIFsData(apiData.entryValue);
              setState(() {});
            },
          ),
          SizedBox(
            height: 20,
          ),
          apiData.getGifUrls.isEmpty
              ? CircularProgressIndicator()
              : Container(
                height: MediaQuery.of(context).size.height,
                width: 400,
                child: ListView.separated(
                    itemBuilder: (_, int index) {
                      return GifCards(
                        gifUrl: apiData.getGifUrls[index],
                      );
                    },
                    separatorBuilder: (_, __) {
                      return Divider();
                    },
                    itemCount: 8),
              ),
        ],
      ),
    );
  }
}
