import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:spotlas_test/models/spot.dart';
import 'package:timeago/timeago.dart' as timeago;

class SpotPart extends StatefulWidget {
  const SpotPart({Key? key, required this.spot}) : super(key: key);

  final Spot spot;

  @override
  _SpotPartState createState() => _SpotPartState();
}

class _SpotPartState extends State<SpotPart> {
  bool isLiked = false;
  bool isSaved = false;
  late List<String> photoUrls;
  late double xxxxsMargin;
  late double xxxsMargin;
  late double xxsMargin;
  late double xsMargin;
  late double sMargin;
  late double mMargin;
  late double lMargin;
  late double xlMargin;
  late double xxlMargin;
  late double xxxlMargin;
  late double xxxxlMargin;
  late DateTime createdSpot;

  void getMargin(MediaQueryData screenWidth) {
    if (screenWidth.size.width >= 320 && screenWidth.size.width < 375) {
      xxxxsMargin = 1;
      xxxsMargin = 1;
      xxsMargin = 2;
      xsMargin = 4;
      sMargin = 8;
      mMargin = 12;
      lMargin = 16;
      xlMargin = 24;
      xxlMargin = 32;
      xxxlMargin = 48;
      xxxxlMargin = 96;
    } else if (screenWidth.size.width > 375 && screenWidth.size.width <= 428) {
      xxxxsMargin = 1;
      xxxsMargin = 3;
      xxsMargin = 6;
      xsMargin = 12;
      sMargin = 16;
      mMargin = 24;
      lMargin = 32;
      xlMargin = 40;
      xxlMargin = 56;
      xxxlMargin = 80;
      xxxxlMargin = 160;
    } else {
      xxxxsMargin = 1;
      xxxsMargin = 2;
      xxsMargin = 4;
      xsMargin = 8;
      sMargin = 12;
      mMargin = 26;
      lMargin = 24;
      xlMargin = 32;
      xxlMargin = 48;
      xxxlMargin = 64;
      xxxxlMargin = 128;
    }
  }

  @override
  void initState() {
    super.initState();
    photoUrls = widget.spot.photoUrls;
    createdSpot = DateTime.parse(widget.spot.createdAt);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getMargin(MediaQuery.of(context));
  }

  @override
  Widget build(BuildContext context) {
    final Duration now = DateTime.now().difference(createdSpot);
    final DateTime displayDate = DateTime.now().subtract(now);

    return Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            CarouselSlider(
              options: CarouselOptions(
                viewportFraction: 1,
                height: MediaQuery.of(context).size.height * 0.7,
              ),
              items: photoUrls.map((url) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(url),
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(sMargin, sMargin, lMargin, lMargin),
              child: Row(
                children: <Widget>[
                  SpotAvatar(
                    url: widget.spot.authorPhotoUrl,
                    backgroundColor: Colors.red,
                  ),
                  SizedBox(width: sMargin),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.spot.authorUsername,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: xxxsMargin),
                      Text(
                        widget.spot.authorFullName,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      'res/e44498e8-b866-4c51-9d9e-408121cf643c.png',
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: sMargin,
              bottom: sMargin,
              right: lMargin,
              child: Row(
                children: <Widget>[
                  SpotAvatar(
                    url: widget.spot.placeLogoUrl,
                    backgroundColor: Colors.white,
                  ),
                  SizedBox(width: sMargin),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.spot.placeName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: xxxsMargin),
                      Text(
                        '${widget.spot.categoryDisplayName} * ${widget.spot.placeLocationName}',
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isSaved = !isSaved;
                      });
                    },
                    icon:!isSaved ? Image.asset(
                      'res/12dfe158-8b96-4eca-accb-4a8da1c2ede4.png',
                      color: Colors.white,
                    ) :
                    Image.asset(
                      'res/9a67e456-448c-4aa7-ba76-694aec530955.png',
                      color: Colors.yellow,
                    )
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: mMargin),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: xxlMargin),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                onPressed: () {},
                icon: Image.asset(
                  'res/5cb4c3d8-30ca-4717-ba71-cd23fe6acb8f.png',
                  color: Colors.black,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Image.asset(
                  'res/4d93f7fd-a2d5-4096-9c85-0809e4e3e51f.png',
                  color: Colors.black,
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    isLiked = !isLiked;
                  });
                },
                icon: !isLiked
                    ? Image.asset(
                        'res/b863aa78-449c-4e72-8171-04c552f227ca.png',
                        color: Colors.black,
                      )
                    : Image.asset(
                        'res/12b4dfac-099a-4cb9-9588-7d8825270f34.png',
                        color: Colors.red,
                      ),
              ),
              IconButton(
                onPressed: () {},
                icon: Image.asset(
                  'res/a2ebf787-575e-4a78-801e-33d151a53371.png',
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: mMargin),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: sMargin),
          child: Align(
            alignment: AlignmentDirectional.topStart,
            child: Text(
              widget.spot.authorUsername,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SizedBox(
          height: xxsMargin,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: sMargin),
          child: ReadMoreText(
            widget.spot.description,
            trimMode: TrimMode.Line,
            trimLines: 3,
            trimCollapsedText: 'more...',
            trimExpandedText: 'less...',
            moreStyle: const TextStyle(
              color: Colors.black38,
            ),
            lessStyle: const TextStyle(
              color: Colors.black38,
            ),
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(height: xsMargin),
        if (widget.spot.tags_.isNotEmpty) ...[
          Padding(
            padding: EdgeInsets.only(left: sMargin),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: widget.spot.tags_
                    .map(
                      (tag) => Padding(
                        padding: EdgeInsets.only(right: xxsMargin),
                        child: Chip(
                          label: Text(tag.name),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ],
        SizedBox(height: sMargin),
        Padding(
          padding: EdgeInsets.fromLTRB(sMargin, 0, sMargin, lMargin),
          child: Align(
            alignment: AlignmentDirectional.topStart,
            child: Text(
              timeago.format(displayDate),
            ),
          ),
        ),
      ],
    );
  }
}

class SpotAvatar extends StatelessWidget {
  const SpotAvatar({
    Key? key,
    this.url,
    required this.backgroundColor,
  }) : super(key: key);

  final String? url;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 28,
      backgroundColor: backgroundColor,
      child: url != null
          ? ClipOval(
              child: Image.network(
                url!,
                height: 49,
                width: 49,
              ),
            )
          : ClipOval(
              child: Container(
                color: Colors.black,
                height: 49,
                width: 49,
              ),
            ),
    );
  }
}
