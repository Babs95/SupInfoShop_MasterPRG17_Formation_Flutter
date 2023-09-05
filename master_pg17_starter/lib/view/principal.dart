import 'package:flutter/material.dart';
import 'package:master_pg17_starter/commons/size_config.dart';
import 'package:master_pg17_starter/components/default_app_bar.dart';

import 'accueil/accueil.dart';

class PrincipalScreen extends StatefulWidget{
  static const String routeName = '/principal';
  const PrincipalScreen({super.key});

  @override
  State<StatefulWidget> createState() => PrincipalScreenState();

}

class PrincipalScreenState extends State<PrincipalScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          const SimpleAppBar(title: 'Accueil',)
        ],
        body: AccueilScreen(),
      ),
    );
  }

}