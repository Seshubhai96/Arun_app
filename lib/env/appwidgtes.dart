// ignore_for_file: must_be_immutable

import 'dart:convert';
import 'dart:developer';
import 'package:dropdown_button2/dropdown_button2.dart';
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
          : Image.memory(
              base64Decode(url),
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

Widget usersCard(context, {image, ctrl, onPressed}) {
  return Card(
    color: grey,
    child: Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              networkImages(
                url: image ?? "assets/swagth.jpg",
                size: 50.0,
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Apptextwidget(
                    ctrl.fullname?.text ?? "",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: black,
                        ),
                  ),
                  Apptextwidget(
                    ctrl.email?.text ?? "",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w300,
                          color: black,
                        ),
                  ),
                  Apptextwidget(
                    ctrl.role.toString(),
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w300,
                          color: black,
                        ),
                  ),
                  Apptextwidget(
                    "Phone :7534878973",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w300,
                          color: black,
                        ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: IconButton(
            onPressed: onPressed,
            icon: const Icon(
              Icons.edit_note,
              color: Colors.black,
            ),
          ),
        ),
      ],
    ),
  );
}

// ignore: non_constant_identifier_names
Widget MydropDown(
    {value, hint, labelText, required List items, required onChanged}) {
  return DropdownButtonFormField2(
    value: value,
    isDense: false,
    dropdownStyleData: DropdownStyleData(
        maxHeight: 250,
        isOverButton: true,
        padding: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: Colors.white),
        scrollbarTheme: const ScrollbarThemeData(
            radius: Radius.circular(6), thickness: WidgetStatePropertyAll(6))),
    decoration: InputDecoration(
      labelText: labelText ?? "",
      // labelStyle: TxtStls.txtStle,
      isDense: true,
      contentPadding: EdgeInsets.zero,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
      ),
    ),
    isExpanded: true,
    hint: Text(
      hint ?? "",
      //  style: TxtStls.txtStle,
    ),
    barrierLabel: "Select Gender",
    items: items
        .map((item) => DropdownMenuItem(
              value: item.toString(),
              child: Text(
                item.toString(),
                // style: TxtStls.txtStle,
              ),
            ))
        .toList(),
    onChanged: onChanged,
  );
}

Widget MydropDownApi(
    {value,
    hint,
    labelText,
    required items,
    required onChanged,
    mandatory = false}) {
  return DropdownButtonFormField2(
    autovalidateMode: AutovalidateMode.onUserInteraction,
    value: value,
    isDense: false,
    dropdownStyleData: DropdownStyleData(
        maxHeight: 250,
        isOverButton: true,
        // padding: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: Colors.white),
        scrollbarTheme: const ScrollbarThemeData(
            radius: Radius.circular(6), thickness: WidgetStatePropertyAll(6))),
    decoration: InputDecoration(
      label: mandatory
          ? mandatoryRichText(label: labelText)
          : Text(
              labelText,
              // style: TxtStls.txtStle,
            ),
      isDense: true,
      contentPadding: EdgeInsets.zero,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
      ),
    ),
    isExpanded: true,
    hint: Text(
      hint,
      //style: TxtStls.txtStle,
    ),
    items: items,
    onChanged: onChanged,
    validator: mandatory
        ? (value) {
            if (value == "0") {
              return "";
            } else if (value == null) {
              return "";
            } else {
              return null;
            }
          }
        : null,
  );
}

// Widget MultiDropdown(context,
//     {lable,
//     hint,
//     List? selectedList,
//     mainlist,
//     required Function(bool value, String data) onTap}) {
//   Size size = MediaQuery.of(context).size;
//   List<dynamic> searchList = List.from(mainlist);
//   return Consumer<BasicHealthMngController>(builder: (context, dr, child) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(lable, style: TxtStls.txtStle),
//         InkWell(
//           child: Container(
//             alignment: Alignment.center,
//             padding: const EdgeInsets.symmetric(horizontal: 8),
//             height: 50,
//             width: size.width,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 border: Border.all(color: txtColor.withOpacity(0.5))),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Expanded(
//                   child: selectedList!.isEmpty
//                       ? Text(hint, style: TxtStls.txtStle)
//                       : ListView(
//                           physics: const BouncingScrollPhysics(),
//                           shrinkWrap: true,
//                           scrollDirection: Axis.horizontal,
//                           children: selectedList
//                               .map((e) => Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 4),
//                                     child: Chip(
//                                       label: Text(e.toString(),
//                                           style: TxtStls.txtStle),
//                                       onDeleted: () {
//                                         dr.RemoveData(
//                                             slectedlist: selectedList,
//                                             all: false,
//                                             value: e.toString());
//                                       },
//                                     ),
//                                   ))
//                               .toList()),
//                 ),
//                 IconButton(
//                     onPressed: () {
//                       // dr.RemoveData(
//                       //     slectedlist: selectedList, all: true, value: "");
//                     },
//                     icon: const Icon(
//                       Icons.cancel_rounded,
//                       color: Colors.red,
//                     ))
//               ],
//             ),
//           ),
//           onTap: () {
//             showModalBottomSheet(
//               shape: ShapeBorder.lerp(
//                 const RoundedRectangleBorder(
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(20),
//                     topRight: Radius.circular(20),
//                   ),
//                 ),
//                 RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(0.0),
//                 ),
//                 0.5,
//               ),
//               context: context,
//               isScrollControlled: true,
//               builder: (BuildContext context) {
//                 return Consumer<Logincontroller>(
//                     builder: (context, dynamic controller, child) {
//                   return DraggableScrollableSheet(
//                     maxChildSize: 0.8,
//                     expand: false,
//                     builder: (BuildContext context,
//                         ScrollController scrollController) {
//                       return Container(
//                         padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
//                         decoration: const BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.only(
//                             topLeft: Radius.circular(16.0),
//                             topRight: Radius.circular(16.0),
//                           ),
//                         ),
//                         child: Column(
//                           children: [
//                             // mySearch(context,
//                             //     controller:TextEditingController() ,
//                             //     hint: "Search Test....", search: (value) {
//                             //   dr.searchList(value, searchList, mainlist);
//                             // }),
//                             Expanded(
//                               child: ListView.builder(
//                                 shrinkWrap: true,
//                                 physics: const BouncingScrollPhysics(),
//                                 controller: scrollController,
//                                 itemCount: searchList.length,
//                                 itemBuilder: (BuildContext context, int index) {
//                                   final data = searchList[index];
//                                   return CheckboxListTile(
//                                     activeColor: primary,
//                                     controlAffinity:
//                                         ListTileControlAffinity.leading,
//                                     value: selectedList.contains(data),
//                                     onChanged: (value) {
//                                       onTap(value!, data);
//                                     },
//                                     title: Text(
//                                       data.toString(),
//                                     ),
//                                   );
//                                 },
//                               ),
//                             ),
//                           ],
//                         ),
//                       );
//                     },
//                   );
//                 });
//               },
//             );
//           },
//         ),
//       ],
//     );
//   });
// }

Widget mySearch(BuildContext context,
    {required TextEditingController? controller,
    required hint,
    required search}) {
  return TextField(
      textInputAction: TextInputAction.search,
      controller: controller,
      cursorColor: primary,
      cursorHeight: 20,
      decoration: InputDecoration(
        hintText: hint,
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        //hintStyle: TxtStls.txtStle,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        suffixIcon: controller!.text.isNotEmpty
            ? IconButton(
                icon: const Icon(
                  Icons.close,
                  color: black,
                ),
                onPressed: () {
                  controller.clear();
                  search("");
                  FocusScope.of(context).requestFocus(FocusNode());
                },
              )
            : const Icon(
                Icons.search,
                color: black,
              ),
      ),
      onChanged: search);
}

mandatoryRichText({label}) {
  return RichText(
      text: TextSpan(text: label, children: const [
    WidgetSpan(
        child: Appsized(
      width: 5,
    )),
    TextSpan(text: "*", style: TextStyle(color: redclr))
  ]));
}
