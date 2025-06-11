import 'package:flutter/material.dart';
import 'package:flutter_hashtag_picker/flutter_hashtag_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HashtagDemoPage(),
      theme: ThemeData(
        useMaterial3: true,
      ),
    );
  }
}

class HashtagDemoPage extends StatefulWidget {
  const HashtagDemoPage({super.key});

  @override
  State<HashtagDemoPage> createState() => _HashtagDemoPageState();
}

class _HashtagDemoPageState extends State<HashtagDemoPage> {
  List<String> selectedHashtags = [];
  HashtagStyle selectedStyle = HashtagStyle.style1;

  final List<String> hashtags = [
    "Flutter",
    "Dart",
    "OpenAI",
    "AI",
    "MobileDev",
    "DevCommunity",
    "Coding",
    "Startup",
    "Productivity",
    "Technology"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Hashtag Picker Example")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Dropdown for style switching
            Row(
              children: [
                const Text("Hashtag Style: "),
                DropdownButton<HashtagStyle>(
                  value: selectedStyle,
                  items: [
                    DropdownMenuItem(
                      value: HashtagStyle.style1,
                      child: Text('Style 1 (Purple)'),
                    ),
                    DropdownMenuItem(
                      value: HashtagStyle.style2,
                      child: Text('Style 2 (Green)'),
                    ),
                    DropdownMenuItem(
                      value: HashtagStyle.style3,
                      child: Text('Style 3 (Blue Outline)'),
                    ),
                    DropdownMenuItem(
                      value: HashtagStyle.style4,
                      child: Text('Style 4 (Orange Pill)'),
                    ),
                  ],
                  onChanged: (val) {
                    setState(() {
                      selectedStyle = val ?? HashtagStyle.style1;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            HashtagPicker(
              hashtags: hashtags,
              initialSelected: ["Flutter"],
              hashtagsStyle: selectedStyle,
              onChanged: (tags) {
                setState(() {
                  selectedHashtags = tags;
                });
              },
            ),
            const SizedBox(height: 24),
            const Text(
              "Selected Hashtags:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(selectedHashtags.map((t) => "#$t").join(' ')),
          ],
        ),
      ),
    );
  }
}
