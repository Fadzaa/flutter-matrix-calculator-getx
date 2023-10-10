import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:getx_matrix/helper/themes.dart';
import 'package:getx_matrix/widget_controller/matrix_controller.dart';

//Widget
class ButtonAction extends StatelessWidget {
  const ButtonAction({
    Key? key,
    required this.onTap
  }) : super(key: key);

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MatrixController());
    return  InkWell(
      onTap: onTap,

      child: MouseRegion(
        onEnter: (_) {
          controller.buttonHover.value = true;
        },

        onExit: (_) {
          controller.buttonHover.value = false;
        },
        child: Container(
          width: 306,
          height: 115,
          decoration: BoxDecoration(
              color: controller.buttonHover.value ? colorPrimary : Colors.white,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20)
              )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              SvgPicture.asset("images/icon_back.svg", width: 40, height: 40, color: Color(0xFFDEDEDE),),

              const SizedBox(width: 18,),

              Text("Back", style: tsRunText,),




            ],
          ),
        ),
      ),
    );



  }
}





