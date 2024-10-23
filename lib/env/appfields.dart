import 'package:arunmall/env/appexports.dart';

Widget appspace({h, w}) {
  return h == null
      ? SizedBox(
          width: double.tryParse(w.toString()) ?? 5,
        )
      : SizedBox(
          height: double.tryParse(h.toString()) ?? 5,
        );
}

InputDecoration inputDecoration({labelText, hintText, col, isbalck = false}) {
  return InputDecoration(
    contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
    labelText: labelText,
    //labelStyle: isbalck ? TxtStls.labelStl : TxtStls.stl15,
    hintText: hintText,
    //hintStyle: TxtStls.hintStl,
    //fillColor: bgcol,
    filled: true,
    counterText: "",
    //errorStyle: TxtStls.errorStl,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color:primary),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color:primary),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: primary),
    ),
  );
}

Widget emailField({controller, labelText, hintText, isblack = false}) {
  return TextFormField(
    autofocus: false,
   // style: isblack ? TxtStls.wstl13 : TxtStls.stl13,
    controller: controller,
    decoration: inputDecoration(
        labelText: labelText, hintText: hintText, isbalck: isblack),
    textInputAction: TextInputAction.next,
    keyboardType: TextInputType.emailAddress,
    textCapitalization: TextCapitalization.none,
    validator: (email) {
      final RegExp emailRegex = RegExp(
        r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$',
        caseSensitive: false,
        multiLine: false,
      );
      if (email!.isEmpty) {
        return "";
      } else if (!emailRegex.hasMatch(email)) {
        return "$labelText is not formatted";
      } else {
        return null;
      }
    },
  );
}

Widget dobField(context,
    {controller,
    required controller1,
    labelText,
    hintText,
    type = "",
    isblack = false}) {
  return TextFormField(
    //style: isblack ? TxtStls.wstl13 : TxtStls.stl13,
    autofocus: false,
    controller: controller,
    readOnly: true,
    decoration: inputDecoration(
        labelText: labelText, hintText: hintText, isbalck: isblack),
    textInputAction: TextInputAction.next,
    keyboardType: TextInputType.name,
    textCapitalization: TextCapitalization.sentences,
    validator: (name) {
      if (name!.isEmpty) {
        return "";
      } else {
        return null;
      }
    },
    onTap: () {
      //selectDate(context, controller: controller, controller1: controller1);
    },
  );
}

Widget nameField(
    {controller, labelText, hintText, readOnly = false, isblack = false,col,form}) {
  return TextFormField(
    //style: isblack ? TxtStls.wstl13 : TxtStls.stl13,
    readOnly: readOnly,
    inputFormatters:form??[AlphabetTextInputFormatter()],
    autofocus: false,
    controller: controller,
    decoration: inputDecoration(
        labelText: labelText, hintText: hintText, isbalck: isblack,col: col),
    textInputAction: TextInputAction.next,
    keyboardType: TextInputType.name,
    textCapitalization: TextCapitalization.sentences,
    validator: (name) {
      if (name!.isEmpty) {
        return "";
      } else {
        return null;
      }
    },
  );
}

Widget textfiled(
    {controller, labelText, hintText, readOnly = false, isblack = false,col,}) {
  return TextFormField(
    //style: isblack ? TxtStls.wstl13 : TxtStls.stl13,
    readOnly: readOnly,
   // inputFormatters: [],
    autofocus: false,
    controller: controller,
    decoration: inputDecoration(
        labelText: labelText, hintText: hintText, isbalck: isblack,col: col),
    textInputAction: TextInputAction.next,
    keyboardType: TextInputType.name,
    textCapitalization: TextCapitalization.sentences,
    validator: (name) {
      if (name!.isEmpty) {
        return "";
      } else {
        return null;
      }
    },
  );
}

Widget fillButton(context,
    {required bool load, required String title, required onTap}) {
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
      width: load ? 50 : size.width,
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
          color: primary, borderRadius: BorderRadius.circular(10)),
      child: load
          ? const CircularProgressIndicator(color: primary)
          : Text(title,),
    ),
  );
}

Widget passwordField(
    {controller,
    labelText,
    hintText,
    obscureText,
    onPressed,
    isblack = false}) {
  return TextFormField(
    //style: isblack ? TxtStls.wstl13 : TxtStls.stl13,
    autofocus: false,
    controller: controller,
    decoration: InputDecoration(
      contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
      labelText: labelText,
      //labelStyle: TxtStls.labelStl,
      hintText: hintText,
      //hintStyle: TxtStls.hintStl,
      fillColor: Colors.transparent,
      filled: true,
      counterText: "",
      //errorStyle: TxtStls.errorStl,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: primary),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: primary),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: primary),
      ),
      suffixIcon: IconButton(
        icon: Icon(
          obscureText ? Icons.visibility_off : Icons.visibility,
          color: primary,
        ),
        onPressed: onPressed,
        // color: primary
      ),
    ),
    obscureText: obscureText,
    obscuringCharacter: "*",
    textInputAction: TextInputAction.done,
    keyboardType: TextInputType.visiblePassword,
    textCapitalization: TextCapitalization.none,
    validator: (password) {
      if (password!.isEmpty) {
        return "";
      } else if (password.length < 6) {
        return "$labelText should be more than 6 digits ";
      } else {
        return null;
      }
    },
  );
}

Widget phoneField({controller, labelText, hintText, isblack = false}) {
  return TextFormField(
    //style: isblack ? TxtStls.wstl13 : TxtStls.stl13,
    autofocus: false,
    controller: controller,
    decoration: inputDecoration(
        labelText: labelText, hintText: hintText, isbalck: isblack),
    textInputAction: TextInputAction.next,
    keyboardType:
        const TextInputType.numberWithOptions(signed: true, decimal: false),
    inputFormatters: <TextInputFormatter>[
      FilteringTextInputFormatter.digitsOnly
    ],
    maxLength: 10,
    validator: (phone) {
      if (phone!.isEmpty) {
        return "";
      } else if (phone.length != 10) {
        return "$labelText should be 10 digits only";
      } else {
        return null;
      }
    },
  );
}