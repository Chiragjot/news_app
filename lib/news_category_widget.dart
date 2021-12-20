import 'package:flutter/material.dart';

class NewsCategoryWidget extends StatelessWidget {

  final String id;
  final String title;
  final Color color;
  NewsCategoryWidget(this.id, this.title, this.color);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>{},
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(title),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ]
          )
        ),
      ),
    );
  }
}