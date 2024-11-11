import 'package:flutter/material.dart';
import 'bike_detail_screen.dart';

enum ViewType { list, grid, scroll }

class BikeSelectionScreen extends StatefulWidget {
  @override
  _BikeSelectionScreenState createState() => _BikeSelectionScreenState();
}

class _BikeSelectionScreenState extends State<BikeSelectionScreen> {
  final List<Map<String, dynamic>> bikes = [
    {'name': 'Super Bike', 'image': 'assets/super bike.webp', 'price': 150},
    {'name': 'Dirt Bike', 'image': 'assets/dirt bike.jpg', 'price': 100},
    {'name': 'Cycle', 'image': 'assets/cycle.webp', 'price': 20},
    {'name': 'Road Bike', 'image': 'assets/honda 125.png', 'price': 80},
  ];

  ViewType _currentViewType = ViewType.list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Select Your Bike',
          style: TextStyle(color: Colors.black87),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black54),
        actions: [
          IconButton(
            icon: Icon(Icons.view_list),
            onPressed: () => setState(() => _currentViewType = ViewType.list),
            color: _currentViewType == ViewType.list ? Colors.blue : Colors.grey,
          ),
          IconButton(
            icon: Icon(Icons.grid_view),
            onPressed: () => setState(() => _currentViewType = ViewType.grid),
            color: _currentViewType == ViewType.grid ? Colors.blue : Colors.grey,
          ),
          IconButton(
            icon: Icon(Icons.view_day),
            onPressed: () => setState(() => _currentViewType = ViewType.scroll),
            color: _currentViewType == ViewType.scroll ? Colors.blue : Colors.grey,
          ),
        ],
      ),
      body: _buildView(),
    );
  }

  Widget _buildView() {
    switch (_currentViewType) {
      case ViewType.grid:
        return GridView.builder(
          padding: EdgeInsets.all(16.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: bikes.length,
          itemBuilder: (context, index) => _buildBikeCard(bikes[index]),
        );
      case ViewType.scroll:
        return SingleChildScrollView(
          child: Column(
            children: bikes.map((bike) => _buildBikeCard(bike)).toList(),
          ),
        );
      case ViewType.list:
      default:
        return ListView.builder(
          padding: EdgeInsets.all(16.0),
          itemCount: bikes.length,
          itemBuilder: (context, index) => _buildBikeListTile(bikes[index]),
        );
    }
  }

  Widget _buildBikeListTile(Map<String, dynamic> bike) {
    return ListTile(
      leading: Image.asset(
        bike['image'],
        width: 50,
        height: 50,
      ),
      title: Text(bike['name'], style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      onTap: () => _navigateToDetail(bike),
      trailing: Text("\$${bike['price']}/day", style: TextStyle(color: Colors.blue)),
    );
  }

  Widget _buildBikeCard(Map<String, dynamic> bike) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
      elevation: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            bike['image'],
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(bike['name'], style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text("\$${bike['price']}/day", style: TextStyle(color: Colors.blue)),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () => _navigateToDetail(bike),
                child: Text('View Details', style: TextStyle(color: Colors.blue)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _navigateToDetail(Map<String, dynamic> bike) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => BikeDetailScreen(
          bikeType: bike['name'],
          price: bike['price'],
          image: bike['image'],
        ),
      ),
    );
  }
}
