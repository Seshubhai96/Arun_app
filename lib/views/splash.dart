import 'dart:developer';
import 'dart:io';
import 'package:arunmall/env/appexports.dart';
import 'package:cunning_document_scanner/cunning_document_scanner.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  List<String> files = [];
  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((val) {
      Apimethods().loginmethod(
          body: {"email": "seshu@gmail.com", "password": "Test@123"},
          endpoint: "Authentication/Login");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () async {
                  try {
                    var file = await CunningDocumentScanner.getPictures();
                    if (file!.isNotEmpty) {
                      setState(() {
                        files = file;
                      });
                      //log(file.map((e) => e).toList().toString());
                    } else {
                      log("user canceled opertion");
                    }
                  } catch (e) {
                    log("failed to load scanner");
                  }
                },
                child: const Text("Scan me")),
            FutureBuilder(
                future: processtextfromimage(file: File(files[0])),
                builder: (_, snap) {
                  if (!snap.hasData) {
                    return const Center(
                      child: Text("EXtract text from Image"),
                    );
                  }
                  return Text(snap.data as String);
                }),
            Visibility(
                visible: files.isNotEmpty,
                child: Expanded(
                    child: ListView.builder(
                        itemCount: files.length,
                        shrinkWrap: true,
                        itemBuilder: (_, i) {
                          var data = files[i];
                          return SizedBox(
                            height: 200,
                            width: 200,
                            child: Image.file(File(data)),
                          );
                        })))
          ],
        ),
      ),
    );
  }

  processtextfromimage({required File file}) async {
    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
    final InputImage inputImage = InputImage.fromFile(file);
    final RecognizedText recognizedText =
        await textRecognizer.processImage(inputImage);
    String text = recognizedText.text;
    log(text);
    textRecognizer.close();
    return text;
  }
}
