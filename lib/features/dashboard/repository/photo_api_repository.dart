import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc_application/api/api.dart';
import 'package:flutter_bloc_application/features/dashboard/model/photo_api_model.dart';
import 'package:http/http.dart' as http;

class PhotoApiRepository {
  Future<List<PhotoApiModel>> fetchPhoto() async {
    final url = Uri.parse(photoApi);
    try {
      final response = await http.get(url);
      debugPrint('${response.statusCode}');
      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        return data.map((e) => PhotoApiModel.fromJson(e)).toList();

      } else if (response.statusCode == 400) {
        throw Exception('Bad request. Please check your input and try again.');
      } else if (response.statusCode == 401) {
        throw Exception('Unauthorized access. Please log in again.');
      } else {
        throw Exception(
            'Unexpected error occurred. Status code: ${response.statusCode}');
      }
    } on SocketException {
    // Handles network issues
      throw Exception(
          'No internet connection. Please check your network and try again.');
    } on TimeoutException {
      throw Exception('The request has timed out. Please try again later.');
    } catch (error) {
      throw Exception(error);
    }
  }
}
