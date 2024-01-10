import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:owow_admin/src/core/constants/gap_constant.dart';
import 'package:owow_admin/src/provider/temp.dart';
import 'package:owow_admin/src/view/common/background.dart';
import 'package:provider/provider.dart';

import '../common/custom_button.dart';

class AddFeedbackPage extends StatefulWidget {
  const AddFeedbackPage({super.key});

  @override
  State<AddFeedbackPage> createState() => _AddFeedbackPageState();
}

class _AddFeedbackPageState extends State<AddFeedbackPage> {
  final _feedbackFormFormKey = GlobalKey<FormState>();

  final _questionController = TextEditingController();
  final _optionsController = TextEditingController();
  List<String> list = <String>['Dropdown', 'Binary', 'Open Field', 'Sorting'];

  String dropdownValue = 'Dropdown';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeBackground(
        child: Center(
          child: _rightLayout(context),
        ),
      ),
    );
  }

  Widget _rightLayout(BuildContext context) {
    return Form(
      key: _feedbackFormFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 450,
            child: Column(
              children: [
                Container(
                  width: 313,
                  height: 60,
                  // decoration: BoxDecoration(
                  //   color: const Color(0xFFB7CAA9),
                  //   borderRadius: BorderRadius.circular(5.0),
                  // ),
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment(1.00, 0.00),
                        end: Alignment(-1, 0),
                        colors: [Color(0xFF4E8649), Color(0xFF76A968)],
                      ),
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 4,
                          offset: Offset(0, 4),
                          spreadRadius: 0,
                        )
                      ]),
                  child: DropdownButton<String>(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    alignment: Alignment.center,
                    isExpanded: true,
                    value: dropdownValue,
                    elevation: 18,
                    underline:
                        Container(height: 2, color: const Color(0xFFB7CAA9)),
                    style: const TextStyle(color: Colors.white),
                    dropdownColor: const Color(0xFF4E8649),
                    icon: const Icon(
                      Icons.arrow_downward,
                      color: Colors.white,
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        dropdownValue = value!;
                      });
                    },
                    items: list.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                GapConstant.h20,
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFB7CAA9),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
                    child: TextFormField(
                      controller: _questionController,
                      style: const TextStyle(
                        color: Color(0xFF132513),
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Question',
                        helperText: 'Question',
                        hintStyle:
                            Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  color: const Color(0xFF5E6E59),
                                ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Question ';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                GapConstant.h20,
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFB7CAA9),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
                    child: TextFormField(
                      controller: _optionsController,
                      enableSuggestions: false,
                      style: const TextStyle(
                        color: Color(0xFF132513),
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Option',
                        helperText: 'Option',
                        hintStyle:
                            Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  color: const Color(0xFF5E6E59),
                                ),
                      ),
                      validator: (value) {
                        // if (value == null || value.isEmpty) {
                        //   return 'Please enter Question';
                        // }
                        return null;
                      },
                    ),
                  ),
                ),
                GapConstant.h20,
              ],
            ),
          ),
          SizedBox(
            height: 60,
            width: 700,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomGradientElevatedButton(
                  minimumSize: const Size(200, 60),
                  buttonText: Text(
                    'Save',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontWeight: FontWeight.w600),
                  ),
                  onPressed: () {
                    if (_feedbackFormFormKey.currentState!.validate()) {
                      _feedbackFormFormKey.currentState!.save();
                      _addToFeedbackList(_questionController.text);
                      context.pop();
                    }
                  },
                ),
                GapConstant.w20,
                CustomGradientElevatedButton(
                  minimumSize: const Size(200, 60),
                  buttonText: Text(
                    'Cancel',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontWeight: FontWeight.w600),
                  ),
                  onPressed: () => context.pop(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _addToFeedbackList(String text) =>
      Provider.of<FeedbackProvider>(context, listen: false).addFeedback(text);
}
