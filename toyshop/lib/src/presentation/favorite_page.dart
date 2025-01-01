import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritePage extends ConsumerWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return ListView(
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
                  itemCount: 1,
                  separatorBuilder: (context,index)=> const SizedBox(height: 15,),
                  itemBuilder: (context, index) {
                   
                    return const  Text('fix later');
                  },
                ),
              ],
            );
  }
}
