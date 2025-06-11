# flutter_hashtag_picker

A customizable Flutter widget for picking hashtags—ideal for social, productivity, or content creation apps.

![Demo of flutter_hashtag_picker](https://your-demo-image-link-here.gif)

## Features

- Select multiple hashtags from a list
- 4 built-in styles (Purple, Green, Blue Outline, Orange Pill)
- Easy integration and flexible usage

## Quick Start

```dart
HashtagPicker(
  hashtags: ['Flutter', 'Dart', 'AI'],
  hashtagsStyle: HashtagStyle.style2,
  onChanged: (selectedTags) {
    print(selectedTags);
  },
)
