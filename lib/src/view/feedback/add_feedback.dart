import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:owow_admin/src/core/constants/gap_constant.dart';
import 'package:owow_admin/src/provider/data.dart';
import 'package:owow_admin/src/view/common/background.dart';
import 'package:provider/provider.dart';

import '../../core/constants/app_constant.dart';
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
  final _image = TextEditingController();
  String answerChoiceValue = 'Multi-Option';
  String catValue = 'Food';
  bool isPictureUploaded = true;

  void _addToFeedbackList(String question, questionType, option, image, cat) =>
      Provider.of<DataProvider>(context, listen: false).addFeedbackQuestions(
          question: question,
          answerChoice: option,
          image: image,
          cat: cat,
          questionType: questionType);

  Future _imagePicker() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image == null) return;
      Uint8List byteImage = await image.readAsBytes();
      String base64String = base64.encode(byteImage);
      log(byteImage.length.toString());
      log(base64String);
      setState(() => _image.text = 'data:image/png;base64,$base64String');
    } on PlatformException catch (e) {
      debugPrint('Failed to pick image: $e');
    }
  }

  Widget _imageDecode(picture) {
    final splitString = picture.split(',')[1];
    final byteImage = const Base64Decoder().convert(splitString);
    return Image.memory(
      byteImage,
      width: 200,
      fit: BoxFit.fitWidth,
    );
  }

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
    return Column(
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
                  value: answerChoiceValue,
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
                      answerChoiceValue = value!;
                    });
                  },
                  items: AppConstant.optionList
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              GapConstant.h20,
              Container(
                width: 313,
                height: 60,
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
                  value: catValue,
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
                      catValue = value!;
                    });
                  },
                  items: AppConstant.catList
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              GapConstant.h20,
              Form(
                key: _feedbackFormFormKey,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFB7CAA9),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 15, right: 15, top: 5),
                        child: TextFormField(
                          controller: _questionController,
                          style: const TextStyle(
                            color: Color(0xFF132513),
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'How was the food?',
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
                    Visibility(
                      visible: answerChoiceValue == 'Open-Field' ? false : true,
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFB7CAA9),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 5),
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
                              hintText: 'Good, Bad, Average',
                              helperText: 'Add Options (,) separated',
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    color: const Color(0xFF5E6E59),
                                  ),
                            ),
                            validator: (value) {
                              if ((value == null || value.isEmpty) &&
                                  answerChoiceValue != 'Open-Field') {
                                return 'Please enter an option';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ),
                    GapConstant.h20,
                    InkWell(
                      onTap: (() {
                        _imagePicker();
                      }),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(20.0),
                            height: 150.0,
                            width: 150.0,
                            child: _image.text != ''
                                ? _imageDecode(_image.text)
                                : Image.asset(
                                    'assets/images/add_image.png',
                                    fit: BoxFit.contain,
                                  ),
                          ),
                          Text('Upload Picture',
                              style: TextStyle(
                                color: (isPictureUploaded && _image.text == '')
                                    ? Colors.red
                                    : Colors.black,
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
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
                    _addToFeedbackList(
                        _questionController.text,
                        answerChoiceValue,
                        _optionsController.text,
                        _image.text,
                        catValue);
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
    );
  }
}


/* 

Form(
                key: _feedbackSubFormFormKey,
                child: Container(
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
                        suffixIcon: IconButton(
                          onPressed: _addToList,
                          icon: const Icon(Icons.add),
                        ),
                        border: InputBorder.none,
                        hintText: 'Option',
                        helperText: 'Option',
                        hintStyle:
                            Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  color: const Color(0xFF5E6E59),
                                ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter an option';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ),

                void _addToList() {
    if (_feedbackSubFormFormKey.currentState!.validate()) {
      _feedbackSubFormFormKey.currentState!.save();
      setState(() {
        options.add(_optionsController.text);
        _optionsController.clear();
      });
    }
  }

 */