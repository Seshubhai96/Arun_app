import 'package:arunmall/env/appexports.dart';

class Roomsview extends StatefulWidget {
  const Roomsview({super.key});

  @override
  State<Roomsview> createState() => _RoomsviewState();
}

TextEditingController roomFormCtrl = TextEditingController();

class _RoomsviewState extends State<Roomsview> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Adminlandingcontroller>(
        builder: (context, roomctrl, child) {
      return Scaffold(
        appBar: const Themeappbar(
          isback: true,
          title: "Rooms",
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            roomctrl.fetchrooms();
          },
          child: Appsized(
            height: genratemediaquery(context).size.height,
            width: genratemediaquery(context).size.width,
            child: roomctrl.roomloading
                ? const Loader()
                : roomctrl.roomList.isEmpty
                    ? const Eptywidget()
                    : ListView.builder(
                        itemCount: roomctrl.roomList.length,
                        physics: const AlwaysScrollableScrollPhysics(),
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        itemBuilder: (_, i) {
                          final roomdata = roomctrl.roomList[i];
                          return Card(
                            color: whitebg,
                            child: ListTile(
                              title: Apptextwidget(
                                "Room No : ${roomdata.roomnumber ?? "-"}",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                        fontWeight: FontWeight.w300,
                                        color: black),
                              ),
                              subtitle: Apptextwidget(roomdata.type ?? "-"),
                            ),
                          );
                        }),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: primary,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          onPressed: () {
            showAppDialog(
                context: context,
                alert: appdailog(
                  context,
                  alert: Apptextwidget(
                    "Add New Room",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      apptextfield(
                          keyboardtype: const TextInputType.numberWithOptions(
                              decimal: true, signed: true),
                          controller: roomFormCtrl,
                          maxlenth: 3,
                          formatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ]),
                      const Appsized(height: 10),
                      toggle(context,
                          titl1: "Ac",
                          title2: "Non Ac",
                          isSelected: [false, false])
                    ],
                  ),
                  actionno: () {
                    Navigator.pop(context);
                  },
                ));
          },
          child: const Icon(
            Icons.add,
            color: whitebg,
          ),
        ),
      );
    });
  }
}
