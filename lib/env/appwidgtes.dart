// ignore_for_file: must_be_immutable

import 'package:arunmall/env/appexports.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
class Apptextwidget extends StatelessWidget {
  final String data;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final Locale? locale;
  final bool? softWrap;
  final int? maxLines;
  final String? semanticsLabel;
  final Color? selectionColor;
  final TextWidthBasis? textWidthBasis;
  final TextDirection? textDirection;
 const Apptextwidget(this.data,{super.key,this.style,this.textAlign,
    this.textDirection,
    this.strutStyle,
    this.locale,
    this.softWrap,
    this.overflow,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.selectionColor});

  @override
  Widget build(BuildContext context) {
    return Text(data,style: style,textScaler: TextScaler.noScaling,);
  }
}


class Appscalemedia extends StatelessWidget {
  Widget child;
 Appscalemedia({super.key,required this.child});

  @override
  Widget build(BuildContext context) {
    return MediaQuery(data: MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling), child: child);
  }
}

class Appsized extends SingleChildRenderObjectWidget{

   final double? width;

  /// If non-null, requires the child to have exactly this height.
  final double? height;

  const Appsized({ super.key, this.width, this.height, super.child });

  const Appsized.shrink({ super.key, super.child })
    : width = 0.0,
      height = 0.0;
  Appsized.fromSize({ super.key, super.child, Size? size })
    : width = size?.width,
      height = size?.height;    
  @override
  RenderObject createRenderObject(BuildContext context) {
   return  RenderConstrainedBox(
      additionalConstraints: _additionalConstraints,
    );
  }
  BoxConstraints get _additionalConstraints {
    return BoxConstraints.tightFor(width: width, height: height);
  }
}

Widget fillButton(context,
    {required bool load, required String title, required onTap, stle, width}) {
  Size size = MediaQuery.of(context).size;
  return InkWell(
    hoverColor: Colors.transparent,
    focusColor: Colors.transparent,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    onTap: load ? null : onTap,
    child: AnimatedContainer(
      alignment: Alignment.center,
      height: 50,
      width: load ? 50 : width ?? size.width,
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
          color: primary, borderRadius: BorderRadius.circular(10)),
      child: load
          ? const CircularProgressIndicator(color: primary)
          : Apptextwidget(title, style: stle ?? Theme.of(context).textTheme.labelLarge?.copyWith(color: whitebg)),
    ),
  );
}

Widget apptextfield({enabled = true,required TextEditingController controller,validator,onchange,label,hint,prfix,sufix,ishidden = false}){
  return Appscalemedia(
    child: TextFormField(
      obscureText: ishidden, 
        autofocus: false,
        controller: controller,
      decoration: inputDecoration(labelText: label,hintText: hint,prefix:prfix,suffix: sufix),
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.emailAddress,
        textCapitalization: TextCapitalization.none,
        validator:validator,
        onChanged:onchange,
      ),
  );
}

InputDecoration inputDecoration({labelText, hintText, col, isbalck = false,fillcor,prefix,suffix}) {
  return InputDecoration(
    contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
    labelText: labelText,
    //labelStyle: isbalck ?  : TxtStls.stl15,
    hintText: hintText,
   // hintStyle: TxtStls.hintStl,
    fillColor: fillcor,
    filled: true,
    prefixIcon:prefix,
    suffix: suffix,
    counterText: "",
   // errorStyle: TxtStls.errorStl,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: col ?? black),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: col ?? black),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: CupertinoColors.systemRed),
    ),
  );
}