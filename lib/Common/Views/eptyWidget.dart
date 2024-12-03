import 'package:arunmall/env/appexports.dart';

class Eptywidget extends StatelessWidget {
  const Eptywidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Apptextwidget(
        "No Record Found",
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(fontWeight: FontWeight.w500, color: black),
      ),
    );
  }
}
