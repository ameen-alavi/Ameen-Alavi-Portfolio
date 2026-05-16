/// resume_helper_web.dart
/// Web-only helpers for opening and downloading PDF files in the browser.
///
/// This file is only imported on web. For multiplatform support, see the stub helper.
// ignore_for_file: deprecated_member_use, avoid_web_libraries_in_flutter
// TODO: Migrate from 'dart:html' to 'package:web' and 'dart:js_interop' for future compatibility.

import 'dart:html' as html;

/// Opens a PDF in a new browser tab.
void openPdfInNewTab(String url) {
  html.window.open(url, '_blank');
}

/// Triggers a download of the PDF file in the browser.
void downloadPdf(String url, String filename) {
  // ignore: unused_local_variable
  final anchor = html.AnchorElement(href: url)
    ..setAttribute('download', filename)
    ..click();
}
