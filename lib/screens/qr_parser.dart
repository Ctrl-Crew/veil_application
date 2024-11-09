import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:veil_application/screens/home_screen.dart';

class QRResultPage extends StatelessWidget {
  final List<dynamic> data;

  QRResultPage({required this.data});

  @override
  Widget build(BuildContext context) {
    final List<dynamic> prescriptions = data;

    return Scaffold(
      appBar: AppBar(
        title: Text('Prescription Details'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: prescriptions.isEmpty
                  ? Center(child: Text('No data available'))
                  : ListView.builder(
                      itemCount: prescriptions.length,
                      itemBuilder: (context, index) {
                        final prescription = prescriptions[index];
                        return PrescriptionCard(prescription: prescription);
                      },
                    ),
            ),
          ),
          Center(
            child: ElevatedButton(
                onPressed: () async {
                  await _savePrescriptionData(prescriptions);
                },
                child: Text("Save Medication")),
          )
        ],
      ),
    );
  }

  List<dynamic> parseData(String data) {
    try {
      return List<dynamic>.from(
          (data.isNotEmpty ? jsonDecode(data) : []) as List);
    } catch (e) {
      return [];
    }
  }

  Future<void> _savePrescriptionData(List<dynamic> prescriptions) async {
    print("Saved\n\n\n\n\n\n\n");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final mem =
        await prefs.setString('prescriptions', jsonEncode(prescriptions));
    if (mem) {
      MaterialPageRoute(
        builder: (context) => HomeScreen(),
      );
    } else {
      print("err saving");
    }
  }
}

class PrescriptionCard extends StatelessWidget {
  final Map<String, dynamic> prescription;

  PrescriptionCard({required this.prescription});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Name: ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Expanded(child: Text(prescription['name'] ?? 'N/A')),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Text(
                  "Dosage: ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Expanded(child: Text(prescription['dosage'] ?? 'N/A')),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Text(
                  "Duration: ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Expanded(child: Text(prescription['duration'] ?? 'N/A')),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Text(
                  "Instructions: ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Expanded(
                    child:
                        Text(prescription['additionalInstructions'] ?? 'N/A')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
