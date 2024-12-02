import 'dart:developer';

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
    return Consumer<Roomcontroller>(builder: (context, roomctrl, child) {
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
                        padding: const EdgeInsets.symmetric(horizontal: 10),
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
            // showAppDialog(context: context);
            showAppDialog(
                context: context,
                alert: appdailog(
                  context,
                  //ationtitleyes: "Add",
                  actionsyes: () {
                    var payload = {
                      'roomnumber': roomctrl.rnCtrl.text,
                      'type': roomctrl.toggleitems[0]
                          ? "Ac"
                          : roomctrl.toggleitems[1]
                              ? "Nonac"
                              : null
                    };
                    log(payload.toString());
                  },
                  alert: Apptextwidget(
                    "Add New Room",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  content: Consumer<Roomcontroller>(
                      builder: (context, roomCntrl, child) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        apptextfield(
                            label: "Room Number",
                            hint: "Enter Room Number",
                            keyboardtype: const TextInputType.numberWithOptions(
                                decimal: true, signed: true),
                            controller: roomctrl.rnCtrl,
                            maxlenth: 3,
                            formatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ]),
                        const Appsized(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Apptextwidget(
                              "RoomType",
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            const Appsized(
                              height: 10,
                            ),
                            toggle(context, titl1: "Ac", title2: "Non Ac",
                                tap: (val) {
                              roomCntrl.toggleData(val);
                              // roomctrl.changetrigger(val);
                            }, isSelected: roomCntrl.toggleitems),
                          ],
                        )
                      ],
                    );
                  }),
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
