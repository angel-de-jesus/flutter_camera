import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class BottomCamera extends StatelessWidget {
  String barcodeScanRes = "";
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(child: Icon(Icons.camera), onPressed: () async{ 
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#A03131', 'Cancelar', false, ScanMode.QR,);
      openNavigations();
      print(barcodeScanRes); 
    });

  }
  void openNavigations() async =>
    await canLaunch(barcodeScanRes) ? await launch(barcodeScanRes) : throw 'Could not launch $barcodeScanRes';
 
}
