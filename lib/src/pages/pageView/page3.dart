import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
     return Column(
      children: [
        FloatingActionButton(child: Icon(Icons.camera), onPressed: () async {
          String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode('#A03131','Cancelar',false,ScanMode.QR,);
          openNavigations(barcodeScanRes);
        },
        ),
        
      ],
    );

  }
   
  void openNavigations(String barcodeScanRes) async =>
    await canLaunch(barcodeScanRes) ? await launch(barcodeScanRes) : throw 'Could not launch $barcodeScanRes';
 
}

 