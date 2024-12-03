import 'dart:convert';
import 'dart:developer';

import 'package:arunmall/env/appexports.dart';

class Filepickercontroller extends ChangeNotifier {
  Future sudhaimage(context) async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.media);
    if (result != null) {
      final fileExtension =
          result.files.single.extension.toString().toLowerCase();
      log(fileExtension);
      if (['jpg', 'jpeg', 'png', 'gif', '.jpg', '.jpeg', '.png', '.gif']
          .contains(fileExtension)) {
        await cropImage(context, imageFile: result.files.single.xFile.path);
      } else {
        showAdaptiveDialog(
            context: context,
            builder: (_) {
              return appdailog(context,
                  alert: const Apptextwidget("Alert"),
                  content: const Apptextwidget("Please pick image file"),
                  ationtitleno: "Ok", actionno: () {
                Navigator.pop(context);
              });
            });
      }

      // log(result.files.single.xFile.path);
      //log("${result.files.single.size / 1024} kb"); // Convert bytes to KB
    }
  }

  bool packetloading = false;

  Future cropImage(context, {imageFile}) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: imageFile,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: "Adjust Your Profile",
            toolbarColor: primary,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: "Adjust Your Profile",
        ),
        WebUiSettings(
          context: context,
        ),
      ],
    );
    if (croppedFile != null) {
      packetloading = true;
      notifyListeners();
      log("Cropped data ${await croppedFile.readAsBytes()}");
      log(base64Encode(await croppedFile.readAsBytes()));
      final box = GetStorage();
      var payload = {
        "image": base64Encode(await croppedFile.readAsBytes().whenComplete(() {
          packetloading = false;
          notifyListeners();
        })),
        "_id": box.read("id"),
      };

      Provider.of<Logincontroller>(context, listen: false)
          .updatebyid(payload: payload);

      // updateprofile(
      //         payload: {"Id": (await fethuserid()).toString(), "Image": croppedFile.path},
      //         file: croppedFile.path)
      //     .whenComplete(() {
      //  getbyid();
      // });
    }
  }
}