import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:transevilz/app/app.dart';
import 'package:transevilz/transfer/models/model_get_trx.dart';
import 'package:transevilz/transfer/transfer.dart';

class ApiRepository {
  final url = Constan.baseUrl;

  Future login(String email, String password) async {
    final response = await http.post(
      Uri.parse("${url}login"),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );
    final statusCode = response.statusCode;
    final output = jsonDecode(response.body);
    final users = output['user'];
    final token = output['accessToken'];
    if (statusCode == 200) {
      final pinUsr = users["userPin"];
      // print(output);
      // print(token);
      // print(pinUsr);
      Helpers.setUserData('fullname', users['fullname']);
      Helpers.setUserData('email', users['email']);
      Helpers.setToken(token);
      Helpers.setUsrPin(pinUsr);
    }
    return statusCode;
  }

  // Create pin
  Future createPin(pin) async {
    String token = '';
    await Helpers.getToken().then((value) => token = value);
    // print(token);
    final response = await http.post(
      Uri.parse("${url}pin"),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        'pin': pin,
      }),
    );
    final statusCode = response.statusCode;
    if (statusCode == 201) {
      // print(statusCode);
      // print(response.body);
      Helpers.setUsrPin(true);
    }
    return statusCode;
  }

  // CREATE TRANSACTIONS
  Future createTrx(pin, String bankCode, String rek, String amount) async {
    String token = '';
    await Helpers.getToken().then((value) => token = value);
    // print(token);
    final response = await http.post(
      Uri.parse("${url}transactions"),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        'pin': pin,
        'bank_code': bankCode,
        'no_rekening': rek,
        'nominal': amount
      }),
    );
    final statusCode = response.statusCode;
    final output = jsonDecode(response.body);
    final data = output['data'];
    if (statusCode == 200) {
      final id = data['transaction_id'];
      // print(statusCode);
      print("ini id trx : $id");
      Helpers.setUserData('trx_id', id);
    }
    return statusCode;
  }

  //GET DATA TRANSACTION BY ID
  Future<InvoiceTrx> getTrx() async {
    String token = '';
    String id = '';
    await Helpers.getToken().then((value) => token = value);
    await Helpers.getUserData('trx_id').then((value) => id = value);
    // print(token);
    final response = await http.post(
      Uri.parse("${url}transactions/$id"),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );
    final statusCode = response.statusCode;
    final output = jsonDecode(response.body);
    if (statusCode == 200) {
      print(output);
      return InvoiceTrx.fromJson(output);
      // print(statusCode);
      // print(output);
      // Helpers.setUserData('trx_id', id);
    }
    throw Exception('Gagal get data');
  }

  // Get list bank penerima
  Future<List<Bank>> getBank() async {
    final response = await http.get(Uri.parse("${url}bank"), headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json; charset=UTF-8',
    });
    final output = jsonDecode(response.body) as List;
    // final statusCode = response.statusCode;
    print(output);
    if (response.statusCode == 200) {
      final dataBank = output.map((e) => Bank.fromJson(e)).toList();
      print(dataBank);
      return dataBank;
    } else {
      throw Exception('Failed to load');
    }
  }
}
