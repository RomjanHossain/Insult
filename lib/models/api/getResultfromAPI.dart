import 'package:http/http.dart';

class GetFromApi {
  String fapi = 'https://insult.mattbas.org/api/insult';
  String sapi = 'https://evilinsult.com/generate_insult.php?lang=en&type=json';
  void getRandomInsult() async {
    Response response = await get(fapi);
    Response response2 = await get(sapi);
    print(response.body);
    print(response2.body);
  }
}
