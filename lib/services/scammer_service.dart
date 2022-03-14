import 'package:flutter/material.dart';
import 'package:scamhunters/models/scammer_model.dart';
import 'package:http/http.dart' as http;

// ignore: constant_identifier_names
const _URL = "http://10.0.2.2:3000/api";

class ScammerService with ChangeNotifier {
  List<Scammer> headLines = [];

  ScammerService() {
    getTopHeadLines();
  }

  getTopHeadLines() async {
    const _url = ('$_URL/scammer');
    final url = Uri.parse(_url);
    final resp = await http.get(url);
    final scammerResponse = scammerResponseFromJson(resp.body);
    headLines.addAll(scammerResponse.scammer);
    notifyListeners();
  }
}
