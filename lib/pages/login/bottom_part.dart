

import 'package:flutter/material.dart';

class BottomPartOfLogin extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 1,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        SizedBox(height: 40,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
                onTap: (){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Google action perform successfully")));
                },
                child: Icon(Icons.g_mobiledata,size: 32,color: Colors.deepOrange,)),
            SizedBox(width: 10,),
            InkWell(
                onTap: (){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Gmail action perform successfully")));
                },
                child: Icon(Icons.mail_outline,size: 32,color: Colors.deepOrange)),
            SizedBox(width: 10,),
            InkWell(
                onTap: (){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Facebook action perform successfully")));
                },
                child: Icon(Icons.facebook_outlined,size: 32,color: Colors.deepOrange))
          ],
        )
      ],

    );
  }


}