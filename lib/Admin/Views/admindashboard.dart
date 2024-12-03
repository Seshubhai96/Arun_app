import 'package:arunmall/env/appexports.dart';
import 'package:flutter/cupertino.dart';

class Admindashboard extends StatefulWidget {
  const Admindashboard({super.key});

  @override
  State<Admindashboard> createState() => _AdmindashboardState();
}

class _AdmindashboardState extends State<Admindashboard> {
  var pages = [
    {"label": "Rooms", "stats": "20","ico":Icons.hotel},
    {"label": "Products", "stats": "2000000000000000000000000000","ico":Icons.list},
    {"label": "Users", "stats": "15","ico":Icons.group},
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: genratemediaquery(context).size.height,
      width: genratemediaquery(context).size.width,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        children: [
          GridView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: pages.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 16 / 9),
              itemBuilder: (_, i) {
                final data = pages[i];
                return Card(
                  color: CupertinoDynamicColor.resolve(whitebg, context),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Apptextwidget(
                                data["label"] as String,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(
                                        fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              const Appsized(height: 10,),
                              Flexible(
                                child: Apptextwidget(
                                  data["stats"] as String,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.copyWith(
                                          fontSize: 30, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      Icon(data["ico"] as IconData,size: 30,)
                      ],
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }
}
