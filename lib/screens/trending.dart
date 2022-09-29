import 'package:flutter/material.dart';
import 'package:foodybite/util/restaurants.dart';
import 'package:foodybite/widgets/search_card.dart';
import 'package:foodybite/widgets/trending_item.dart';

class Trending extends StatelessWidget {
  const Trending({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text("Trending Restaurants"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 0,
          horizontal: 10.0,
        ),
        child: ListView(
          children: <Widget>[
            SearchCard(),
            const SizedBox(height: 10.0),
            ListView.builder(
              primary: false,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              // ignore: unnecessary_null_comparison
              itemCount: restaurants == null ? 0 : restaurants.length,
              itemBuilder: (BuildContext context, int index) {
                Map restaurant = restaurants[index];

                return TrendingItem(
                  img: restaurant["img"],
                  title: restaurant["title"],
                  address: restaurant["address"],
                  rating: restaurant["rating"], key: null,
                );
              },
            ),
            const SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}
