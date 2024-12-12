import 'package:flutter/material.dart';
import '../widgets/category_filter.dart';
import '../widgets/product_card.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Mengambil ukuran layar
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: LayoutBuilder(
          builder: (context, constraints) {
            bool isDesktop = constraints.maxWidth > 1024;
            bool isTablet =
                constraints.maxWidth > 600 && constraints.maxWidth <= 1024;

            return Column(
              children: [
                // Stack untuk background gambar dan search bar + ikon
                Stack(
                  children: [
                    // Gambar background sayuran
                    Container(
                      width: double.infinity,
                      height: screenHeight * 0.25,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/Background.png'),
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter,
                        ),
                      ),
                    ),

                    // Search Bar, Keranjang, dan Notifikasi di atas background
                    Positioned(
                      top: 20,
                      left: 16,
                      right: 16,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Search Bar
                          Container(
                            width: isDesktop
                                ? screenWidth * 0.4
                                : isTablet
                                    ? screenWidth * 0.6
                                    : screenWidth * 0.8,
                            child: TextField(
                              decoration: InputDecoration(
                                prefixIcon:
                                    Icon(Icons.search, color: Colors.grey),
                                hintText: 'Cari Sayuran',
                                filled: true,
                                fillColor: Colors.grey[200],
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                          // Ikon Keranjang dan Notifikasi
                          Row(
                            children: [
                              _buildNotificationIcon(),
                              _buildCartIcon(),
                            ],
                          ),
                        ],
                      ),
                    ),

                    // Teks di atas gambar (Selamat Datang)
                    Positioned(
                      top: screenHeight * 0.1,
                      left: 16,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Selamat Datang,',
                            style: TextStyle(
                              fontSize: isDesktop
                                  ? 24
                                  : isTablet
                                      ? 20
                                      : 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Riska Nopiyanti',
                            style: TextStyle(
                              fontSize: isDesktop
                                  ? 32
                                  : isTablet
                                      ? 28
                                      : 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 16),

                // Saldo Section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 0,
                          blurRadius: 8,
                          offset: Offset(0, 3),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: isDesktop || isTablet
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _buildSaldoCard(
                                  context,
                                  'ISI SALDO',
                                  'Rp. 500.000',
                                  Icons.account_balance_wallet,
                                  30),
                              VerticalDivider(
                                color: Colors.grey[300],
                                thickness: 2,
                              ),
                              _buildSaldoCard(context, 'SALDO KOIN', '60 Koin',
                                  Icons.monetization_on, 30),
                            ],
                          )
                        : Column(
                            children: [
                              _buildSaldoCard(
                                  context,
                                  'ISI SALDO',
                                  'Rp. 500.000',
                                  Icons.account_balance_wallet,
                                  30),
                              Divider(
                                color: Colors.grey[300],
                                thickness: 2,
                              ),
                              _buildSaldoCard(context, 'SALDO KOIN', '60 Koin',
                                  Icons.monetization_on, 30),
                            ],
                          ),
                  ),
                ),

                SizedBox(height: 16),

                // Filter Categories
                CategoryFilter(),

                // Produk Terlaris
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'Terlaris Hari Ini',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 8),
                SizedBox(
                  height: 180,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      ProductCard(
                          name: 'Bawang Merah',
                          price: 'Rp. 38.000/kg',
                          image: 'assets/Bawang.png'),
                      ProductCard(
                          name: 'Tomat Merah',
                          price: 'Rp. 20.000/kg',
                          image: 'assets/Tomat.png'),
                      ProductCard(
                          name: 'Broccoli',
                          price: 'Rp. 25.500/kg',
                          image: 'assets/Brokoli.jpg'),
                    ],
                  ),
                ),

                // Promo Section dengan gambar
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Image.asset(
                    'assets/promo.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.symmetric(horizontal: 6),
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.green.shade800,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Image.asset('assets/Home.png', width: 24, height: 24),
              ),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/Ticket.png', width: 24, height: 24),
            label: 'Ticket',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/Message.png', width: 24, height: 24),
            label: 'Message',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/Profile.png', width: 24, height: 24),
            label: 'Profile',
          ),
        ],
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
      ),
    );
  }

  Widget _buildSaldoCard(BuildContext context, String title, String value,
      IconData icon, double iconSize) {
    return Container(
      width: MediaQuery.of(context).size.width *
          (MediaQuery.of(context).size.width > 600 ? 0.4 : 0.8),
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.green, size: iconSize),
              SizedBox(width: 8),
              Text(title,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(height: 4),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(value,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationIcon() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        IconButton(
          icon: Icon(Icons.notifications, color: Colors.white, size: 30),
          onPressed: () {
            // Aksi saat ikon notifikasi diklik
          },
        ),
        Positioned(
          top: -5,
          right: -5,
          child: Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
            child: Text(
              '3',
              style: TextStyle(fontSize: 12, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCartIcon() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        IconButton(
          icon: Image.asset(
            'assets/keranjang.png',
            width: 30,
            height: 30,
          ),
          onPressed: () {
            // Aksi saat ikon keranjang diklik
          },
        ),
        Positioned(
          top: -5,
          right: -5,
          child: Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
            child: Text(
              '5',
              style: TextStyle(fontSize: 12, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
