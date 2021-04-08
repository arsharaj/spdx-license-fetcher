import 'dart:convert';
import 'dart:io';
import 'package:xml/xml.dart';

void main(List<String> args) async {
  print('-----------------------------------');
  print('       SPDX License Fetcher        ');
  print('-----------------------------------');
  if (args.isEmpty) {
    print('SPDX license identifier : ');
    var spdx_license_identifier = stdin.readLineSync();
    print('License : $spdx_license_identifier');
    await FetchLicense(
        'https://raw.githubusercontent.com/spdx/license-list-XML/master/src/$spdx_license_identifier.xml');
  } else {
    for (var spdx_license_identifier in args) {
      print('License : $spdx_license_identifier');
      await FetchLicense(
          'https://raw.githubusercontent.com/spdx/license-list-XML/master/src/$spdx_license_identifier.xml');
      print('---------------------------------------------------------------------------------------------');
    }
  }
}

Future<void> FetchLicense(String license_url) async {
  final request = await HttpClient().getUrl(Uri.parse(license_url));
  final response = await request.close();
  await for (var license_text_xml in response.transform(Utf8Decoder())) {
    final document = XmlDocument.parse(license_text_xml).innerText;
    print(document);
  }
}
