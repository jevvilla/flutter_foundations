import 'package:flutter/material.dart';
import 'package:flutter_foudations/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RangeSelectorForm extends ConsumerWidget {
  final GlobalKey<FormState> formKey;

  const RangeSelectorForm({Key? key, required this.formKey}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetReference ref) {
    final randomizer = ref.watch(randomizerProvider);

    return Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RangeSelectorTextFormField(
                labelText: 'Minimum',
                intValueSetter: (value) => randomizer.min = value,
              ),
              SizedBox(
                height: 12,
              ),
              RangeSelectorTextFormField(
                  labelText: 'Maximum',
                  intValueSetter: (value) => randomizer.max = value),
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
