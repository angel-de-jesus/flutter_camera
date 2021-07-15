import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class Page4 extends StatefulWidget {
  @override
  _MyPage4 createState() => _MyPage4();
}

class _MyPage4 extends State<Page4> {
  String texto2 = "texto en espera!";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 230.0),
          child: Center(
            child: Text(texto2, textAlign: TextAlign.center,),
          ),
        ),
        Padding(padding: EdgeInsets.symmetric(vertical: 147)),
        FloatingActionButton(child: Icon(Icons.camera), onPressed: () async {
          String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode('#A03131','Cancelar',false,ScanMode.QR,);
          setState(() {
            texto2=barcodeScanRes;
          });
          
        },),
        
      ],
    );

    
  }

}
