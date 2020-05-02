import 'package:flutter/material.dart';

class CarouselImage extends StatelessWidget {
  final String imgUrl;

  CarouselImage({Key key, this.imgUrl}) 
    : super(key: key);

  Widget build(BuildContext context) {
    return Container(
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image:  AssetImage('assets/images/$imgUrl'),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}