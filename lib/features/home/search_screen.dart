import 'package:flutter/material.dart';
import 'package:notes/core/utils/app_styles.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search a city"),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: TextField(
            onSubmitted: (value) {

            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(30),
              label: Text("Search"),
              labelStyle: AppStyle.styleBold16,
              prefixIcon: Icon(Icons.search),
              hintText: "Enter center name",
              hintStyle: AppStyle.styleRegular12,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Colors.green),
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.yellow)),
              focusedBorder:
                  OutlineInputBorder(borderSide: BorderSide(color: Colors.blueAccent)),
              disabledBorder:
                  OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
            ),
          ),
        ),
      ),
    );
  }
}
