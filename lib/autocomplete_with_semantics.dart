// import 'package:collection/src/iterable_extensions.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
//
// class Option {
//   final String name;
//
//   const Option(this.name);
// }
//
// class _MonthOptions extends StatelessWidget {
//   const _MonthOptions({
//     Key? key,
//     required this.displayStringForOption,
//     required this.onSelected,
//     required this.options,
//     required this.maxOptionsHeight,
//   }) : super(key: key);
//
//   final AutocompleteOptionToString<Option> displayStringForOption;
//
//   final AutocompleteOnSelected<Option> onSelected;
//
//   final Iterable<Option> options;
//   final double maxOptionsHeight;
//
//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment: Alignment.topLeft,
//       child: Material(
//         elevation: 4.0,
//         child: ConstrainedBox(
//           constraints: BoxConstraints(
//             maxHeight: maxOptionsHeight,
//             //maxWidth: constraints.maxWidth,
//           ),
//           child: ListView.builder(
//             padding: EdgeInsets.zero,
//             shrinkWrap: true,
//             itemCount: options.length,
//             itemBuilder: (BuildContext context, int index) {
//               final Option option = options.elementAt(index);
//               return InkWell(
//                 onTap: () {
//                   onSelected(option);
//                 },
//                 child: Builder(builder: (BuildContext context) {
//                   final bool highlight =
//                       AutocompleteHighlightedOption.of(context) == index;
//                   if (highlight) {
//                     SchedulerBinding.instance!
//                         .addPostFrameCallback((Duration timeStamp) {
//                       Scrollable.ensureVisible(context, alignment: 0.5);
//                     });
//                   }
//                   return Container(
//                     color: highlight ? Theme.of(context).focusColor : null,
//                     padding: const EdgeInsets.all(16.0),
//                     child: Text(option.name),
//                   );
//                 }),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class AutoCompleteWithSemantics extends StatelessWidget {
//   static const months = [
//     Option('JAN'),
//     Option('FEB'),
//     Option('MAR'),
//     Option('APR'),
//     Option('MAY'),
//     Option('JUN'),
//     Option('JUL'),
//     Option('AUG'),
//     Option('SEP'),
//     Option('OCT'),
//     Option('NOV'),
//     Option('DEC'),
//   ];
//
//   const AutoCompleteWithSemantics({
//     Key? key,
//     required this.controller,
//     this.hint,
//     required this.focusNode,
//     this.getNextFocusNode,
//     this.enabled = true,
//     this.hasError = false,
//   }) : super(key: key);
//
//   static String _displayStringForOption(Option option) => option.name;
//   final TextEditingController controller;
//   final String? hint;
//   final FocusNode focusNode;
//   final FocusNode? Function()? getNextFocusNode;
//   final bool enabled;
//   final bool hasError;
//
//   InputDecoration _createInputDecoration(BuildContext context, String hint){
//     return InputDecoration(hintText: hint, counterText: '').applyDefaults(Theme.of(context).inputDecorationTheme),
//   }
//
//   @override
//   Widget build(context) {
//     return Autocomplete<Option>(
//       fieldViewBuilder:
//           (context, textEditingController, focusNode, onFieldSubmitted) {
//         textEditingController.addListener(() {
//           final matchedOption = months.firstWhereOrNull((option) {
//             return option.name.toLowerCase() ==
//                 textEditingController.text.trim().toLowerCase();
//           });
//           _effectiveController
//               .text = matchedOption?.name ?? '';
//         });
//         return TextField(
//           decoration: _createInputDecoration(context, 'select a month'),
//         )
//
//         );
//       },
//       displayStringForOption: _displayStringForOption,
//       optionsBuilder: (textEditingValue) {
//         if (textEditingValue.text == '') {
//           return const Iterable<Option>.empty();
//         }
//         final matchingMonths = months.where((option) {
//           return option.name
//               .toLowerCase()
//               .contains(textEditingValue.text.toLowerCase());
//         });
//
//         return matchingMonths.toList();
//       },
//       initialValue: _effectiveController.value,
//       onSelected: (selection) {
//         _effectiveController.text = selection.name;
//       },
//       optionsViewBuilder: (context, onSelected, options) => _MonthOptions(
//         displayStringForOption: _displayStringForOption,
//         onSelected: onSelected,
//         options: options,
//         maxOptionsHeight: 200.0,
//       ),
//     );
//   }
// }
