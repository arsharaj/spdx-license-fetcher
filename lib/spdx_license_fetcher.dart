// Date - 8 Apr 2021
// Author - Arsharaj Chauhan
// License - MIT License

import 'dart:io';
import 'dart:convert';

import 'package:xml/xml.dart';


// Fetch a single license.
Future<void> SpdxIdentifier() async {
  print('Enter SPDX license identifier : ');
  var spdxLicenseIdentifier = stdin.readLineSync();
  spdxLicenseIdentifier = spdxLicenseIdentifier.toString();
  print('License : $spdxLicenseIdentifier');
  try {
    await FetchLicense('https://raw.githubusercontent.com/spdx/license-list-XML/master/src/$spdxLicenseIdentifier.xml');
  } catch (e) {
    print('Possible errors :-');
    print('1. Not a valid SPDX identifier.');
    print('2. Internet Connection error');
    print('More info : $e');
  }
}

// Fetch multiple licenses
Future<void> SpdxIdentifierMultiple(List<String> args) async {
  for (var spdxLicenseIdentifier in args) {
    print('License : $spdxLicenseIdentifier');
    try {
      await FetchLicense('https://raw.githubusercontent.com/spdx/license-list-XML/master/src/$spdxLicenseIdentifier.xml');
    } catch (e) {
      print('Possible errors :-');
      print('1. Not a valid SPDX identifier.');
      print('2. Internet Connection error');
      print('More info : $e');
    }
    print('-----------------------------\n');
  }
}

// Utility method for fetching the license and converting it into readable form.
Future<void> FetchLicense(String licenseUrl) async {
  final request = await HttpClient().getUrl(Uri.parse(licenseUrl));
  final response = await request.close();
  await for (var licenseTextXml in response.transform(Utf8Decoder())) {
    try {
      final document = XmlDocument.parse(licenseTextXml).text;
      print(document);
    } catch (e) {
      print('Possible errors :-');
      print('1. Not a valid SPDX identifier.');
      print('2. Internet Connection error');
      print('More info : $e');
      exit(1);
    }
  }
}
