
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/post.dart';

const baseUrl = 'https://inshorts.deta.dev/news?category=science';


class RemoteService {
  Future<List<Datum?>?> getData() async {
    final httpClient = http.Client();
    // try {
    var response = await httpClient.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      Post posts = Post?.fromJson(jsonResponse);
      Iterable dataResponse = posts.data;
      List<Datum?> dataList = posts.data.toList();
      return dataList;
    } else
      print("Error");
  }
}
