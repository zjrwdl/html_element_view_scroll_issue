import '../iframe_view.dart';

class IframeYoutubePlayer extends IframeWidget {
  const IframeYoutubePlayer({
    super.key,
    required super.url,
    super.usePointerIntercept,
  });

  @override
  IframeYoutubePlayerState createState() => IframeYoutubePlayerState();
}

class IframeYoutubePlayerState extends IframeWidgetState {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
