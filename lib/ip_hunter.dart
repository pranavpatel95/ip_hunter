
import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'ip_hunter_platform_interface.dart';
import 'package:http/http.dart' as http;

class IpHunter {
  Future<String?> getPlatformVersion() {
    return IpHunterPlatform.instance.getPlatformVersion();
  }

  Future<String> getPublicIPAddress() async {
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

  Future<String> getCity(String ip) async {
    try {
      //50000 hit limit
      final response = await http.get(Uri.parse("https://ipinfo.io/$ip/json"));
      String publicIP = "Couldn't find your requested details.";
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        publicIP = json['city'];
        debugPrint('Public IP Address from the 1st clause: $publicIP');
      } else {
        //10000 hit limit
        final response = await http.get(Uri.parse('https://ipwhois.app/json/'));
        String publicIP = "Couldn't find your requested details.";
        final json = jsonDecode(response.body);
        publicIP = json['city'];
        return publicIP;
      }
      return publicIP;
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> getRegion(String ip) async {
    try {
      //50000 hit limit
      final response = await http.get(Uri.parse("https://ipinfo.io/$ip/json"));
      String publicIP = "Couldn't find your requested details.";
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        publicIP = json['region'];
        debugPrint('Public IP Address from the 1st clause: $publicIP');
      } else {
        //10000 hit limit
        final response = await http.get(Uri.parse('https://ipwhois.app/json/'));
        String publicIP = "Couldn't find your requested details.";
        final json = jsonDecode(response.body);
        publicIP = json['region'];
        return publicIP;
      }
      return publicIP;
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> getPostalCode(String ip) async {
    try {
      //50000 hit limit
      final response = await http.get(Uri.parse("https://ipinfo.io/$ip/json"));
      String publicIP = "Couldn't find your requested details.";
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        publicIP = json['postal'];
        debugPrint('Public IP Address from the 1st clause: $publicIP');
      } else {
        return publicIP;
      }
      return publicIP;
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> getCountry(String ip) async {
    try {
      //50000 hit limit
      final response = await http.get(Uri.parse("https://ipinfo.io/$ip/json"));
      String publicIP = "Couldn't find your requested details.";
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        publicIP = json['country'];
        debugPrint('Public IP Address from the 1st clause: $publicIP');
      } else {
        //10000 hit limit
        final response = await http.get(Uri.parse('https://ipwhois.app/json/'));
        String publicIP = "Couldn't find your requested details.";
        final json = jsonDecode(response.body);
        publicIP = json['city'];
        return publicIP;
      }
      return publicIP;
    } catch (e) {
      return e.toString();
    }
  }
}
