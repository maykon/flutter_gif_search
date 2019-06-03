import 'dart:convert';

import 'package:http/http.dart' as http;

Future<Map> getGifs({String search, int offset}) async {
  var searchTerm = search == null ? "" : search;
  const urlTrend =
      "https://api.giphy.com/v1/gifs/trending?api_key=6G2MPSYKkHA6bpCJfIQmDLbM9QUF4fKB&limit=25&rating=G";
  var urlSearch =
      "https://api.giphy.com/v1/gifs/search?api_key=6G2MPSYKkHA6bpCJfIQmDLbM9QUF4fKB&q=$searchTerm&limit=19&offset=$offset&rating=G&lang=pt";

  http.Response response;
  if (search == null) {
    response = await http.get(urlTrend);
  } else {
    response = await http.get(urlSearch);
  }
  return json.decode(response.body);
}
