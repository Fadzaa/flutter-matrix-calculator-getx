import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:getx_matrix/app/modules/home/controllers/home_controller.dart';
import 'package:getx_matrix/helper/themes.dart';
import 'package:getx_matrix/widget/btn_action.dart';
import 'package:getx_matrix/widget/hover_text.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../widget/matrix_field.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colorBg,
        body: Stack(
          children: [
            //Top Right
            Positioned(
                top: 0, right: 0, child: SvgPicture.asset("images/logo.svg")),

            //Bottom Left
            Positioned(
                right: 0, bottom: 45,
                child: Row(
                  children: [

                    InkWell(
                        splashColor: Color(0xFF2A2929),
                        highlightColor: Color(0xFF2A2929),
                        onTap: () {
                          controller.resetMatrixValue();
                        },
                        child: Text("Reset",
                          style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                              color: Color(0xFF646464),
                              fontWeight: FontWeight.w500,
                              fontSize: 36
                            )
                          ),
                        )
                    ),

                    SizedBox(width: 60,),


                    ButtonAction(onTap: () => controller.calculate(),)
                  ],
                )
            ),

            Container(
              padding: const EdgeInsets.fromLTRB(66, 75, 0, 53),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(() => Row(
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          controller.isMatrixThree.value = true;
                          controller.resetMatrixValue();
                        },
                          child: HoverText(
                              widgetText: Text("Matrix 3x3",
                                style: tsHeading(isActive: controller.isHover("Matrix 3x3" ) || controller.isMatrixThree.value
                                ),
                              ),
                              keyString: "Matrix 3x3")
                      ),

                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                          child: Text("|",
                            style: tsHeading(isActive: true),
                          )
                      ),


                      InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          controller.isMatrixThree.value = false;
                          controller.resetMatrixValue();
                        },
                          child: HoverText(
                              widgetText: Text("Matrix 2x2",
                                style: tsHeading(isActive: controller.isHover("Matrix 2x2") || !controller.isMatrixThree.value),
                              ),
                              keyString: "Matrix 2x2")
                      ),
                    ],
                  ),
                  ),

                  SizedBox(height: 20,),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      Column(
                        children: [
                          Text("A", style: tsMatrixBody,),
                          // Matrix A
                          MatrixField(
                            controllers: controller.matrixAControllers,
                            label: 'Matrix A',
                          ),
                        ],
                      ),

                      SizedBox(width: 20),

                      Obx(() => Text(controller.stringOperation.value, style: tsMatrixBody,),
                      ),

                      SizedBox(width: 20),

                      // Matrix B

                      Column(
                        children: [
                          Text("B", style: tsMatrixBody,),

                          MatrixField(
                            controllers: controller.matrixBControllers,
                            label: 'Matrix B',
                          ),
                        ],
                      ),

                      SizedBox(width: 60),

                      // Result Matrix
                      Column(
                        children: [
                          Text("C", style: tsMatrixBody,),

                          MatrixField(
                            controllers: controller.resultControllers,
                            label: 'Result Matrix',
                            readOnly: true,
                          ),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: 30,),

                  Container(
                    width: 445,
                    padding: const EdgeInsets.fromLTRB(13, 20, 20, 13),
                    decoration: BoxDecoration(
                      color: colorPrimary,
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child: Obx(() => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            InkWell(
                              highlightColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              onTap: () {
                                controller.onSelectedOperation(OperationType.addition);
                                controller.stringOperation.value = "+";
                              },
                              child: HoverText(
                                  widgetText: Text(
                                    "Addition",
                                    style: tsOperator(
                                        isActive: controller.selectedOperation.value == OperationType.addition
                                            ? true : false || controller.isHover("Addition")),
                                  ),
                                  keyString: "Addition")
                            ),

                            const SizedBox(height: 30,),

                            InkWell(
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                              onTap: () {
                                controller.onSelectedOperation(OperationType.subtraction);
                                controller.stringOperation.value = "-";
                              },
                              child: HoverText(
                                  widgetText: Text(
                                    "Subtraction",
                                    style: tsOperator(
                                        isActive: controller.selectedOperation.value == OperationType.subtraction
                                            ? true : false || controller.isHover("Subtraction")),
                                  ),
                                  keyString: "Subtraction")
                            ),
                          ],
                        ),

                        Column(
                          children: [
                            InkWell(
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                              onTap: () {
                                controller.onSelectedOperation(OperationType.multiplication);
                                controller.stringOperation.value = "x";
                              },
                              child: HoverText(widgetText: Text(
                                "Multiplication",
                                style: tsOperator(
                                    isActive: controller.selectedOperation.value == OperationType.multiplication
                                        ? true : false || controller.isHover("Multiplication")),
                              ), keyString: "Multiplication")
                            ),

                            SizedBox(height: 30,),

                            InkWell(
                              highlightColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              onTap: () {
                                controller.onSelectedOperation(OperationType.division);
                                controller.stringOperation.value = ":";

                              },
                              child: HoverText(widgetText: Text(
                                "Division",
                                style: tsOperator(
                                    isActive: controller.selectedOperation.value == OperationType.division
                                        ? true : false || controller.isHover("Division")),
                              ), keyString: "Division"),
                            ),
                          ],
                        ),
                      ],
                    )),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
