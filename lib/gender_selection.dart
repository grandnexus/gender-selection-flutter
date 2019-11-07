library gender_selection;
import 'package:flutter/material.dart';
import 'package:gender_selection/utils/gradients.dart';

enum Gender{
  Male,
  Female
}

// ignore: must_be_immutable
class GenderSelectorCustom extends StatefulWidget {
  Gender selectedGender;
  final LinearGradient linearGradient;
  final ImageProvider maleImage;
  final ImageProvider femaleImage;
  final ValueChanged<Gender> onChanged;
  final String maleText;
  final bool equallyAligned;
  final String femaleText;
  final IconData selectedGenderCheckIcon;
  final double size;
  final bool isCircular;
  final EdgeInsetsGeometry padding;
  final Duration animationDuration;
  final double opacityOfGradient;
  final double selectedGenderIconSize;
  final bool isSelectedGenderIconCircular;
  final Color selectedGenderIconColor;
  final Color selectedGenderIconBackgroundColor;
  final TextStyle selectedGenderTextStyle;
  final TextStyle unSelectedGenderTextStyle;

  GenderSelectorCustom({
    Key key,
    this.selectedGenderTextStyle = const TextStyle(
  fontSize: 19,
  color: Colors.redAccent,
  fontWeight: FontWeight.w600,
  ),
    this.unSelectedGenderTextStyle = const TextStyle(
      fontSize: 19,
      color: Colors.black,
      fontWeight: FontWeight.w600,

    ),
    this.selectedGenderIconBackgroundColor = Colors.red,
    this.selectedGenderIconColor = Colors.white,
    this.selectedGenderIconSize = 20.0,
    this.isSelectedGenderIconCircular=true,
    this.animationDuration = const Duration(milliseconds: 500),
    this.opacityOfGradient=0.6,
    this.padding=const EdgeInsets.all(10),
    this.isCircular=true,
    this.size = 120.0,
    this.selectedGenderCheckIcon=Icons.check,
    this.equallyAligned=true ,
    this.selectedGender,
    @required this.onChanged,
    this.linearGradient=balbirGradient,
    this.maleImage=const AssetImage("assets/images/boy.png"),
    this.femaleImage = const AssetImage("assets/images/girl.png"),
    this.maleText="Male",
    this.femaleText="Female"})
      : super(key: key);
  @override
  _GenderSelectorCustomState createState() => _GenderSelectorCustomState();
}

class _GenderSelectorCustomState extends State<GenderSelectorCustom> {


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: widget.equallyAligned?MainAxisAlignment.spaceEvenly:MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: ()  {
              setState(() {
                widget.selectedGender = Gender.Male;
                widget.onChanged(widget.selectedGender);
              });
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Stack(
                  fit: StackFit.loose,
                  alignment:Alignment.topRight,
                  children: <Widget>[
                    Container(
                      height: widget.size,
                      width: widget.size,
                      margin: const EdgeInsets.only(top: 20, bottom: 10),
                      decoration: BoxDecoration(
                        shape: widget.isCircular?BoxShape.circle:BoxShape.rectangle,
                        image: DecorationImage(
                          image: widget.maleImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: AnimatedOpacity(
                        opacity: widget.selectedGender == Gender.Male ? widget.opacityOfGradient : 0.0,
                        duration: widget.animationDuration,
                        child: widget.selectedGender == Gender.Male
                            ? Container(
                          decoration: BoxDecoration(
                              gradient: widget.linearGradient,
                              shape:widget.isCircular? BoxShape.circle:BoxShape.rectangle),
                        )
                            : null,
                      ),
                    ),
                    Positioned(
                      top: 27,
                      right: 5,
                      child: AnimatedContainer(
                        duration: widget.animationDuration,
                        height: widget.selectedGender==Gender.Male?widget.selectedGenderIconSize:0.0,
                        width: widget.selectedGender==Gender.Male?widget.selectedGenderIconSize:0.0,
                        padding: const EdgeInsets.all(6),
                        curve: Curves.fastLinearToSlowEaseIn,
                        decoration: BoxDecoration(
                            shape: widget.isSelectedGenderIconCircular?BoxShape.circle:BoxShape.rectangle,
                            color: widget.selectedGenderIconBackgroundColor
                        ),
                        child: Icon(widget.selectedGenderCheckIcon,color: widget.selectedGenderIconColor),
                      ),
                    )
                  ],
                ),
                Text(
                  widget.maleText,
                  style: widget.selectedGender ==  Gender.Male?widget.selectedGenderTextStyle:widget.unSelectedGenderTextStyle
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: (){
              setState(() {
                widget.selectedGender = Gender.Female;
                widget.onChanged(widget.selectedGender);
              });
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Stack(
                  fit: StackFit.loose,
                  alignment: Alignment.topRight,
                  children: <Widget>[
                    Container(
                      height: widget.size,
                      width: widget.size,
                      margin: const EdgeInsets.only(top: 20, bottom: 10),
                      decoration: BoxDecoration(
                          shape: widget.isCircular?BoxShape.circle:BoxShape.rectangle,
                          image: DecorationImage(
                              image: widget.femaleImage,
                              alignment: Alignment.center,
                              fit: BoxFit.cover)),
                      child: AnimatedOpacity(
                        opacity: widget.selectedGender == Gender.Female ? widget.opacityOfGradient: 0.0,
                        duration: widget.animationDuration,
                        child: widget.selectedGender == Gender.Female
                            ? Container(
                          decoration: BoxDecoration(
                              gradient: widget.linearGradient,
                              shape: widget.isCircular?BoxShape.circle:BoxShape.rectangle),
                        )
                            : null,
                      ),
                    ),
                    Positioned(
                      top: 27,
                      right: 5,
                      child: AnimatedContainer(
                        duration:widget.animationDuration,
                        height: widget.selectedGender==Gender.Female?widget.selectedGenderIconSize:0.0,
                        width: widget.selectedGender==Gender.Female?widget.selectedGenderIconSize:0.0,
                        padding: const EdgeInsets.all(6),
                        curve: Curves.fastLinearToSlowEaseIn,
                        decoration: BoxDecoration(
                            shape: widget.isSelectedGenderIconCircular?BoxShape.circle:BoxShape.rectangle,
                            color: widget.selectedGenderIconBackgroundColor
                        ),
                        child: Icon(widget.selectedGenderCheckIcon,color: widget.selectedGenderIconColor),
                      ),
                    )
                  ],
                ),
                Text(
                 widget.femaleText,
                  style: widget.selectedGender == Gender.Female?widget.selectedGenderTextStyle:widget.unSelectedGenderTextStyle
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}


