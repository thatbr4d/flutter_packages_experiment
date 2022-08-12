import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';

class PDFMainView extends StatefulWidget {
  const PDFMainView({Key? key}) : super(key: key);

  @override
  State<PDFMainView> createState() => _PDFMainViewState();
}

class _PDFMainViewState extends State<PDFMainView> {
  late PdfController pdfController;
  late PdfControllerPinch pdfControllerPinch;
  bool isWindows = false;

  @override
  void initState() {
    if (kIsWeb) {
      isWindows = false;
    } else if (Platform.isWindows) {
      isWindows = true;
    }

    if (isWindows) {
      pdfController = PdfController(
        document: PdfDocument.openAsset('assets/pdf_sample.pdf'),
      );
    } else {
      pdfControllerPinch = PdfControllerPinch(
        document: PdfDocument.openAsset('assets/pdf_sample.pdf'),
      );
    }
    super.initState();
  }

  @override
  void dispose() {
    pdfController.dispose();
    pdfControllerPinch.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PDF Sample"),
      ),
      body: Column(
        children: [
          _getPdfControlsRow(),
          Expanded(
            child: isWindows
                ? PdfView(
                    builders: PdfViewBuilders<DefaultBuilderOptions>(
                      options: const DefaultBuilderOptions(),
                      documentLoaderBuilder: (_) => const Center(child: CircularProgressIndicator()),
                      pageLoaderBuilder: (_) => const Center(child: CircularProgressIndicator()),
                      pageBuilder: _pageBuilder,
                    ),
                    controller: pdfController,
                  )
                : PdfViewPinch(
                    builders: PdfViewPinchBuilders<DefaultBuilderOptions>(
                      options: const DefaultBuilderOptions(),
                      documentLoaderBuilder: (_) => const Center(child: CircularProgressIndicator()),
                      pageLoaderBuilder: (_) => const Center(child: CircularProgressIndicator()),
                      errorBuilder: (_, error) => Center(child: Text(error.toString())),
                    ),
                    controller: pdfControllerPinch,
                  ),
          ),
        ],
      ),
    );
  }

  Widget _getPdfControlsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.navigate_before),
          onPressed: () {
            isWindows
                ? pdfController.previousPage(
                    curve: Curves.ease,
                    duration: const Duration(milliseconds: 100),
                  )
                : pdfControllerPinch.previousPage(
                    curve: Curves.ease,
                    duration: const Duration(milliseconds: 100),
                  );
          },
        ),
        PdfPageNumber(
          controller: isWindows ? pdfController : pdfControllerPinch,
          builder: (_, loadingState, page, pagesCount) => Container(
            alignment: Alignment.center,
            child: Text(
              '$page/${pagesCount ?? 0}',
              style: const TextStyle(fontSize: 22),
            ),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.navigate_next),
          onPressed: () {
            isWindows
                ? pdfController.nextPage(
                    curve: Curves.ease,
                    duration: const Duration(milliseconds: 100),
                  )
                : pdfControllerPinch.nextPage(
                    curve: Curves.ease,
                    duration: const Duration(milliseconds: 100),
                  );
          },
        ),
        IconButton(
          icon: const Icon(Icons.refresh),
          onPressed: () {
            isWindows
                ? pdfController.loadDocument(PdfDocument.openAsset('assets/pdf_sample.pdf'))
                : pdfControllerPinch.loadDocument(PdfDocument.openAsset('assets/pdf_sample.pdf'));
          },
        ),
      ],
    );
  }

  PhotoViewGalleryPageOptions _pageBuilder(
    BuildContext context,
    Future<PdfPageImage> pageImage,
    int index,
    PdfDocument document,
  ) {
    return PhotoViewGalleryPageOptions(
      imageProvider: PdfPageImageProvider(
        pageImage,
        index,
        document.id,
      ),
      minScale: PhotoViewComputedScale.contained * 1,
      maxScale: PhotoViewComputedScale.contained * 2,
      initialScale: PhotoViewComputedScale.contained * 1.0,
      heroAttributes: PhotoViewHeroAttributes(tag: '${document.id}-$index'),
    );
  }
}
