import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Insults {
  String fapi = 'https://insult.mattbas.org/api/insult.json';
  String sapi = 'https://evilinsult.com/generate_insult.php?lang=en&type=json';
  final String insult;
  Insults({this.insult});
  factory Insults.fromJson(Map<String, dynamic> json) {
    return Insults(
      insult: json['insult'],
    );
  }
  Future getData() async {
    http.Response response = await http.get(fapi);
    String data = response.body;
    var insult = jsonDecode(data);
    String ss = insult['insult'];
    print(ss);
    return ss;
    // return
  }

  Future getData2() async {
    http.Response response = await http.get(sapi);
    String data = response.body;
    var insult = jsonDecode(data);
    return insult['insult'];
  }
}

Future<Insults> fetchAlbum2() async {
  final response = await http
      .get('https://evilinsult.com/generate_insult.php?lang=en&type=json');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.

    return Insults.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
