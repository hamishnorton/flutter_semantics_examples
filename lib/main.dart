import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_semantics_examples/display_new_input.dart';
import 'package:flutter_semantics_examples/display_new_input_error_on_hide.dart';
import 'package:flutter_semantics_examples/live_region.dart';
import 'package:flutter_semantics_examples/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RendererBinding.instance?.setSemanticsEnabled(true);
    const String title = 'Flutter Semantics Examples';
    return MaterialApp(
      //showSemanticsDebugger: true,
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const MainScreen(title: title),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget>[
              //DropdownFormFieldBasic(),

              //CheckboxWithSemantics(),
              //RadioButtonGroupWithSemantics(),
              //CustomButtonGroupWithSemanticsWrapper(),
              //CustomRadioGroupWithSemanticsWrapper(),
              //AutoCompleteBasic(), // missing semantics noted
              //AutoCompleteWithAnnouncedOptions(), // not finished, may not be possible
              //DropdownFormFieldBasic(), // not finished
              //ButtonsWithSemantics(),
              Section(child: LiveRegion()),
              Section(child: DisplayNewInput()),
              Section(child: DisplayNewInputErrorOnHide()),
            ]));
  }
}
