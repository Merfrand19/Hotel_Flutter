import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const d_green = Color(0x2fff54d0c2);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Hotels Booking",
        home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(),
        body: SingleChildScrollView(
          child: Column(children: [SearchSection(), HotelSection()]),
        ));
  }
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  Size get preferredSize => new Size.fromHeight(50);
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.grey[800],
          size: 20,
        ),
        onPressed: null,
      ),
      title: Text("Explore",
          style: GoogleFonts.nunito(
              color: Colors.black, fontSize: 22, fontWeight: FontWeight.w800)),
      backgroundColor: Colors.white,
      actions: [
        IconButton(
          icon: Icon(
            Icons.favorite_outline_rounded,
            color: Colors.grey[800],
            size: 20,
          ),
          onPressed: null,
        ),
        IconButton(
          icon: Icon(
            Icons.place,
            color: Colors.grey[800],
            size: 20,
          ),
          onPressed: null,
        ),
      ],
      centerTitle: true,
    );
  }
}

class SearchSection extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      padding: EdgeInsets.fromLTRB(10, 25, 10, 10),
      child: Column(children: [
        Row(
          children: [
            Expanded(
                child: Container(
              padding: EdgeInsets.only(left: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(0, 3), color: Colors.grey, blurRadius: 4)
                ],
              ),
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Londom',
                  contentPadding: EdgeInsets.all(10),
                  border: InputBorder.none,
                ),
              ),
            )),
            SizedBox(width: 10),
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(boxShadow: const [
                BoxShadow(
                    offset: Offset(0, 4), color: Colors.grey, blurRadius: 4)
              ], borderRadius: BorderRadius.all(Radius.circular(25))),
              child: ElevatedButton(
                onPressed: () {},
                child: Icon(
                  Icons.search,
                ),
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(10),
                  primary: d_green,
                ),
              ),
            )
          ],
        ),
        SizedBox(height: 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Choose date',
                      style:
                          GoogleFonts.nunito(color: Colors.grey, fontSize: 15),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '12 Dec - 22 Dec',
                      style:
                          GoogleFonts.nunito(color: Colors.black, fontSize: 17),
                    )
                  ]),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Number of Rooms',
                      style:
                          GoogleFonts.nunito(color: Colors.grey, fontSize: 15),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '1 Rooms - 2 Adults',
                      style:
                          GoogleFonts.nunito(color: Colors.black, fontSize: 15),
                    )
                  ]),
            )
          ],
        )
      ]),
    );
  }
}

class HotelSection extends StatelessWidget {
  final List hotelList = [
    {
      'title': "Grand Royl Hotel",
      'place': "Wembley, London",
      'distance': 2,
      'review': 36,
      'picture': 'images/hotel_1.jpg',
      'price': 100
    },
    {
      'title': "Queen Hotel",
      'place': "Wembley, London",
      'distance': 3,
      'review': 36,
      'picture': 'images/hotel_2.jpg',
      'price': 300
    },
    {
      'title': "Phoenix Hotel",
      'place': "Ibiza",
      'distance': 2,
      'review': 52,
      'picture': 'images/hotel_4.jpg',
      'price': 250
    },
    {
      'title': "Hiltton",
      'place': "Ajax, Amsterdam",
      'distance': 8,
      'review': 110,
      'picture': 'images/hotel_6.jpg',
      'price': '100'
    },
  ];
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.white,
      child: Column(children: [
        Container(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              '550 hotels found',
              style: GoogleFonts.nunito(color: Colors.grey, fontSize: 15),
            ),
            Row(
              children: [
                Text(
                  'Number of Rooms',
                  style: GoogleFonts.nunito(color: Colors.grey, fontSize: 15),
                ),
                IconButton(
                  icon: Icon(
                    Icons.filter_list_outlined,
                    color: Colors.grey[800],
                    size: 20,
                  ),
                  onPressed: null,
                ),
              ],
            )
          ]),
        ),
        Column(
          children: hotelList.map((hotel) {
            return HotelCard(hotel);
          }).toList(),
        )
      ]),
    );
  }
}

class HotelCard extends StatelessWidget {
  final Map hotelData;
  HotelCard(this.hotelData);
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 230,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(18)),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade200,
                spreadRadius: 4,
                blurRadius: 6,
                offset: Offset(0, 3))
          ]),
      child: Column(children: [
        Container(
          height: 140,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18), topRight: Radius.circular(18)),
              image: DecorationImage(
                  image: AssetImage(hotelData['picture']), fit: BoxFit.cover)),
          child: Stack(children: [
            Positioned(
                top: 5,
                right: -15,
                child: MaterialButton(
                    onPressed: () {},
                    child: Icon(Icons.favorite_outline_rounded,
                        color: d_green, size: 20),
                    color: Colors.white,
                    shape: CircleBorder()))
          ]),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                hotelData['title'],
                style: GoogleFonts.nunito(
                    fontWeight: FontWeight.w800, fontSize: 18),
              ),
              Text("€" + hotelData['price'].toString(),
                  style: GoogleFonts.nunito(
                      fontWeight: FontWeight.w800, fontSize: 18)),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              hotelData['place'],
              style: GoogleFonts.nunito(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Colors.grey),
            ),
            Row(
              children: [
                Icon(
                  Icons.place,
                  color: d_green,
                  size: 14,
                ),
                Text(hotelData['distance'].toString() + ' km to city',
                    style: GoogleFonts.nunito(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Colors.grey[500]))
              ],
            ),
            Text('per night',
                style: GoogleFonts.nunito(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Colors.grey.shade800))
          ]),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(10, 3, 10, 0),
          child: Row(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.star_rate,
                    color: d_green,
                    size: 14,
                  ),
                  Icon(
                    Icons.star_rate,
                    color: d_green,
                    size: 14,
                  ),
                  Icon(
                    Icons.star_rate,
                    color: d_green,
                    size: 14,
                  ),
                  Icon(
                    Icons.star_rate,
                    color: d_green,
                    size: 14,
                  ),
                  Icon(
                    Icons.star_rate,
                    color: d_green,
                    size: 14,
                  )
                ],
              ),
              SizedBox(width: 20),
              Text(hotelData['review'].toString() + ' reviews'),
            ],
          ),
        )
      ]),
    );
  }
}
