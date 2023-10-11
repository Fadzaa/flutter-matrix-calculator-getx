import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //Conditional Matrix Size & Type
  RxBool isMatrixThree = true.obs;
  late int matrixSize = isMatrixThree.value ? 9 : 4;
  RxBool buttonHover = false.obs;

  late RxMap<String, bool> hoverStates = <String,bool>{}.obs;

  void changeHoverState(bool hovering, String identifier) {
    hoverStates[identifier] = hovering;
  }

  bool isHover(String identifier) {
    return hoverStates[identifier] ?? false;
  }

  //Initialize List Controller Size
  late List<TextEditingController> matrixAControllers = List.generate(matrixSize, (_) => TextEditingController());
  late List<TextEditingController> matrixBControllers = List.generate(matrixSize, (_) => TextEditingController());
  late List<TextEditingController> resultControllers = List.generate(matrixSize, (_) => TextEditingController());

  //Initialize List Controller Value
  RxList<double> matrixAValues = List.generate(9, (_) => 0.0).obs;
  RxList<double> matrixBValues = List.generate(9, (_) => 0.0).obs;
  RxList<double> resultValues = List.generate(9, (_) => 0.0).obs;

  //Selected Type Operation
  Rx<OperationType> selectedOperation = OperationType.addition.obs;
  RxString stringOperation = "+".obs;

  //Calculation Based on Enumeration Operation Type
  void calculate() {
    switch (selectedOperation.value) {
      case OperationType.addition:
        performAddition();
        break;
      case OperationType.subtraction:
        performSubtraction();
        break;
      case OperationType.multiplication:
        performMultiplication();
        break;
      case OperationType.division:
        performDivision();
        break;
    }
  }

  //Operation Type Switch (Enum)
  void onSelectedOperation(OperationType type) {
    selectedOperation.value = type;
  }

  //Parse / Cast TextEditingController into Double Type
  void parsedMatrixValue() {
    for (int i = 0; i < 9; i++) {
      final double valueA = double.tryParse(matrixAControllers[i].text) ?? 0.0;
      final double valueB = double.tryParse(matrixBControllers[i].text) ?? 0.0;
      matrixAValues[i] = valueA;
      matrixBValues[i] = valueB;
    }
  }

  //Calculate Sum / Addition
  void performAddition() {
    parsedMatrixValue();
    for (int i = 0; i < 9; i++) {
      resultValues[i] = matrixAValues[i] + matrixBValues[i];
      resultControllers[i].text = resultValues[i].toString();
    }
  }

  //Calculate Subtraction
  void performSubtraction() {
    parsedMatrixValue();
    for (int i = 0; i < 9; i++) {
      resultValues[i] = matrixAValues[i] - matrixBValues[i];
      resultControllers[i].text = resultValues[i].toString();
    }
  }

  //Calculate Multiplication
  void performMultiplication() {
    parsedMatrixValue();
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        resultValues[i * 3 + j] = 0.0;
        for (int k = 0; k < 3; k++) {
          resultValues[i * 3 + j] += matrixAValues[i * 3 + k] * matrixBValues[k * 3 + j];
        }
        resultControllers[i * 3 + j].text = resultValues[i * 3 + j].toString();
      }
    }
  }

  //Calculate Division
  void performDivision() {
    parsedMatrixValue();
    for (int i = 0; i < 9; i++) {
      if (matrixBValues[i] != 0) {
        resultValues[i] = matrixAValues[i] / matrixBValues[i];
        resultControllers[i].text = resultValues[i].toString();
      } else {
        resultValues[i] = double.infinity;
        resultControllers[i].text = "Infinity";
      }
    }
  }

  //Reset TextEditing Controller Value into 0
  void resetMatrixValue() {
    for (final controller in matrixAControllers) {
      controller.clear();
    }
    for (final controller in matrixBControllers) {
      controller.clear();
    }
    for (final controller in resultControllers) {
      controller.clear();
    }
    for (int i = 0; i < 9; i++) {
      matrixAValues[i] = 0.0;
      matrixBValues[i] = 0.0;
      resultValues[i] = 0.0;
    }
  }

  @override
  void dispose() {
    for (final controller in matrixAControllers) {
      controller.dispose();
    }
    for (final controller in matrixBControllers) {
      controller.dispose();
    }
    for (final controller in resultControllers) {
      controller.dispose();
    }
    super.dispose();
  }
}

//Operation Type
enum OperationType{
  addition,
  subtraction,
  multiplication,
  division
}