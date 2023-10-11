import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_matrix/helper/themes.dart';

import '../widget_controller/matrix_controller.dart';

class MatrixField extends GetView<MatrixController> {
  final List<TextEditingController> controllers;
  final String label;
  final bool readOnly;

  MatrixField({
    required this.controllers,
    required this.label,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 350,
      margin: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Obx(
              () => GridView.builder(
            itemCount: controller.isMatrixThree.value ? 9 : 4,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: controller.isMatrixThree.value ? 3 : 2,
            ),
            itemBuilder: (context, index) {
              return GridItem(
                controller: controllers[index],
                readOnly: readOnly,
              );
            },
          ),
        ),
      ),
    );
  }
}

class GridItem extends StatelessWidget {
  final TextEditingController controller;
  final bool readOnly;

  GridItem({required this.controller, this.readOnly = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        color: colorPrimary,
        child: Center(
          child: TextField(
            controller: controller,
            textAlign: TextAlign.center,
            style: tsTextField,
            cursorColor: Colors.white,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            readOnly: readOnly,
            decoration: const InputDecoration(
              hintStyle: TextStyle(color: Colors.white),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
