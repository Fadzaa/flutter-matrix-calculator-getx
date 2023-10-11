import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_matrix/app/modules/home/controllers/home_controller.dart';
import 'package:getx_matrix/widget_controller/matrix_controller.dart';

import '../helper/themes.dart';

class HoverText extends StatefulWidget {
  final Text widgetText;
  final String keyString;
  const HoverText({
    Key? key,
    required this.widgetText,
    required this.keyString
  }
      ) : super(key: key);

  @override
  State<HoverText> createState() => _HoverTextState();
}

class _HoverTextState extends State<HoverText> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return MouseRegion(
      onEnter: (_) {
        controller.changeHoverState(true, widget.keyString);
      },

      onExit: (_) {
        controller.changeHoverState(false, widget.keyString);
      },
      child: widget.widgetText
    );
  }
}
