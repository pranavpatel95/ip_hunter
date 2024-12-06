import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'ip_hunter_platform_interface.dart';

class IpHunter {
  Future<String?> getPlatformVersion() {
    return IpHunterPlatform.instance.getPlatformVersion();
  }

 static Future<String> getPublicIPAddress() async {
    try {
      final response =
          await http.get(Uri.parse("https://api.ipify.org?format=json"));
      String publicIP = "8:8:8:8";
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        publicIP = json['ip'];
        debugPrint('Public IP Address from the 1st clause: $publicIP');
      } else {
        final response = await http.get(Uri.parse('https://ipwhois.app/json/'));
        if (response.statusCode == 200) {
          final json = jsonDecode(response.body);
          publicIP = json['ip'];
          debugPrint('Public IP Address who is in else block: $publicIP');
        }
      }
      return publicIP;
    } catch (e) {
      return e.toString();
    }
  }

  static Future<String> getCity() async {
    try {
      final response = await http.get(Uri.parse('https://ipwhois.app/json/'));
      String publicIP = "Couldn't find your requested details.";
      final json = jsonDecode(response.body);
      publicIP = json['city'];
      return publicIP;
    } catch (e) {
      return e.toString();
    }
  }

  static Future<String> getRegion() async {
    try {
      final response = await http.get(Uri.parse('https://ipwhois.app/json/'));
      String publicIP = "Couldn't find your requested details.";
      final json = jsonDecode(response.body);
      publicIP = json['region'];
      return publicIP;
    } catch (e) {
      return e.toString();
    }
  }

  static Future<String> getCountryCode() async {
    try {
      //10000 hit limit
      final response = await http.get(Uri.parse("https://ipwhois.app/json/"));
      String publicIP = "Couldn't find your requested details.";
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        publicIP = json['country_code'];
        debugPrint('Public IP Address from the 1st clause: $publicIP');
      } else {
        return publicIP;
      }
      return publicIP;
    } catch (e) {
      return e.toString();
    }
  }

  static Future<String> getCountry() async {
    try {
      final response = await http.get(Uri.parse('https://ipwhois.app/json/'));
      String publicIP = "Couldn't find your requested details.";
      final json = jsonDecode(response.body);
      publicIP = json['country'];
      return publicIP;
    } catch (e) {
      return e.toString();
    }
  }

   static Future<String> getCurrency() async {
    try {
      final response = await http.get(Uri.parse('https://ipwhois.app/json/'));
      String publicIP = "Couldn't find your requested details.";
      final json = jsonDecode(response.body);
      publicIP = json['currency_code'];
      return publicIP;
    } catch (e) {
      return e.toString();
    }
  }

static Future<String> getIpType() async {
    try {
      final response = await http.get(Uri.parse('https://ipwhois.app/json/'));
      String publicIP = "Couldn't find your requested details.";
      final json = jsonDecode(response.body);
      publicIP = json['type'];
      return publicIP;
    } catch (e) {
      return e.toString();
    }
  }


}

