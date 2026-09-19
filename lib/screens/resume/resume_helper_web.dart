/// Web-only helpers for opening and downloading PDF files.

import 'dart:html' as html;

/// Builds the correct URL for an asset on GitHub Pages.
///
/// The portfolio is hosted at:
/// /Ameen-Alavi-Portfolio/
///
/// Using document.baseUri makes this work correctly with
/// Flutter web and GoRouter routes.
String _assetUrl(String path) {
  final baseUri = Uri.parse(html.document.baseUri ?? '');
  return baseUri.resolve(path).toString();
}

/// Opens a PDF in a new browser tab.
void openPdfInNewTab(String path) {
  final url = _assetUrl(path);
  html.window.open(url, '_blank');
}

/// Triggers a download of the PDF file in the browser.
void downloadPdf(String path, String filename) {
  final url = _assetUrl(path);

  final anchor = html.AnchorElement(href: url)
    ..setAttribute('download', filename)
    ..style.display = 'none';

  html.document.body?.append(anchor);
  anchor.click();
  anchor.remove();
}
