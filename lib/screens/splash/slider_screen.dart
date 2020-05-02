import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marvie_ui_kit/constant.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:marvie_ui_kit/widgets/carousel_image.dart';
import 'package:marvie_ui_kit/widgets/custom_buttons.dart';

class SliderScreen extends StatefulWidget {
  @override
  _SliderScreenState createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  CarouselController buttonCarouselController = CarouselController();
  int _current = 0;

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kdarkColor,
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            buildCarosel(),
            SizedBox(height: 10.0,),
            buildCaption(_current),
            SizedBox(height: 25.0,),
            buildIndicators(),
            SizedBox(height: 25.0,),
            buildControls(),
          ],
        ),
      ),
    );
  }

  Widget buildCarosel() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 439,
        initialPage: 0,
        enlargeCenterPage: true,
        autoPlay: false,
        reverse: false,
        enableInfiniteScroll: false,
        scrollDirection: Axis.horizontal,
        onPageChanged: (index, reason) {
          setState(() {
            _current = index;
          });
        }
      ),
      carouselController: buttonCarouselController,
      items: [
        CarouselImage(
          imgUrl: 'slider-1.png'
        ),
        CarouselImage(
          imgUrl: 'slider-2.png'
        ),
        CarouselImage(
          imgUrl: 'slider-3.png'
        ),
      ],
    );
  }

  Widget buildCaption(index) {
    final List<Map<String, dynamic>> data = [
      {
        'title': 'Welcome to the amzing family',
        'desc': 'Look inside for the best options of the items you like most, all me.'
      },
      {
        'title': 'Join our awesome community',
        'desc': 'It looks like you are on track. Please continue to follow your daily plan'
      },
      {
        'title': 'Get Started',
        'desc': 'Join us now and get the most out of your carreer with out expects'
      }
    ];

    return Column(
      children: <Widget>[
        Text(
          '${data[index]['title']}',
          style: kmain2textstyle,
        ),
        SizedBox(height: 7.0,),
        Container(
          width: MediaQuery.of(context).size.width / 1.45,
          child: Text(
            '${data[index]['desc']}',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'SFProDisplay',
              color: Color(0xff96a7af),
              fontSize: 13,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildIndicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 9,
          height: 9,
          margin: EdgeInsets.symmetric(horizontal: 9.0),
          decoration: BoxDecoration(
            color: _current == 0 ? Color(0xff3dd598) : Color(0xff475e69),
            borderRadius: BorderRadius.circular(32.5)
          )
        ),
        Container(
          width: 9,
          height: 9,
          margin: EdgeInsets.symmetric(horizontal: 9.0),
          decoration: BoxDecoration(
            color: _current == 1 ? Color(0xff3dd598) : Color(0xff475e69),
            borderRadius: BorderRadius.circular(32.5)
          )
        ),
        Container(
          width: 9,
          height: 9,
          margin: EdgeInsets.symmetric(horizontal: 9.0),
          decoration: BoxDecoration(
            color: _current == 2 ? Color(0xff3dd598) : Color(0xff475e69),
            borderRadius: BorderRadius.circular(32.5)
          )
        ),
      ],
    );
  }
  
  Widget buildControls() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(width: 7.0,),
        CustomButton(
          width: 58,
          height: 58,
          boxDecoration: BoxDecoration(
            color: Color(0xff286053),
            borderRadius: BorderRadius.circular(12),
          ),
          onPress: () {
            if(_current == 0) {
              return null;
            } else {
              buttonCarouselController.previousPage(
                duration: Duration(milliseconds: 300), curve: Curves.linear
              );
            }
          },
          child: SvgPicture.asset('assets/icons/back-icon-light.svg'),
        ),
        CustomButton(
          width: 245,
          height: 58,
          boxDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              colors: [
                Color(0xff40df9f),
                Color(0xff3ed598) 
              ],
              stops: [0, 1],
              begin: Alignment(-1.00, 0.00),
              end: Alignment(1.00, -0.00),
            ),
            boxShadow: [ 
              BoxShadow(
                color: Color(0x4c0fda89),
                offset: Offset(0,2),
                blurRadius: 4,
                spreadRadius: 0
              )
            ],
          ),
          onPress: () {
            if(_current == 2) {
              print('go to home');
              return null;
            } else {
              buttonCarouselController.nextPage(
                duration: Duration(milliseconds: 300), curve: Curves.linear
              );
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('Next',
              style: TextStyle(
                fontFamily: 'SFProDisplay',
                color: Color(0xffffffff),
                fontSize: 16,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,  
                )
              ),
              SizedBox(width: 10.0,),
              SvgPicture.asset('assets/icons/forward-icon-brand.svg')
            ],
          ),
        ),
        SizedBox(width: 7.0,),
      ],
    );
  }
}