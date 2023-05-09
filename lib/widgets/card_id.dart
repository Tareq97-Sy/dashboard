
import 'package:flutter/material.dart';

class CardId extends StatelessWidget {
   CardId({Key? key,required this.name,required this.email}) : super(key: key);
   final String name;
   final String email;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(name),
          SizedBox(height: 10,),
          Text(email),
        ],
      ),
    );
  }
}
