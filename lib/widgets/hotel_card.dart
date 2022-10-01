import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/models/hotel_model.dart';

class HotelCard extends StatefulWidget {
  const HotelCard({super.key});

  @override
  State<HotelCard> createState() => _HotelCardState();
}

class _HotelCardState extends State<HotelCard> {
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    responsiveDesign() {
      if (width > 600) {
        return _buildHotelCardDesktop();
      } else {
        return _buildHotelCardMobile();
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text(
                'Exclusive Hotels',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
              GestureDetector(
                onTap: (() {}),
                child: const Center(
                  child: Text(
                    'See All',
                    style: TextStyle(
                      color: Color(0xFF3EBACE),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        responsiveDesign(),
      ],
    );
  }

  _buildHotelCardMobile() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 260,
          child: Scrollbar(
            controller: _scrollController,
            child: SizedBox(
              height: 150,
              child: ListView.separated(
                controller: _scrollController,
                itemBuilder: (BuildContext context, int index) {
                  Hotel hotel = hotels[index];
                  return Stack(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                          bottom: 10,
                        ),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0, 2),
                              blurRadius: 6,
                            ),
                          ],
                        ),
                        child: Stack(
                          children: [
                            Hero(
                              tag: hotel.imageUrl,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image(
                                  image: AssetImage(hotel.imageUrl),
                                  height: 250,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Material(
                              elevation: 0,
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(30),
                              child: InkWell(
                                splashColor:
                                    const Color(0xFF3EBACE).withAlpha(100),
                                borderRadius: BorderRadius.circular(30),
                                onTap: () {},
                                child: Container(
                                  height: 250,
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(5.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    gradient: const LinearGradient(
                                      begin: Alignment.bottomLeft,
                                      end: Alignment.topCenter,
                                      colors: <Color>[
                                        Colors.black87,
                                        Colors.black26,
                                        Colors.transparent,
                                      ],
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 10,
                                        ),
                                        child: Text(
                                          hotel.name,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 24,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 1.2,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          bottom: 10,
                                          left: 10,
                                        ),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            const Icon(
                                              FontAwesomeIcons.locationDot,
                                              size: 14,
                                              color: Colors.white,
                                            ),
                                            Text(
                                              hotel.address,
                                              style: const TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            const Icon(
                                              FontAwesomeIcons.dollarSign,
                                              size: 14,
                                              color: Colors.white,
                                            ),
                                            Text(
                                              '${hotel.price.toString()} / Hour',
                                              style: const TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
                itemCount: hotels.length,
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(width: 10);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  _buildHotelCardDesktop() {
    return SizedBox(
      height: 250,
      child: Scrollbar(
        controller: _scrollController,
        child: Container(
          height: 150,
          padding: const EdgeInsets.only(bottom: 16),
          child: ListView.separated(
            controller: _scrollController,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            scrollDirection: Axis.horizontal,
            itemCount: hotels.length,
            itemBuilder: (BuildContext context, int index) {
              Hotel hotel = hotels[index];
              return Stack(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(
                      bottom: 10,
                    ),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 2),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        Hero(
                          tag: hotel.imageUrl,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Image(
                              image: AssetImage(hotel.imageUrl),
                              height: 250,
                              width: 360,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Material(
                          elevation: 0,
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(30),
                          child: InkWell(
                            splashColor: const Color(0xFF3EBACE).withAlpha(100),
                            borderRadius: BorderRadius.circular(30),
                            onTap: () {},
                            child: Container(
                              height: 250,
                              width: 360,
                              padding: const EdgeInsets.all(5.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                gradient: const LinearGradient(
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topCenter,
                                  colors: <Color>[
                                    Colors.black87,
                                    Colors.black26,
                                    Colors.transparent,
                                  ],
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 10,
                                    ),
                                    child: Text(
                                      hotel.name,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1.2,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      bottom: 10,
                                      left: 10,
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        const Icon(
                                          FontAwesomeIcons.locationDot,
                                          size: 14,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          hotel.address,
                                          style: const TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        const Icon(
                                          FontAwesomeIcons.dollarSign,
                                          size: 14,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          '${hotel.price.toString()} / Hour',
                                          style: const TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                width: 10,
              );
            },
          ),
        ),
      ),
    );
  }
}
