import 'package:flutter/material.dart';

class RangeSelectorForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final void Function(int value) minValueSetter;
  final void Function(int value) maxValueSetter;

  const RangeSelectorForm(
      {Key? key,
      required this.formKey,
      required this.maxValueSetter,
      required this.minValueSetter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RangeSelectorTextFormField(
                labelText: 'Minimum',
                intValueSetter: minValueSetter,
              ),
              SizedBox(
                height: 12,
              ),
              RangeSelectorTextFormField(
                  labelText: 'Maximum', intValueSetter: maxValueSetter),
            ],
          ),
        ));
  }
}

class RangeSelectorTextFormField extends StatelessWidget {
  final String labelText;
  final void Function(int value) intValueSetter;

  const RangeSelectorTextFormField(
      {Key? key, required this.labelText, required this.intValueSetter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration:
          InputDecoration(border: OutlineInputBorder(), labelText: labelText),
      keyboardType:
          TextInputType.numberWithOptions(decimal: false, signed: true),
      validator: (value) {
        if (value == null || int.tryParse(value) == null) {
          return 'Must be an integer';
        } else {
          return null;
        }
      },
      onSaved: (newValue) => intValueSetter(int.parse(newValue ?? '')),
    );
  }
}
