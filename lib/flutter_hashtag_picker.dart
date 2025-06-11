library;

import 'package:flutter/material.dart';

/// Preset styles for hashtags
enum HashtagStyle {
  style1, // Purple rounded
  style2, // Green flat
  style3, // Blue outline
  style4, // Orange pill
}

class HashtagPicker extends StatefulWidget {
  final List<String> hashtags;
  final ValueChanged<List<String>> onChanged;
  final List<String>? initialSelected;

  /// Use one of the built-in hashtag styles
  final HashtagStyle hashtagsStyle;

  const HashtagPicker({
    super.key,
    required this.hashtags,
    required this.onChanged,
    this.initialSelected,
    this.hashtagsStyle = HashtagStyle.style1,
  });

  @override
  State<HashtagPicker> createState() => _HashtagPickerState();
}

class _HashtagPickerState extends State<HashtagPicker> {
  late List<String> _selected;

  @override
  void initState() {
    super.initState();
    _selected = widget.initialSelected ?? [];
  }

  _HashtagChipStyle _getStyle(bool selected) {
    switch (widget.hashtagsStyle) {
      case HashtagStyle.style2:
        return _HashtagChipStyle(
          chipColor: selected ? Colors.green : Colors.green[50]!,
          textStyle: TextStyle(
            color: selected ? Colors.white : Colors.green[900],
            fontWeight: FontWeight.w500,
          ),
          borderRadius: BorderRadius.circular(8),
          border: BorderSide.none,
        );
      case HashtagStyle.style3:
        return _HashtagChipStyle(
          chipColor: selected ? Colors.blue[50]! : Colors.transparent,
          textStyle: TextStyle(
            color: selected ? Colors.blue : Colors.blue[900],
            fontWeight: FontWeight.bold,
          ),
          borderRadius: BorderRadius.circular(18),
          border: BorderSide(
            color: selected ? Colors.blue : Colors.blueGrey,
            width: 1,
          ),
        );
      case HashtagStyle.style4:
        return _HashtagChipStyle(
          chipColor: selected ? Colors.orange : Colors.orange[50]!,
          textStyle: TextStyle(
            color: selected ? Colors.white : Colors.orange[800],
            fontStyle: FontStyle.italic,
          ),
          borderRadius: BorderRadius.circular(40),
          border: BorderSide.none,
        );
      case HashtagStyle.style1:
        return _HashtagChipStyle(
          chipColor: selected ? Colors.purple : Colors.purple[50]!,
          textStyle: TextStyle(
            color: selected ? Colors.white : Colors.purple,
            fontWeight: FontWeight.bold,
          ),
          borderRadius: BorderRadius.circular(16),
          border: BorderSide.none,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 4.0,
      children: widget.hashtags.map((tag) {
        final isSelected = _selected.contains(tag);
        final style = _getStyle(isSelected);
        return ChoiceChip(
          label: Text(
            '#$tag',
            style: style.textStyle,
          ),
          selected: isSelected,
          selectedColor: style.chipColor,
          backgroundColor: style.chipColor,
          shape: RoundedRectangleBorder(
            borderRadius: style.borderRadius,
            side: style.border,
          ),
          onSelected: (selected) {
            setState(() {
              if (isSelected) {
                _selected.remove(tag);
              } else {
                _selected.add(tag);
              }
              widget.onChanged(_selected);
            });
          },
        );
      }).toList(),
    );
  }
}

class _HashtagChipStyle {
  final Color chipColor;
  final TextStyle textStyle;
  final BorderRadius borderRadius;
  final BorderSide border;

  _HashtagChipStyle({
    required this.chipColor,
    required this.textStyle,
    required this.borderRadius,
    required this.border,
  });
}
