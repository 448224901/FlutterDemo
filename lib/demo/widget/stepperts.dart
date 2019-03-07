import 'package:flutter/material.dart';

///步骤指示器

class StepperWidget extends StatefulWidget {
  @override
  _StepperWidgetState createState() => _StepperWidgetState();
}

class _StepperWidgetState extends State<StepperWidget> {
  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('步骤指示器'),
      ),
      body: Stepper(
        steps: <Step>[
          Step(title: Text('Step Title1'), content: Text('StepContent1')),
          Step(title: Text('Step Title2'), content: Text('StepContent2'),state: StepState.indexed),
          Step(title: Text('Step Title3'), content: Text('StepContent3'),state: StepState.editing),
          Step(title: Text('Step Title4'), content: Text('StepContent4'),state: StepState.complete),
          Step(title: Text('Step Title5'), content: Text('StepContent5'),isActive: true),
        ],
        type: StepperType.vertical,
        currentStep: currentStep,
        onStepContinue: () {
          print('continue');
        },
        onStepCancel: () {
          print('cancle');
        },
        onStepTapped: (value) {
          setState(() {
            currentStep = value;
          });
          print(value);
        },
      ),
    );
  }
}
