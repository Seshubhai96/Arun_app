import 'package:arunmall/env/Animated/speed_dial.dart';
import 'package:arunmall/env/Animated/speed_dial_child.dart';
import 'package:arunmall/env/appexports.dart';
import 'package:flutter/cupertino.dart';

class Adminlanding extends StatefulWidget {
  const Adminlanding({super.key});

  @override
  State<Adminlanding> createState() => _AdminlandingState();
}

class _AdminlandingState extends State<Adminlanding> {
  int index =0;
  final List<Widget> _pages = [const Admindashboard(),const Profile()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.extraLightBackgroundGray,
      body: _pages[index],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SpeedDial(
        backgroundColor: CupertinoColors.activeBlue,
        children: [
          SpeedDialChild(child: Icon(Icons.person_add)),
          SpeedDialChild(child: Icon(Icons.post_add)),
          SpeedDialChild(child: Icon(Icons.hotel))
        ],
        child: const Icon(Icons.add,color: whitebg,), 
      ),
      bottomNavigationBar: BottomAppBar(
        surfaceTintColor:CupertinoColors.extraLightBackgroundGray,
        color: CupertinoColors.extraLightBackgroundGray,
        clipBehavior: Clip.antiAlias,
        height: 100,
        shape: const CircularNotchedRectangle(),
        notchMargin: 12.0,
        child: BottomNavigationBar(onTap: (val){
          setState(() {
            index=val;
          });
        },currentIndex: index,elevation: 0,backgroundColor: CupertinoColors.extraLightBackgroundGray,items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(
            Icons.person,
          ),label: "Profile")
        ]),
      ),
    );
  }
}
