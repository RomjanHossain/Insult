import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

String fapi = 'https://insult.mattbas.org/api/insult';
String sapi = 'https://evilinsult.com/generate_insult.php?lang=en&type=json';

class Insults {
  final String insult;
  Insults({this.insult});
  factory Insults.fromJson(Map<String, dynamic> json) {
    return Insults(
      insult: json['insult'],
    );
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
