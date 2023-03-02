import 'package:course_app/constants.dart';
import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({super.key, this.index, this.onTapped});
  final int? index;
  final Function? onTapped;

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
                color:  Colors.white,
                shape: const CircularNotchedRectangle(),
                notchMargin: 5,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                        child: IconButton(
                      icon: const Icon(Icons.home),
                      onPressed: () => {widget.onTapped!(0)},
                      color: widget.index == 0 ? kPrimaryColor : Colors.grey
                    )),
                    Expanded(
                        child: IconButton(
                      icon: const Icon(
                        Icons.point_of_sale,
                      ),
                      onPressed: () => {widget.onTapped!(1)},
                      color: widget.index == 1 ? kPrimaryColor : Colors.grey
                    )),
                    const Expanded(child: SizedBox()),
                    Expanded(
                        child: IconButton(
                      icon: const Icon(
                        Icons.leaderboard,
                      ),
                      onPressed: () => {widget.onTapped!(2)},
                      color: widget.index == 2 ? kPrimaryColor : Colors.grey
                    )),
                    Expanded(
                        child: IconButton(
                      icon: const Icon(
                        Icons.person,
                      ),
                      onPressed: () => {widget.onTapped!(3)},
                      color: widget.index == 3 ? kPrimaryColor : Colors.grey
                    )),
                  ],
                )
                );
  }
}