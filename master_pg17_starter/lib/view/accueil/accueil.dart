import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import 'package:master_pg17_starter/commons/config.dart';
import 'package:master_pg17_starter/commons/constant_color.dart';
import 'package:master_pg17_starter/commons/size_config.dart';
import 'package:master_pg17_starter/model/response/CategorieResponse.dart';

import '../../model/app_adds.dart';
import '../../model/categorie.dart';

class AccueilScreen extends StatefulWidget {
  static const String routeName = '/home';
  const AccueilScreen({super.key});

  @override
  State<StatefulWidget> createState() => AccueilScreenState();

}

class AccueilScreenState extends State<AccueilScreen> {
  bool _loading =false;
  List<Categorie> categories = [];

  @override
  void initState() {
    _getCategories();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 20.0, top: 10.0),
            child: Row(
              children: List.generate(appAddsCardList.isEmpty ? 0 : appAddsCardList.length, (index) {
                AppAddsCard item = appAddsCardList[index];
                Logger().i("item $item");
                return Container(
                  margin: const EdgeInsets.only(right: 10.0),
                  width: getProportionateScreenWidth(SizeConfig.screenWidth70),
                  height: getProportionateScreenWidth(SizeConfig.screenHeight25),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.asset(
                      item.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  )
                );
              }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0,right: 200.0),
            child: Text(
              'Categories',
              style: TextStyle(
                fontSize: SizeConfig.isTablet ? 30 : 25,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          GridView.count(
            mainAxisSpacing: 2.0,
            crossAxisSpacing: 5.0,
            childAspectRatio: 0.90,
            crossAxisCount: 2,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: List.generate(categories.isEmpty ? 0 : categories.length, (index) {
              Categorie item = categories[index];
              Logger().i("item categorie ${item.iconName}");
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: BoxDecoration(
                  color: kDarkPrimaryColor,
                  borderRadius: BorderRadius.circular(20.0)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      item.libelle ?? '',
                      style: TextStyle(
                        color: kWhiteColor,
                        fontSize: SizeConfig.isTablet ? 25 : 18,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Container(
                      width: getProportionateScreenWidth(SizeConfig.screenHeight35),
                      height: getProportionateScreenHeight(SizeConfig.screenHeight20),
                      decoration: const BoxDecoration(
                        color: kGreyLightColor,
                        shape: BoxShape.circle
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Image.network(
                          item.iconName!,
                          width: 70.0,
                          height: 100.0,
                        ),
                      ),
                    )
                  ],
                ),
              );
            }),
          )
        ],
      ),
    );
  }

  _getCategories() async {
    try{
      CategorieResponse response = await Config.restClient!.getCategories();
      Logger().i('response.categories1 ${response?.categories}');
      if(response != null && response.categories != null){
        Logger().i('response.categories ${response.categories}');
        categories = response.categories!;
      }
    }catch(error){
      Logger().i('Get categories error $error');
    }
  }
}