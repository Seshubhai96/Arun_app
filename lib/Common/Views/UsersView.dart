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
          backgroundColor: grey,
          appBar: Themeappbar(
            isback: true,
            title: "Users",
            actions: [
              GestureDetector(
                onTap: () {
                  NavigationSlide(context, Profileupdate(userid: context));
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 15),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  decoration: BoxDecoration(
                      color: primary, borderRadius: BorderRadius.circular(10)),
                  child: Apptextwidget(
                    "+ Add User",
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium
                        ?.copyWith(color: whitebg),
                  ),
                ),
              )
            ],
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
                            return usersCard(context,
                                image: userdata.image,
                                ctrl: userdata, onPressed: () {
                              NavigationSlide(
                                  context,
                                  Profileupdate(
                                    userid: userdata.sId,
                                  ));
                            });
                          }),
            ),
          ));
    });
  }
}
