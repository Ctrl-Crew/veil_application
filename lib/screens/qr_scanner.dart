import 'package:flutter/material.dart';
import 'package:qr_code_dart_scan/qr_code_dart_scan.dart';
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
      body: Column(
        children: [
          Expanded(
            child: QRCodeDartScanView(
              scanInvertedQRCode: true,
              onCapture: (result) {
                setState(() {
                  scannedData = result.text;
                });
                if (scannedData != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QRResultPage(data: scannedData!),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
