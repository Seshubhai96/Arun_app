import 'package:arunmall/env/appexports.dart';

class Roomsview extends StatefulWidget {
  const Roomsview({super.key});

  @override
  State<Roomsview> createState() => _RoomsviewState();
}

class _RoomsviewState extends State<Roomsview> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Roomcontroller>(builder: (context, roomctrl, child) {
      return Scaffold(
        appBar: Themeappbar(
          isback: true,
          title: "Rooms",
          actions: [
            GestureDetector(
              onTap: () {
                roomdaiog();
              },
              child: Container(
                margin: const EdgeInsets.only(right: 15),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                decoration: BoxDecoration(
                    color: primary, borderRadius: BorderRadius.circular(10)),
                child: Apptextwidget(
                  "+ Add Room",
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
            roomctrl.fetchrooms();
          },
          child: Appsized(
            height: genratemediaquery(context).size.height,
            width: genratemediaquery(context).size.width,
            child: roomctrl.roomloading
                ? const Loader()
                : roomctrl.roomList.isEmpty
                    ? const Eptywidget()
                    : Expanded(
                        child: ListView.builder(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            itemCount: roomctrl.roomList.length,
                            physics: const AlwaysScrollableScrollPhysics(),
                            itemBuilder: (_, i) {
                              final roomdata = roomctrl.roomList[i];
                              return Card(
                                color: whitebg,
                                child: ListTile(
                                  trailing: IconButton(
                                      onPressed: () {
                                        roomctrl.assignadata(roomdata.toJson());
                                        roomdaiog();
                                      },
                                      icon: const Icon(Icons.edit_note)),
                                  title: Apptextwidget(
                                    "Room No : ${roomdata.roomnumber?.text ?? "-"}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                            fontWeight: FontWeight.w500,
                                            color: black),
                                  ),
                                  subtitle: Apptextwidget(roomdata.type ?? "-"),
                                ),
                              );
                            }),
                      ),
          ),
        ),
      );
    });
  }

  roomdaiog() {
    showAppDialog(
        context: context,
        alert: Consumer<Roomcontroller>(builder: (_, roomctrl, child) {
          return appdailog(
            context,
            //ationtitleyes: "Add",
            actionsyes: () {
              if (roomctrl.roommodel.sId == null) {
                // log(roomctrl.roommodel.createjson().toString());
                roomctrl.roomcreateorupdate(context, endpoint: "rooms/create");
              } else {
                roomctrl.roomcreateorupdate(context,
                    endpoint: "rooms/editroom");
                // log(roomctrl.roommodel.toJson().toString());
              }
            },
            alert: Apptextwidget(
              roomctrl.roommodel.sId == null ? "Add Room" : "Edit Room",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            content: roomctrl.iscreateorupdateloading
                ? const Appsized(height: 200, child: Loader())
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      apptextfield(
                          label: "Room Number",
                          hint: "Enter Room Number",
                          keyboardtype: const TextInputType.numberWithOptions(
                              decimal: true, signed: true),
                          controller: roomctrl.roommodel.roomnumber!,
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
                            roomctrl.toggleData(val);
                            // roomctrl.changetrigger(val);
                          }, isSelected: roomctrl.toggleitems),
                        ],
                      )
                    ],
                  ),
            actionno: () {
              Navigator.pop(context);
              roomctrl.cleardata();
            },
          );
        }));
  }
}
