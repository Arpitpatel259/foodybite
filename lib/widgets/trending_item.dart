// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:foodybite/util/const.dart';

class TrendingItem extends StatefulWidget {
  final String img;
  final String title;
  final String address;
  final String rating;

  const TrendingItem({
    Key? key,
    required this.img,
    required this.title,
    required this.address,
    required this.rating,
  }) : super(key: key);

  @override
  _TrendingItemState createState() => _TrendingItemState();
}

class _TrendingItemState extends State<TrendingItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 2.5,
        width: MediaQuery.of(context).size.width,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          elevation: 3.0,
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 3.5,
                    width: MediaQuery.of(context).size.width,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      child: Image.asset(
                        widget.img,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 6.0,
                    right: 6.0,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0)),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.star,
                              color: Constants.ratingBG,
                              size: 10.0,
                            ),
                            Text(
                              " ${widget.rating} ",
                              style: const TextStyle(
                                fontSize: 10.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 6.0,
                    left: 6.0,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3.0)),
                      child: const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Text(
                          " OPEN ",
                          style: TextStyle(
                            fontSize: 10.0,
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 7.0),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w800,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              const SizedBox(height: 7.0),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    widget.address,
                    style: const TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
            ],
          ),
        ),
      ),
    );
  }
}
