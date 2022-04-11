import 'package:collection/src/iterable_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class Option {
  final String name;

  Option(this.name);
}

class AutoCompleteWithAnnouncedOptions extends StatefulWidget {
  const AutoCompleteWithAnnouncedOptions({Key? key}) : super(key: key);

  // https://www.w3.org/TR/wai-aria-practices-1.2/#combobox

  // static const List<String> _kOptions = <String>[
  //   'January',
  //   'February',
  //   'March',
  //   'April',
  //   'May',
  //   'June',
  //   'July',
  //   'August',
  //   'September',
  //   'October',
  //   'November',
  //   'December',
  // ];

  @override
  State<AutoCompleteWithAnnouncedOptions> createState() =>
      _AutoCompleteWithAnnouncedOptionsState();
}

class _AutoCompleteWithAnnouncedOptionsState
    extends State<AutoCompleteWithAnnouncedOptions> {
  static final months = [
    Option('JAN'),
    Option('FEB'),
    Option('MAR'),
    Option('APR'),
    Option('MAY'),
    Option('JUN'),
    Option('JUL'),
    Option('AUG'),
    Option('SEP'),
    Option('OCT'),
    Option('NOV'),
    Option('DEC'),
  ];
  static String _displayStringForOption(Option option) => option.name;

  Option? _currentSelection;

  Option? _getFirstOptionStartWith(TextEditingValue textEditingValue) {
    // final matchedOptions = _getOptionsStartWith(textEditingValue);
    // if (matchedOptions.isEmpty) return null;
    // return matchedOptions.first;
    final matchedOption = months.firstWhereOrNull((option) {
      return option.name
          .toLowerCase()
          .startsWith(textEditingValue.text.toLowerCase());
    });
    return matchedOption;
  }

  Iterable<Option> _getOptionsStartWith(TextEditingValue textEditingValue) {
    if (textEditingValue.text == '') {
      return const Iterable<Option>.empty();
    }
    return months.where((Option option) {
      return option.name
          .toLowerCase()
          .startsWith(textEditingValue.text.toLowerCase());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Autocomplete<Option>(
      displayStringForOption: _displayStringForOption,
      // fieldViewBuilder:
      //     (context, textEditingController, focusNode, onFieldSubmitted) {
      //   return TextFormField(
      //     controller: textEditingController,
      //     // onChanged: (_) {
      //     //   print('_: $_');
      //     //   print('cv: ${textEditingController.text}');
      //     //   final matchedOption =
      //     //       _getFirstOptionStartWith(textEditingController.value);
      //     //   if (matchedOption != null) {
      //     //     textEditingController.text = matchedOption.name;
      //     //     print('cv: ${textEditingController.text}');
      //     //   }
      //     // },
      //   );
      // },
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<Option>.empty();
        }
        return months.where((Option option) {
          return option.name
              .toLowerCase()
              .startsWith(textEditingValue.text.toLowerCase());
        });
      },
      onSelected: (Option selectedOption) {
        print('You just selected ${selectedOption.name}');
        _currentSelection = selectedOption;
      },
      optionsViewBuilder: (context, onSelected, options) => _MonthOptions(
        displayStringForOption: _displayStringForOption,
        onSelected: onSelected,
        options: options,
        maxOptionsHeight: 200.0,
      ),
    );
  }
}

class _MonthOptions extends StatelessWidget {
  const _MonthOptions({
    Key? key,
    required this.displayStringForOption,
    required this.onSelected,
    required this.options,
    required this.maxOptionsHeight,
  }) : super(key: key);

  final AutocompleteOptionToString<Option> displayStringForOption;

  final AutocompleteOnSelected<Option> onSelected;

  final Iterable<Option> options;
  final double maxOptionsHeight;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Material(
        elevation: 4.0,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: maxOptionsHeight,
          ),
          child: ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: options.length,
            itemBuilder: (BuildContext context, int index) {
              final Option option = options.elementAt(index);
              return InkWell(
                onTap: () {
                  onSelected(option);
                },
                child: Builder(builder: (BuildContext context) {
                  final bool highlight =
                      AutocompleteHighlightedOption.of(context) == index;

                  if (highlight) {
                    print('selected: ${option.name}');
                    SchedulerBinding.instance!
                        .addPostFrameCallback((Duration timeStamp) {
                      Scrollable.ensureVisible(context, alignment: 0.5);
                    });
                  }
                  return Semantics(
                    container: true,
                    label: option.name,
                    child: Container(
                      color: highlight ? Theme.of(context).focusColor : null,
                      padding: const EdgeInsets.all(16.0),
                      child: Text(option.name),
                    ),
                  );
                }),
              );
            },
          ),
        ),
      ),
    );
  }
}
