import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scamhunters/pages/tab_favorites.dart';
import 'package:scamhunters/pages/tab_inves.dart';
import 'package:scamhunters/pages/tab_scams.dart';
import 'package:scamhunters/pages/tab_user.dart';
//import 'package:scamhunters/services/ScammerService.dart';

class TabsPage extends StatelessWidget {
  const TabsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) =>  _NavegationModel(),
      child: Scaffold(
        body: _Paginas(),
        bottomNavigationBar: _Navegacion(),
        floatingActionButton: _Nuevo(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}

class _Nuevo extends StatelessWidget {
  const _Nuevo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      onPressed: () {},
      child: Icon(Icons.filter_center_focus),
    );
  }
}

class _Navegacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavegationModel>(context);

    return BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: navegacionModel.paginaActual,
        onTap: (i) => navegacionModel.paginaActual = i,
        type: BottomNavigationBarType.fixed,
        items:const [
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: "Inv"),
          BottomNavigationBarItem(icon: Icon(Icons.public), label: "Scam"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: "Fav"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: "Per"),
        ]);
  }
}

class _Paginas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavegationModel>(context);
    return PageView(
      controller: navegacionModel.pageController,
      //physics: BouncingScrollPhysics(),
      physics: NeverScrollableScrollPhysics(),
      children:const [TabFavorites(), TabScammer(),TabInves(), TabUser()],
    );
  }
}

class _NavegationModel with ChangeNotifier {
  int _paginaActual = 0;
  final PageController _pageController = PageController(initialPage: 1);

  int get paginaActual => _paginaActual;
  set paginaActual(int valor) {
    _paginaActual = valor;
    _pageController.animateToPage(valor,
        duration: Duration(milliseconds: 250), curve: Curves.easeOut);
    notifyListeners();
  }

  PageController get pageController => _pageController;
}
