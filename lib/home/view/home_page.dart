import 'package:dashboardflutter/authentication/bloc/authentication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class HomePage extends StatefulWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => HomePage());
  }

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ZoomDrawerController _zoomDrawerController;

  @override
  void initState() {
    super.initState();
    _zoomDrawerController = ZoomDrawerController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        leading: ElevatedButton(
          style: ButtonStyle(
            shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
          ),
          onPressed: () {
            _zoomDrawerController.toggle!();
          },
          child: Icon(Icons.menu),
        ),
      ),
      body: zoomDrawer(context),
    );
  }

  Widget mainScreen(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Builder(
            builder: (context) {
              final userId = context.select(
                (AuthenticationBloc bloc) => bloc.state.user.id,
              );
              return Text('UserID: $userId');
            },
          ),
          ElevatedButton(
            child: const Text('Logout'),
            onPressed: () {
              context
                  .read<AuthenticationBloc>()
                  .add(AuthenticationLogoutRequested());
            },
          )
        ],
      ),
    );
  }

  Widget menuScreen(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          // boxShadow: [
          //   BoxShadow(
          //       blurRadius: 10,
          //       color: Colors.red,
          //       spreadRadius: 5,
          //       offset: Offset(3.0, 0))
          // ],
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
            Theme.of(context).primaryColor,
            Theme.of(context).backgroundColor
          ])),
      child: Builder(builder: (context) {
        final menuList =
            context.select((AuthenticationBloc bloc) => bloc.state.menuList);
        print(menuList);
        return menuList == null
            ? Container()
            : ListView.builder(
                shrinkWrap: true,
                itemCount: menuList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(menuList[index].id),
                    subtitle: Text(menuList[index].menu_name),
                  );
                },
              );
      }),
    );
  }

  Widget zoomDrawer(BuildContext context) {
    return ZoomDrawer(
        controller: _zoomDrawerController,
        // showShadow: true,
        style: DrawerStyle.Style4,
        openCurve: Curves.fastOutSlowIn,
        closeCurve: Curves.bounceIn,
        menuScreen: menuScreen(context),
        mainScreen: mainScreen(context));
  }
}
