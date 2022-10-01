import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/widgets/destination_card.dart';
import 'package:travel_app/widgets/hotel_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  int _currentTab = 0;
  final List<IconData> _icons = const [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.car,
    FontAwesomeIcons.bus,
    FontAwesomeIcons.train,
    FontAwesomeIcons.motorcycle,
  ];

  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Padding(
                padding:
                    EdgeInsets.only(left: 20, right: 120, top: 30, bottom: 20),
                child: Text(
                  'What you would like to Find?',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildIcon(),
                ],
              ),
              const SizedBox(height: 20),
              const DestinationCard(),
              const SizedBox(height: 20),
              const HotelCard(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedIconTheme: const IconThemeData(color: Colors.black12),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.search,
                size: 24,
              ),
              label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.home,
                size: 24,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.solidCircleUser,
              size: 24,
            ),
            label: 'Profile',
          )
        ],
        currentIndex: _currentTab,
        onTap: (int index) => setState(() {
          _currentTab = index;
        }),
      ),
    );
  }

  Widget _buildIcon() {
    return SizedBox(
      height: 86,
      width: double.infinity,
      child: Scrollbar(
        controller: _scrollController,
        child: Container(
          height: 150,
          padding: const EdgeInsets.only(bottom: 16),
          child: ListView.separated(
            controller: _scrollController,
            padding: const EdgeInsets.only(left: 20, right: 20),
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              IconData icon = _icons[index];
              return Material(
                borderRadius: BorderRadius.circular(100),
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    color: (_selectedIndex == index)
                        ? Theme.of(context).colorScheme.secondary
                        : const Color(0xFFE7EBEE),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Material(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(100),
                      onTap: () {
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                      child: Icon(
                        icon,
                        size: 25,
                        color: (_selectedIndex == index)
                            ? Theme.of(context).colorScheme.primary
                            : const Color(0xFFB4C1C4),
                      ),
                    ),
                  ),
                ),
              );
            },
            itemCount: _icons.length,
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(width: 20);
            },
          ),
        ),
      ),
    );
  }
}
