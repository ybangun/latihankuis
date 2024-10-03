import 'package:flutter/material.dart';
import 'vehicle-data.dart'; // Impor file data

class HomePage extends StatelessWidget {
  final String username;

  HomePage({required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page - Welcome $username'),
      ),
      body: VehicleList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => LoginPage()),
          );
        },
        child: Icon(Icons.logout),
      ),
    );
  }
}

class VehicleList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: vehicleList.length,
      itemBuilder: (context, index) {
        final vehicle = vehicleList[index];
        return ListTile(
          contentPadding: EdgeInsets.all(8.0),
          leading: Image.network(vehicle.imageUrls[0], width: 100, height: 100, fit: BoxFit.cover),
          title: Text(vehicle.name),
          subtitle: Text(vehicle.type),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => VehicleDetail(vehicle: vehicle),
              ),
            );
          },
        );
      },
    );
  }
}

class VehicleDetail extends StatelessWidget {
  final Vehicle vehicle;

  VehicleDetail({required this.vehicle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(vehicle.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(vehicle.imageUrls[0]),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                vehicle.description,
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Engine: ${vehicle.engine}',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Fuel Type: ${vehicle.fuelType}',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Price: ${vehicle.price}',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
