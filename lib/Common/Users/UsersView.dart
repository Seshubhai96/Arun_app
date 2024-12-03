import 'package:arunmall/env/appexports.dart';

class Usersview extends StatefulWidget {
  const Usersview({super.key});

  @override
  State<Usersview> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Usersview> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Userscontroller>(builder: (context, userctrl, child) {
      return Scaffold(
          backgroundColor: whitebg,
          appBar: const Themeappbar(
            isback: true,
            title: "Users",
          ),
          body: RefreshIndicator(
            onRefresh: () async {
              userctrl.fetchUsers();
            },
            child: Appsized(
              height: genratemediaquery(context).size.height,
              width: genratemediaquery(context).size.width,
              child: userctrl.usersloaging
                  ? const Loader()
                  : userctrl.userslist.isEmpty
                      ? const Eptywidget()
                      : ListView.builder(
                          shrinkWrap: true,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          itemCount: userctrl.userslist.length,
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemBuilder: (_, u) {
                            final userdata = userctrl.userslist[u];
                            return Card(
                              color: grey,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        networkImages(
                                            url: userdata.image ??
                                                "assets/swagth.jpg",
                                            size: 50.0),
                                        const Appsized(width: 10),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Apptextwidget(
                                                  userdata.fullname?.text ?? "",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge!
                                                      .copyWith(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: black),
                                                ),
                                                IconButton(
                                                    onPressed: () {},
                                                    icon: const Icon(
                                                        Icons.edit_note))
                                              ],
                                            ),
                                            Apptextwidget(
                                              userdata.email?.text ?? "",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      color: black),
                                            ),
                                            Row(
                                              children: [
                                                Apptextwidget(
                                                  userdata.role.toString(),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium!
                                                      .copyWith(
                                                          fontWeight:
                                                              FontWeight.w300,
                                                          color: black),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              // child: ListTile(
                              //   title: Apptextwidget(
                              //     userdata.fullname?.text ?? "",
                              //     style: Theme.of(context)
                              //         .textTheme
                              //         .labelLarge!
                              //         .copyWith(
                              //             color: black,
                              //             fontWeight: FontWeight.w500),
                              //   ),
                              //   subtitle: Column(
                              //     children: [
                              //       Apptextwidget(userdata.email?.text ?? "",
                              //           style: Theme.of(context)
                              //               .textTheme
                              //               .labelMedium!
                              //               .copyWith(
                              //                   color: black,
                              //                   fontWeight: FontWeight.w400)),
                              //       Apptextwidget("User Type: ${userdata.type}",
                              //           style: Theme.of(context)
                              //               .textTheme
                              //               .labelMedium!
                              //               .copyWith(
                              //                   color: black,
                              //                   fontWeight: FontWeight.w400)),
                              //       Apptextwidget(userdata.role.toString(),
                              //           style: Theme.of(context)
                              //               .textTheme
                              //               .headlineSmall!
                              //               .copyWith(
                              //                   color: black,
                              //                   fontWeight: FontWeight.normal)),
                              //     ],
                              //   ),
                              // ),
                            );
                          }),
            ),
          ));
    });
  }
}
