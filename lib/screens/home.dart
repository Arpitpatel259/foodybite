import 'dart:io';

import 'package:flutter/material.dart';
import 'package:foodybite/screens/categories.dart';
import 'package:foodybite/screens/trending.dart';
import 'package:foodybite/screens/friends.dart';
import 'package:foodybite/util/categories.dart';
import 'package:foodybite/util/friends.dart';
import 'package:foodybite/util/restaurants.dart';
import 'package:foodybite/widgets/category_item.dart';
import 'package:foodybite/widgets/search_card.dart';
import 'package:foodybite/widgets/slide_item.dart';
import 'package:foodybite/widgets/friend_item.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildSearchBar(context),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 20.0),
            buildRestaurantRow('Trending Restaurants', context),
            const SizedBox(height: 10.0),
            buildRestaurantList(context),
            const SizedBox(height: 10.0),
            buildCategoryRow('Category', context),
            const SizedBox(height: 10.0),
            buildCategoryList(context),
            const SizedBox(height: 20.0),
            buildFriendRow('Friends', context),
            const SizedBox(height: 10.0),
            buildFriendsList(context),
            const SizedBox(height: 30.0),
          ],
        ),
      ),
    );
  }

  buildRestaurantRow(String restaurant, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          restaurant,
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w800,
          ),
        ),
        // ignore: deprecated_member_use
        TextButton(
          child: Text(
            "See all (9)",
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return const Trending();
                },
              ),
            );
          },
        ),
      ],
    );
  }
  buildRestaurantList(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2.4,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        // ignore: unnecessary_null_comparison
        itemCount: restaurants == null ? 0 : restaurants.length,
        itemBuilder: (BuildContext context, int index) {
          Map restaurant = restaurants[index];

          return Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: SlideItem(
              img: restaurant["img"],
              title: restaurant["title"],
              address: restaurant["address"],
              rating: restaurant["rating"],
              key: null,
            ),
          );
        },
      ),
    );
  }

  buildCategoryRow(String category, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          category,
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w800,
          ),
        ),
        // ignore: deprecated_member_use
        TextButton(
          child: Text(
            "See all (9)",
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) {
                  // ignore: prefer_const_constructors
                  return Categories();
                },
              ),
            );
          },
        ),
      ],
    );
  }
  buildCategoryList(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 6,
      child: ListView.builder(
        primary: false,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        // ignore: unnecessary_null_comparison
        itemCount: categories == null ? 0 : categories.length,
        itemBuilder: (BuildContext context, int index) {
          Map cat = categories[index];

          return CategoryItem(
            cat: cat,
          );
        },
      ),
    );
  }

  buildSearchBar(BuildContext context) {
    return PreferredSize(
      preferredSize: Size(
        MediaQuery.of(context).size.width,
        60.0,
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: Platform.isAndroid ? 30.0 : 50.0,
          left: 10.0,
          right: 10.0,
        ),
        child: SearchCard(),
      ),
    );
  }

  buildFriendRow(String friends, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          friends,
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w800,
          ),
        ),
        // ignore: deprecated_member_use
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) {

                  // ignore: prefer_const_constructors
                  return Friends();
                },
              ),
            );
          },
          child: Text(
            "See all (9)",
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),
      ],
    );
  }
  buildFriendsList(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 6,
      child: ListView.builder(
        primary: false,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        // ignore: unnecessary_null_comparison
        itemCount: friends == null ? 0 : friends.length,
        itemBuilder: (BuildContext context, int index) {
          Map frd = friends[index];


          return FriendItem(
            frd: frd,
          );
        },
      ),
    );
  }
}
