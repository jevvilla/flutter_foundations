import 'package:flutter/material.dart';
import 'package:flutter_foudations/randomizer_page.dart';
import 'package:flutter_foudations/range_selector_form.dart';

class RangeSelectorPage extends StatefulWidget {
  RangeSelectorPage({Key? key}) : super(key: key);

  @override
  _RangeSelectorPageState createState() => _RangeSelectorPageState();
}

class _RangeSelectorPageState extends State<RangeSelectorPage> {
  final formKey = GlobalKey<FormState>();
  int _min = 0;
  int _max = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Range'),
      ),
      body: RangeSelectorForm(
          formKey: formKey,
          maxValueSetter: (value) => _max = value,
          minValueSetter: (value) => _min = value),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (formKey.currentState?.validate() == true) {
            formKey.currentState?.save();
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => RandomizerPage(max: _max, min: _min)));
          }
        },
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}
