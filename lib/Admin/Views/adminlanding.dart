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
      floatingActionButton: FloatingActionButton(
        backgroundColor: CupertinoColors.activeBlue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        onPressed: () {},
        child: const Icon(
          Icons.add,
          color: whitebg,
        ),
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
