import 'package:flutter/material.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  _OnboardingViewState createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // Define color constants
  static const Color _primaryColor = Color(0xFF304EE2);
  static const Color _whiteColor = Colors.white;
  static const Color _subtitleColor = Colors.white70;

  final List<OnboardingPageData> _pages = [
    OnboardingPageData(
      imagePath: 'assets/img/logo.png', // Updated path convention
      title: 'Welcome to SneakBid',
      description: 'Your ultimate destination for exclusive sneaker auctions',
    ),
    OnboardingPageData(
      imagePath: 'assets/img/browse.webp', // Updated path convention
      title: 'Browse Exclusive Sneakers',
      description: 'Explore a curated collection of rare and limited edition sneakers',
    ),
    OnboardingPageData(
      imagePath: 'assets/img/bid.webp', // Updated path convention
      title: 'Bid and Win',
      description: 'Place your bids and win the sneakers you\'ve always wanted',
    ),
  ];

  void _navigateToNextPage() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // Navigate to login screen
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  void _navigateToPreviousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _pages.length,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                itemBuilder: (context, index) {
                  return _buildOnboardingPage(_pages[index]);
                },
              ),
            ),
            _buildPageIndicator(),
            _buildNavigationButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildOnboardingPage(OnboardingPageData page) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            page.imagePath,
            height: 200,
            width: 200,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: 200,
                width: 200,
                color: Colors.grey[300],
                child: const Icon(
                  Icons.image_not_supported,
                  size: 100,
                  color: _whiteColor,
                ),
              );
            },
          ),
          const SizedBox(height: 30),
          Text(
            page.title,
            style: TextStyle(
              color: _whiteColor,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Text(
            page.description,
            style: TextStyle(
              fontSize: 16,
              color: _subtitleColor,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        _pages.length,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.symmetric(horizontal: 5),
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentPage == index ? _whiteColor : _whiteColor.withOpacity(0.4),
          ),
        ),
      ),
    );
  }

  Widget _buildNavigationButtons() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Back button (except on first page)
          if (_currentPage > 0)
            TextButton(
              onPressed: _navigateToPreviousPage,
              style: TextButton.styleFrom(
                foregroundColor: _whiteColor,
              ),
              child: const Text('Back'),
            )
          else
            const SizedBox(),

          // Next/Get Started button
          ElevatedButton(
            onPressed: _navigateToNextPage,
            style: ElevatedButton.styleFrom(
              backgroundColor: _whiteColor,
              foregroundColor: _primaryColor,
              padding: _currentPage == _pages.length - 1
                  ? const EdgeInsets.symmetric(horizontal: 50, vertical: 15)
                  : null,
            ),
            child: Text(
              _currentPage < _pages.length - 1 ? 'Next' : 'Get Started',
              style: TextStyle(
                fontSize: _currentPage == _pages.length - 1 ? 18 : 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

class OnboardingPageData {
  final String imagePath;
  final String title;
  final String description;

  const OnboardingPageData({
    required this.imagePath,
    required this.title,
    required this.description,
  });
}