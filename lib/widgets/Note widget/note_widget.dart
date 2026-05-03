

import 'package:flutter/material.dart';

class NoteWidgets extends StatelessWidget{
  final TextEditingController titleCntlr;
  final TextEditingController subTitleCntlr;
  final String buttonText;
  final VoidCallback onSubmit;

  NoteWidgets({
    super.key,
    required this.titleCntlr,
    required this.subTitleCntlr,
    required this.buttonText,
    required this.onSubmit
});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //for title
        TextFormField(
          controller: titleCntlr,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            hintText: "Give the Title of your notes",
            label: Text("Title"),
            hintMaxLines: 2,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16)
            )
          ),
        ),
        SizedBox(height: 10,),
        // description
        TextFormField(
          controller: subTitleCntlr,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            hintMaxLines: 5,
            hintText: "Description......",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16)
            )
          ),
        ),
        SizedBox(height: 20,),
        //submit button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
              onPressed: onSubmit,
              child: Text(buttonText)
          ),
        )
      ],
    );
  }
  
}