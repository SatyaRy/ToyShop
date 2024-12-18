import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toyshop/presentation/components/favorite_list.dart';
import 'package:toyshop/presentation/models/trending_model.dart';
import 'package:toyshop/providers/trending.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TrendingProvider>(
        builder: (context, value, child) => ListView(
              padding: const EdgeInsets.only(left: 20, right: 20),
              children: [
                const SizedBox(
                  height: 40,
                ),
                const Text("Favorite",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    )),
                const SizedBox(
                  height: 10,
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: value.favoriteList.length,
                  separatorBuilder: (context,index)=> const SizedBox(height: 15,),
                  itemBuilder: (context, index) {
                    TrendingModel favoriteList = value.favoriteList[index];
                    return Favorite(favoriteList: favoriteList);
                  },
                ),
              ],
            ));
  }
}
