// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:arunmall/env/appexports.dart';

class Profileupdate extends StatefulWidget {
  final userid;
  const Profileupdate({super.key, required this.userid});

  @override
  State<Profileupdate> createState() => _ProfileupdateState();
}

class _ProfileupdateState extends State<Profileupdate> {
  String? selectedGender;
  final List<String> genderOptions = ['Male', 'Female', 'Other'];
  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((val) {
      Provider.of<Userscontroller>(context, listen: false)
          .getbyuserid(payload: widget.userid);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Userscontroller>(builder: (context, userctrl, child) {
      return Scaffold(
        backgroundColor: whitebg,
        appBar: const Themeappbar(
          title: "Update Profile",
          isback: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 160,
                  width: genratemediaquery(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), color: grey),
                  child: Column(
                    children: [
                      const Appsized(height: 10),
                      Stack(
                        children: [
                          networkImages(
                              url: userctrl.usersModel.image ??
                                  "assets/profileimage.jpg",
                              size: 110.0),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: GestureDetector(
                              onTap: () {},
                              child: const CircleAvatar(
                                radius: 16,
                                backgroundColor: Colors.blue,
                                child: Icon(
                                  Icons.camera_alt,
                                  color: Colors.white,
                                  size: 18,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Appsized(height: 10),
                      Apptextwidget(
                        userctrl.usersModel.role ?? "",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: black, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Apptextwidget(
                  "Full Name:",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: black, fontWeight: FontWeight.w500),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    isDense: true,
                    //contentPadding: EdgeInsets.zero,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    ),
                  ),
                ),
                const Appsized(height: 15),
                Apptextwidget(
                  "Email:",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: black, fontWeight: FontWeight.w500),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    isDense: true,
                    //contentPadding: EdgeInsets.zero,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2.0)),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Apptextwidget(
                      "Gender:",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: black, fontWeight: FontWeight.w500),
                    ),
                    Apptextwidget(
                      "Type:  ",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: black, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const Appsized(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: genratemediaquery(context).size.width / 2.5,
                      child: MydropDown(
                          items: genderOptions,
                          onChanged: (val) {
                            setState(() {});
                          },
                          value: selectedGender),
                    ),
                    SizedBox(
                      width: genratemediaquery(context).size.width / 2.5,
                      child: MydropDown(
                          items: genderOptions,
                          onChanged: (val) {
                            setState(() {});
                          },
                          value: selectedGender),
                    ),
                  ],
                ),
                const Appsized(height: 40),
                Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: genratemediaquery(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue),
                  child: Apptextwidget(
                    "Submit",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: whitebg, fontWeight: FontWeight.w700),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
