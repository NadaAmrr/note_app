import 'package:flutter/material.dart';
import 'package:notes/core/utils/app_colors.dart';
import 'package:notes/core/utils/app_strings.dart';
import 'package:notes/core/utils/app_styles.dart';

class NoteSheetWidget extends StatefulWidget {
  final String buttonNote;
  final VoidCallback onTap;
  const NoteSheetWidget(
      {super.key, required this.buttonNote, required this.onTap});

  @override
  State<NoteSheetWidget> createState() => _NoteSheetWidgetState();
}

class _NoteSheetWidgetState extends State<NoteSheetWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Form(
        key: _formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          children: [
            ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  widget.buttonNote,
                  style: AppStyle.styleBold20
                      .copyWith(color: AppColors.grey, letterSpacing: 14),
                ),
                trailing: GestureDetector(
                    onTap: _onCheckForm,
                    child: const Icon(
                      Icons.check_circle,
                      size: 40,
                      color: AppColors.green,
                    ))),
            TextFormField(
              onSaved: onSavedTitle,
              validator: validator,
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: AppString.hintTitle,
                  hintStyle: AppStyle.styleBold20),
              style: AppStyle.styleBold20,
            ),
            TextFormField(
              onSaved: onSavedSubtitle,
              validator: validator,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: AppString.hintDescription,
                  hintStyle: AppStyle.styleBold16),
              style: AppStyle.styleBold16,
            ),
            // Spacer(),
            // SizedBox(
            //     width: double.infinity,
            //     child: CustomButton(text: buttonNote, onPressed: () {  },)),
            const SizedBox(height: 10)
          ],
        ),
      ),
    );
  }
  void _onCheckForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save(); // Save the form state
      // Now you can use the title and subTitle values
      print("Title: $title");
      print("Subtitle: $subTitle");
      // You can call the onTap callback here or perform any other action
      widget.onTap();
    } else {
      // If the form is not valid, you can set the autovalidate mode
      setState(() {
        autovalidateMode = AutovalidateMode.always; // Show validation errors
      });
    }
  }
  void onSavedTitle(String? newValue) {
    print("Title: $title");
    newValue = title;
  }

  String? validator(String? value) {
    if (value?.isEmpty ?? true) {
      return "Field is required";
    }
  }

  void onSavedSubtitle(String? newValue) {
    newValue = subTitle;
  }
}
