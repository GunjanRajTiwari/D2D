import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:tcard/tcard.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _value = 1;
  List<Widget> cards = List.generate(
    10,
    (index) => Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Color(0xffd9dfe4),
          width: 3,
        ),
        color: Color(0xffecf0f4),
      ),
      child: Center(
        child: Column(
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          "https://images.unsplash.com/photo-1500048993953-d23a436266cf?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1049&q=80"),
                      height: 180,
                      width: 364,
                    ),
                  ),
                ),
                TranslucentCover(),
                Padding(
                  padding: const EdgeInsets.only(left: 16, top: 120),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hayat Tamboli",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xfff9fcfd),
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        "Visual design, UI developer",
                        style: TextStyle(
                          color: Color(0xffecf0f4),
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RatingBar.builder(
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 30,
                    itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Color(0xff66D9AB),
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                ),
                Text("3 out of 5"),
              ],
            ),
          ],
        ),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              TopQuestion(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Color(0xff8b8ba1),
                      width: 1,
                    ),
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 16),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      elevation: 2,
                      icon: Icon(Feather.chevron_down),
                      value: _value,
                      items: [
                        DropdownMenuItem(child: Text("Developer"), value: 1),
                        DropdownMenuItem(child: Text("Designer"), value: 2),
                      ],
                      onChanged: (int value) {
                        setState(() {
                          _value = value;
                        });
                      },
                      isExpanded: true,
                    ),
                  ),
                ),
              ),
              // tinder card here
              TCard(
                cards: cards,
                size: Size(380, 500),
                //TODO: navigate to chat
                onForward: (index, si) {
                  print(si);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TranslucentCover extends StatelessWidget {
  const TranslucentCover({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        width: 364,
        height: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0x000f0f0f),
              Color(0x0c0f0f0f),
              Color(0x63101010),
              Color(0xff101010)
            ],
          ),
        ),
      ),
    );
  }
}

class TopQuestion extends StatelessWidget {
  const TopQuestion({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Who do you want to match up with?",
      style: TextStyle(
        color: Colors.black,
        fontSize: 38,
        fontFamily: "Proxima Nova",
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
