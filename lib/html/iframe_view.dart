import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';

import 'platform_view_registry_real_ui.dart' as ui;

class IframeWidget extends StatefulWidget {
  final String url;
  final bool usePointerIntercept;

  const IframeWidget(
      {super.key, required this.url, this.usePointerIntercept = false});

  @override
  IframeWidgetState createState() => IframeWidgetState();
}

class IframeWidgetState extends State<IframeWidget> {
  late html.IFrameElement element;
  String? _viewType;

  @override
  void initState() {
    super.initState();
    element = html.IFrameElement()
      ..allowFullscreen = true
      ..style.border = 'none'
      ..setAttribute('src', widget.url)
      ..id = 'iframe-${widget.url}';
    _viewType = 'iframe-web-view-${widget.url}';
    ui.PlatformViewRegistry.registerViewFactory(
      _viewType!,
      (viewId) => element,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        HtmlElementView(
          viewType: _viewType!,
        ),
        if (widget.usePointerIntercept)
          PointerInterceptor(child: Container(color: Colors.transparent)),
      ],
    );
  }
}
