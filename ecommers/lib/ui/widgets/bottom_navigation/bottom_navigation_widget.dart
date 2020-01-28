import 'package:ecommers/common/pages.dart';
import 'package:ecommers/ui/decorations/index.dart';
import 'package:ecommers/ui/widgets/bottom_navigation/buttom_bar_item_icon.dart';
import 'package:ecommers/ui/widgets/bottom_navigation/consts.dart';
import 'package:flutter/material.dart';

class BottomNavigationWidget extends StatefulWidget {
  final Iterable<Pages> pages;
  final int selectedIndex;
  final Function(int) onTappedFunction;
  final int orderCount;

  BottomNavigationWidget({
    @required this.pages,
    @required this.selectedIndex,
    @required this.onTappedFunction,
    this.orderCount = 0,
  });

  @override
  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: _createBottomNavigationBarItems(),
      unselectedItemColor: Palette.bottomNavigationItemUnselected,
      selectedItemColor: Palette.bottomNavigationItemSelected,
      currentIndex: widget.selectedIndex,
      selectedLabelStyle: Styles.bottomnNavigationItemTitle,
      unselectedLabelStyle: Styles.bottomnNavigationItemTitle,
      iconSize: Dimens.navigationBottomIconSize,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      onTap: widget.onTappedFunction,
    );
  }

  _createBottomNavigationBarItems() {
    return widget.pages
        .map(
          (page) => BottomNavigationBarItem(
            icon: ButtomBarItemIcon(
              iconData: bottomNavigationItems[page].icon,
              hasBadge: page == Pages.cart,
              badgeValue: page == Pages.cart ? widget.orderCount : 0,
            ),
            title: Text(bottomNavigationItems[page].title),
          ),
        )
        .toList();
  }
}