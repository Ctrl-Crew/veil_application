import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_dart_scan/qr_code_dart_scan.dart';
import 'package:veil_application/screens/home_screen.dart';

import 'package:veil_application/screens/qr_parser.dart';

class QRScannerPage extends StatefulWidget {
  @override
  _QRScannerPageState createState() => _QRScannerPageState();
}

class _QRScannerPageState extends State<QRScannerPage> {
  String? scannedData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Scanner'),
      ),
      body: QRCodeDartScanView(
        scanInvertedQRCode: true,
        onCapture: (result) {
          setState(() {
            scannedData = result.text;
          });
          if (scannedData != null) {
            _handleScannedData(scannedData!);
          }
        },
      ),
    );
  }

  void _handleScannedData(String data) {
    if (data.endsWith("/meds")) {
      _fetchDataFromUrl(data);
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    }
  }

  Future<void> _fetchDataFromUrl(String url) async {
    try {
      final response = await Dio().get(Uri.parse(url).toString());
      print(response.data);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => QRResultPage(data: response.data),
        ),
      );
    } catch (error) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    }
  }
}
