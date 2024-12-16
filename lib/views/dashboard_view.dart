import 'package:flutter/material.dart';

// Sneaker Model
class Sneaker {
  final String id;
  final String name;
  final String brand;
  final String description;
  final double currentBid;
  final double startingBid;
  final String imageUrl;
  final DateTime endTime;
  final List<String> sizes;

  Sneaker({
    required this.id,
    required this.name,
    required this.brand,
    required this.description,
    required this.currentBid,
    required this.startingBid,
    required this.imageUrl,
    required this.endTime,
    required this.sizes,
  });
}

class DashboardView extends StatefulWidget {
  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  int _currentIndex = 0;

  // Sample sneaker data
  final List<Sneaker> featuredSneakers = [
    Sneaker(
      id: '001',
      name: 'Air Jordan 1 Retro High',
      brand: 'Nike',
      description: 'Iconic Bred Toe colorway',
      currentBid: 450.00,
      startingBid: 350.00,
      imageUrl: 'assets/sneakers/jordan1.jpeg',
      endTime: DateTime.now().add(Duration(days: 3, hours: 12)),
      sizes: ['8', '9', '10', '11', '12'],
    ),
    Sneaker(
      id: '002',
      name: 'Yeezy Boost 350 V2',
      brand: 'Adidas',
      description: 'Zebra edition',
      currentBid: 320.50,
      startingBid: 250.00,
      imageUrl: 'assets/sneakers/yezzy350.jpeg',
      endTime: DateTime.now().add(Duration(days: 5, hours: 6)),
      sizes: ['7', '8', '9', '10', '11'],
    ),
    Sneaker(
      id: '003',
      name: 'Puma RS-X Reinvention',
      brand: 'Puma',
      description: 'Innovative street style',
      currentBid: 210.00,
      startingBid: 180.00,
      imageUrl: 'assets/sneakers/puma-rs.jpeg',
      endTime: DateTime.now().add(Duration(days: 2, hours: 18)),
      sizes: ['8', '9', '10'],
    ),
  ];

  // Tabs for bottom navigation
  final List<Widget> _tabs = [
    HomeTab(),
    BidsTab(),
    ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.gavel),
            label: 'My Bids',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SneakBid'),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // TODO: Implement notifications
            },
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          // Search Bar
          SliverAppBar(
            floating: true,
            snap: true,
            backgroundColor: Colors.white,
            title: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search sneakers...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ),

          // Categories Section
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildCategoryChip('Nike'),
                    SizedBox(width: 10),
                    _buildCategoryChip('Adidas'),
                    SizedBox(width: 10),
                    _buildCategoryChip('Puma'),
                    SizedBox(width: 10),
                    _buildCategoryChip('New Balance'),
                  ],
                ),
              ),
            ),
          ),

          // Featured Sneakers Title
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Featured Sneakers',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // TODO: View all featured sneakers
                    },
                    child: Text('View All'),
                  ),
                ],
              ),
            ),
          ),

          // Featured Sneakers Horizontal List
          SliverToBoxAdapter(
            child: SizedBox(
              height: 300,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  final sneaker = (_DashboardViewState().featuredSneakers)[index];
                  return _buildFeaturedSneakerCard(sneaker);
                },
              ),
            ),
          ),

          // Live Auctions Title
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Live Auctions',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // Live Auctions List
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final sneaker = (_DashboardViewState().featuredSneakers)[index];
                return _buildLiveAuctionTile(sneaker);
              },
              childCount: 3,
            ),
          ),
        ],
      ),
    );
  }

  // Category Chip Widget
  Widget _buildCategoryChip(String label) {
    return ChoiceChip(
      label: Text(label),
      selected: false,
      onSelected: (bool selected) {
        // TODO: Implement category filtering
      },
    );
  }

  // Featured Sneaker Card Widget
  Widget _buildFeaturedSneakerCard(Sneaker sneaker) {
    return Container(
      width: 250,
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.asset(
              sneaker.imageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  sneaker.name,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  sneaker.brand,
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Current Bid: \$${sneaker.currentBid.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // TODO: Open bid details
                      },
                      child: Text('Bid Now'),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Live Auction Tile Widget
  Widget _buildLiveAuctionTile(Sneaker sneaker) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          sneaker.imageUrl,
          width: 80,
          height: 80,
          fit: BoxFit.cover,
        ),
      ),
      title: Text(
        sneaker.name,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        'Ending in ${_formatRemainingTime(sneaker.endTime)}',
        style: TextStyle(color: Colors.red),
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '\$${sneaker.currentBid.toStringAsFixed(2)}',
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '${sneaker.sizes.join(", ")} US',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  // Time Formatting Helper
  String _formatRemainingTime(DateTime endTime) {
    final duration = endTime.difference(DateTime.now());
    final days = duration.inDays;
    final hours = duration.inHours % 24;
    final minutes = duration.inMinutes % 60;

    if (days > 0) {
      return '$days d $hours h';
    } else if (hours > 0) {
      return '$hours h $minutes m';
    } else {
      return '$minutes m';
    }
  }
}

// Placeholder Tabs
class BidsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Bids'),
      ),
      body: Center(
        child: Text('Your Active and Past Bids'),
      ),
    );
  }
}

class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Text('User Profile Information'),
      ),
    );
  }
}