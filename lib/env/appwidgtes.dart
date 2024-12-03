// ignore_for_file: must_be_immutable

import 'dart:developer';
import 'package:flutter/foundation.dart';
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
  const Apptextwidget(this.data,
      {super.key,
      this.style,
      this.textAlign,
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
    return Text(
      data,
      style: style,
      textScaler: TextScaler.noScaling,
    );
  }
}

class Appscalemedia extends StatelessWidget {
  Widget child;
  Appscalemedia({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling),
        child: child);
  }
}

class Appsized extends SingleChildRenderObjectWidget {
  final double? width;

  /// If non-null, requires the child to have exactly this height.
  final double? height;

  const Appsized({super.key, this.width, this.height, super.child});

  const Appsized.shrink({super.key, super.child})
      : width = 0.0,
        height = 0.0;
  Appsized.fromSize({super.key, super.child, Size? size})
      : width = size?.width,
        height = size?.height;
  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderConstrainedBox(
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
          : Apptextwidget(title,
              style: stle ??
                  Theme.of(context)
                      .textTheme
                      .labelLarge
                      ?.copyWith(color: whitebg)),
    ),
  );
}

Widget apptextfield(
    {enabled = true,
    required TextEditingController controller,
    keyboardtype,
    validator,
    onchange,
    formatters,
    textaction,
    label,
    maxlenth,
    hint,
    prfix,
    sufix,
    ishidden = false}) {
  return Appscalemedia(
    child: TextFormField(
      obscureText: ishidden,
      inputFormatters: formatters ?? [],
      maxLength: maxlenth ?? TextField.noMaxLength,
      autofocus: false,
      controller: controller,
      decoration: inputDecoration(
          labelText: label, hintText: hint, prefix: prfix, suffix: sufix),
      textInputAction: textaction ?? TextInputAction.next,
      keyboardType: keyboardtype ?? TextInputType.emailAddress,
      textCapitalization: TextCapitalization.none,
      validator: validator,
      onChanged: onchange,
    ),
  );
}

InputDecoration inputDecoration(
    {labelText, hintText, col, isbalck = false, fillcor, prefix, suffix}) {
  return InputDecoration(
    contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
    labelText: labelText ?? "",
    //labelStyle: isbalck ?  : TxtStls.stl15,
    hintText: hintText,
    // hintStyle: TxtStls.hintStl,
    fillColor: fillcor,
    filled: true,
    prefixIcon: prefix,
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

Widget networkImages({
  url,
  size,
}) {
  //log(url.toString());
  return Container(
    height: size,
    width: size,
    decoration: BoxDecoration(
        border: Border.all(color: whitebg),
        borderRadius: BorderRadius.circular(size)),
    child: ClipOval(
      child: url.toString().startsWith("assets")
          ? Image.asset(
              url,
              width: size,
              height: size,
              fit: BoxFit.cover,
              errorBuilder:
                  (BuildContext context, Object error, StackTrace? stackTrace) {
                return Container(
                  width: size,
                  height: size,
                  color: Colors.grey, // Placeholder color
                  child: const Icon(
                    Icons.image_sharp,
                    color: Colors.white,
                  ),
                );
              },
            )
          : Image.network(
              url,
              width: size,
              height: size,
              fit: BoxFit.cover,
              errorBuilder:
                  (BuildContext context, Object error, StackTrace? stackTrace) {
                return Container(
                  width: size,
                  height: size,
                  color: Colors.grey, // Placeholder color
                  child: const Icon(
                    Icons.image_sharp,
                    color: Colors.white,
                  ),
                );
              },
            ),
    ),
  );
}

class Themeappbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final Color bgcolor;
  final isback;
  final Widget? leading;
  const Themeappbar(
      {super.key,
      this.title = "",
      this.actions,
      this.bgcolor = whitebg,
      this.isback = false,
      this.leading});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      actions: actions,
      backgroundColor: bgcolor,
      automaticallyImplyLeading: false,
      leading: Visibility(
          visible: isback,
          child: leading ??
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios))),
      title: Apptextwidget(
        title,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(fontWeight: FontWeight.w500, color: black),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

appdailog(context,
    {alert, content, actionsyes, ationtitleno, ationtitleyes, actionno}) {
  try {
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return CupertinoAlertDialog(title: alert, content: content, actions: [
        Visibility(
          visible: actionno != null,
          child: CupertinoButton(
              onPressed: actionno ??
                  () {
                    Navigator.pop(context);
                  },
              child: Apptextwidget(
                ationtitleno ?? "Cancel",
                // style: TxtStls.stl14,
              )),
        ),
        Visibility(
          visible: actionsyes != null,
          child: CupertinoButton(
              onPressed: actionsyes ?? () {},
              child: Apptextwidget(
                ationtitleyes ?? "Ok",
                //  style: TxtStls.stl14,
              )),
        )
      ]);
    } else {
      return AlertDialog(
        surfaceTintColor: grey,
        backgroundColor: whitebg,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 10,
        titlePadding: const EdgeInsets.all(15),
        contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        actionsPadding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        title: alert,
        content: content,
        actions: [
          Visibility(
            visible: actionno != null,
            child: TextButton(
                onPressed: actionno ??
                    () {
                      Navigator.pop(context);
                    },
                child: Apptextwidget(
                  ationtitleno ?? "Cancel",
                  //style: TxtStls.stl14,
                )),
          ),
          Visibility(
            visible: actionsyes != null,
            child: TextButton(
                onPressed: actionsyes ?? () {},
                child: Apptextwidget(
                  ationtitleyes ?? "Ok",
                  //style: TxtStls.stl14,
                )),
          )
        ],
      );
    }
  } catch (e) {
    log("Platform Exception $e");
  }
}

showAppDialog({context, alert}) {
  showAdaptiveDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert ??
          appdailog(context, alert: const Apptextwidget("Alert"), actionno: () {
            Navigator.pop(context);
          },
              actionsyes: () {},
              content: const Apptextwidget("This is custom dailog"));
    },
  );
}

Widget toggle(
  context, {
  titl1,
  title2,
  titlw1,
  titlew2,
  isSelected,
  tap,
  col,
}) {
  // Size size = MediaQuery.of(context).size;
  return SizedBox(
    height: 35,
    child: ToggleButtons(
        onPressed: tap,
        color: primary,
        fillColor: primary,
        splashColor: primary,
        highlightColor: primary,
        renderBorder: true,
        borderWidth: 1,
        borderRadius: BorderRadius.circular(30),
        borderColor: grey,
        selectedBorderColor: primary,
        disabledBorderColor: col ?? grey,
        disabledColor: col ?? grey,
        isSelected: isSelected,
        children: [
          titlw1 ??
              AnimatedContainer(
                curve: Curves.easeInOut,
                alignment: Alignment.center,
                width: 70,
                duration: const Duration(microseconds: 300),
                child: Text(titl1,
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(color: isSelected[0] ? whitebg : black)),
              ),
          titlew2 ??
              AnimatedContainer(
                curve: Curves.slowMiddle,
                alignment: Alignment.center,
                width: 70,
                duration: const Duration(microseconds: 300),
                child: Text(title2,
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(color: isSelected[1] ? whitebg : black)),
              ),
        ]),
  );
}
