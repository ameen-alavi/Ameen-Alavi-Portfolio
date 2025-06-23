/// contact_info_row.dart
/// A reusable widget for displaying a contact info row with icon and text.
///
/// Used in ContactPage to show each contact method with icon and selectable text.
library;

import 'package:flutter/material.dart';

/// A row widget for displaying a contact method with icon and selectable text.
class ContactInfoRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;
  final double iconSize;

  /// Creates a [ContactInfoRow].
  ///
  /// [icon] is the contact icon, [text] is the contact info, [iconColor] is the icon color.
  const ContactInfoRow({
    super.key,
    required this.icon,
    required this.text,
    required this.iconColor,
    required this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor, size: iconSize),
        const SizedBox(width: 8),
        SelectableText(text, style: Theme.of(context).textTheme.bodyLarge),
      ],
    );
  }
}
