import 'package:flutter/material.dart';

class PDFMainView extends StatelessWidget {
  const PDFMainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PDF Sample"),
      ),
      body: const Text("PDF"),
    );
  }
}
