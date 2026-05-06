

import 'package:flutter/material.dart';

class NoteWidgets extends StatelessWidget{
  final TextEditingController titleCntlr;
  final TextEditingController subTitleCntlr;
  final String buttonText;
  final VoidCallback onSubmit;
  final bool isLoading;

  NoteWidgets({
    super.key,
    required this.titleCntlr,
    required this.subTitleCntlr,
    required this.buttonText,
    required this.onSubmit,
    required this.isLoading
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
          keyboardType: TextInputType.multiline,
          maxLines: null,
          minLines: 8,
          decoration: InputDecoration(
            hintText: "Description......(If you want to give a headline for that use ##headline , and if you want bullet point - text, if you mark as important keywords then push the text inside *what you want to right* )",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16)
            )
          ),
        ),
        SizedBox(height: 20,),
        //submit button
        SizedBox(
          height: 40,
          width: double.infinity,
          child: ElevatedButton(
              onPressed:  isLoading ? null : onSubmit,
              child: isLoading ? Center(child: CircularProgressIndicator(),)
                  : Text(buttonText)
          ),
        )
      ],
    );
  }
  
}