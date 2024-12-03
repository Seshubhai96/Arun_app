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
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          itemCount: userctrl.userslist.length,
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemBuilder: (_, u) {
                            final userdata = userctrl.userslist[u];
                            return ListTile(
                              title: Apptextwidget(
                                userdata.fullname?.text ?? "",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .copyWith(
                                        color: black,
                                        fontWeight: FontWeight.w500),
                              ),
                              subtitle: Column(
                                children: [
                                  Apptextwidget(userdata.email?.text ?? "",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium!
                                          .copyWith(
                                              color: black,
                                              fontWeight: FontWeight.w400)),
                                  Apptextwidget("User Type: ${userdata.type}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium!
                                          .copyWith(
                                              color: black,
                                              fontWeight: FontWeight.w400)),
                                  Apptextwidget(userdata.role.toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium!
                                          .copyWith(
                                              color: black,
                                              fontWeight: FontWeight.normal)),
                                ],
                              ),
                            );
                          }),
            ),
          ));
    });
  }
}
