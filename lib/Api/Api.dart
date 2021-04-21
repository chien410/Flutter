
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_app/Model/Account.dart';

import 'Urls.dart';

class Api{

  static Future queryBanner() async {
    Response response;
    response = await Dio().post('$bannerUrl');
    if(response.statusCode == HttpStatus.ok){
      return response.data;
    }
  }
  static Future queryNews() async {
    Response response;
    response = await Dio().post('$newsUrl');
    if(response.statusCode == HttpStatus.ok){
      return response.data;
    }
  }
  static Future queryCoach() async {
    Response response;
    response = await Dio().post('$coachUrl');
    if(response.statusCode == HttpStatus.ok){
      return response.data;
    }
  }
  static Future queryAccount(account, password) async {
    Response response;
    response = await Dio().post('$loginUrl}', queryParameters: {
      "authcode": "@#ALLEC#@%\$!",
      "centercode": "jx01",
      "memtel": "$account",
      "pw": "123",
    });
    if(response.statusCode == HttpStatus.ok){
      return response.data;
    }
  }

}