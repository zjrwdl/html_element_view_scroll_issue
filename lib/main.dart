import 'package:flutter/material.dart';

import 'html/youtube/iframe_youtube_player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'HtmlElementView Scroll Issue'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> urlList = [
    "https://www.youtube.com/embed/JmxrMBuCsoI?enablejsapi=1",
    "https://www.youtube.com/embed/LcIAWGJE1a4?enablejsapi=1",
    "https://www.youtube.com/embed/J_S-ENCSNus?enablejsapi=1",
    "https://www.youtube.com/embed/o9lzrqkvCwI?enablejsapi=1",
    "https://www.youtube.com/embed/Y94WHRMPKWE?enablejsapi=1",
    "https://www.youtube.com/embed/p9ZY49JfSnA?enablejsapi=1",
    "https://www.youtube.com/embed/UqmaQAEQ7lE?enablejsapi=1",
    "https://www.youtube.com/embed/C8h0ecBfff8?enablejsapi=1",
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
        alignment: Alignment.center,
        width: 1200,
        child: ListView.builder(
          shrinkWrap: true,
          controller: ScrollController(),
          itemBuilder: (context, index) {
            return item(
              urlList[index],
            );
          },
          itemCount: urlList.length,
        ),
      ),
    );
  }

  Widget item(String url) {
    return Row(
      children: [
        Container(
          height: 300,
          width: 500,
          padding: const EdgeInsets.all(20),
          child: IframeYoutubePlayer(
            url: url,
            usePointerIntercept: false,
          ),
        ),
        const SizedBox(width: 200),
        const Expanded(
          child: Text('you can scroll on this text,but not on the video'),
        ),
      ],
    );
  }
}
