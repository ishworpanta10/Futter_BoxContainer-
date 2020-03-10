import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';

class PdfReaderDemo extends StatefulWidget {
  @override
  _PdfReaderDemoState createState() => _PdfReaderDemoState();
}

class _PdfReaderDemoState extends State<PdfReaderDemo> {
  final String url = "http://www.africau.edu/images/default/sample.pdf";
  PDFDocument _pdf;

  @override
  void initState() {
    super.initState();
    initPdf();
  }

  initPdf() async {
    final doc = await PDFDocument.fromAsset('Files/NSAlinux.pdf');
    setState(() {
      _pdf = doc;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PDF Reader Demo"),
        centerTitle: true,
      ),
      body: Container(
        child: _pdf == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : PDFViewer(document: _pdf),
      ),
    );
  }
}
