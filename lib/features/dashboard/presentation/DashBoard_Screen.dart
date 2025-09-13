import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _pages = <Widget>[
    const HomeScreen(),
    const TicketsScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: FaIcon(Icons.home_outlined), label: "Home"),
          BottomNavigationBarItem(
            icon: FaIcon(Icons.train),
            label: "Tickets",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person_2_rounded), label: "Profile"),
        ],
      ),
    );
  }
}

/// ---------------- HOME SCREEN ----------------
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "🚉 Welcome to Pakistan Railways",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}

/// ---------------- PROFILE SCREEN ----------------
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "👤 Passenger Profile",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}

/// ---------------- TICKETS SCREEN WITH TABS ----------------
class TicketsScreen extends StatelessWidget {
  const TicketsScreen({super.key});

  Widget buildTicketCard({
    required String trainName,
    required String trainNo,
    required String from,
    required String to,
    required String date,
    required String seat,
    required String status,
    required Color statusColor,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Train Name + Train No
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "$trainName 🚆",
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Train #$trainNo",
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 8),
            // Route (From -> To)
            Row(
              children: [
                const Icon(Icons.location_on, color: Colors.green, size: 18),
                Text(from, style: const TextStyle(fontWeight: FontWeight.w500)),
                const SizedBox(width: 8),
                const Icon(Icons.arrow_forward, size: 18),
                const SizedBox(width: 8),
                const Icon(Icons.flag, color: Colors.red, size: 18),
                Text(to, style: const TextStyle(fontWeight: FontWeight.w500)),
              ],
            ),
            const SizedBox(height: 8),
            // Date & Seat
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("🗓 $date"),
                Text("💺 Seat: $seat"),
              ],
            ),
            const Divider(),
            // Status Badge
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  status,
                  style: TextStyle(color: statusColor, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          title: const Text("🎟 Pakistan Railway Tickets", style: TextStyle(color: Colors.black)),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(100),
            child: Column(
              children: [
                // 🔍 Search Bar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search by Train or PNR...",
                      prefixIcon: const Icon(Icons.search),
                      filled: true,
                      fillColor: Colors.grey[200],
                      contentPadding: const EdgeInsets.all(0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                // 🟣 ButtonsTabBar
                ButtonsTabBar(
                  backgroundColor: Colors.deepPurple,
                  unselectedBackgroundColor: Colors.grey[300],
                  unselectedLabelStyle: const TextStyle(color: Colors.black),
                  labelStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  radius: 24,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  tabs: const [
                    Tab(text: "My Bookings", icon: FaIcon(Icons.train)),
                    Tab(text: "Pending", icon: FaIcon(Icons.hourglass_empty)),
                    Tab(text: "Confirmed", icon: FaIcon(Icons.check_circle)),
                  ],
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            // 📑 My Bookings
            ListView(
              children: [
                buildTicketCard(
                  trainName: "Green Line Express",
                  trainNo: "005",
                  from: "Karachi",
                  to: "Islamabad",
                  date: "12 Sep 2025",
                  seat: "A1 - 23",
                  status: "Active",
                  statusColor: Colors.blue,
                ),
                buildTicketCard(
                  trainName: "Karakoram Express",
                  trainNo: "041",
                  from: "Lahore",
                  to: "Karachi",
                  date: "15 Sep 2025",
                  seat: "C2 - 56",
                  status: "Expired",
                  statusColor: Colors.red,
                ),
              ],
            ),
            // ⏳ Pending Approval
            ListView(
              children: [
                buildTicketCard(
                  trainName: "Jaffar Express",
                  trainNo: "039",
                  from: "Quetta",
                  to: "Peshawar",
                  date: "20 Sep 2025",
                  seat: "WL - 18",
                  status: "Pending",
                  statusColor: Colors.orange,
                ),
              ],
            ),
            // ✅ Confirmed Tickets
            ListView(
              children: [
                buildTicketCard(
                  trainName: "Tezgam Express",
                  trainNo: "007",
                  from: "Karachi",
                  to: "Rawalpindi",
                  date: "10 Sep 2025",
                  seat: "B4 - 42",
                  status: "Confirmed",
                  statusColor: Colors.green,
                ),
                buildTicketCard(
                  trainName: "Allama Iqbal Express",
                  trainNo: "009",
                  from: "Sialkot",
                  to: "Karachi",
                  date: "14 Sep 2025",
                  seat: "D1 - 77",
                  status: "Confirmed",
                  statusColor: Colors.green,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}



