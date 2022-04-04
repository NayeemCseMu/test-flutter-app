import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:test_task/constants/api_path.dart';
import 'package:http/http.dart' as http;
import 'package:test_task/module/model/data_model.dart';

import '../../helper/exception.dart';

class DataService {
  DataService._();
  static final DataService _instance = DataService._();
  static DataService get instance => _instance;

  Future callData() async {
    Uri uri = Uri.parse(apiPath);
    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        print(responseData);
        final value = DataModel.fromJson(responseData);
        return value;
      }
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } catch (e) {
      rethrow;
    }
  }
}
