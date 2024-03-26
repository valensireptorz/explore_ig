import 'dart:math';
import 'package:flutter/material.dart';

class ExploreScreen extends StatefulWidget {
  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  TextEditingController _searchController = TextEditingController();
  List<int> _imageIndices = List.generate(20, (index) => index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () {
                      _searchController.clear();
                      setState(() {
                        _imageIndices = List.generate(20, (index) => index);
                      });
                    },
                  ),
                  filled: true,
                  fillColor: Colors.green.withOpacity(0.3),
                ),
                onChanged: (value) {
                  setState(() {
                    _imageIndices = List.generate(
                      20,
                      (index) => index,
                    ).where((index) => index.toString().contains(value)).toList();
                  });
                },
              ),
            ),
            IconButton(
              icon: Icon(Icons.qr_code),
              onPressed: () {
                print('QR Code button pressed');
                // Implementasi logika untuk scan di sini
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ElevatedButton(
                  onPressed: () {
                    print('Shop button pressed');
                    // Implementasi logika untuk shop
                  },
                  child: Text(
                    'Shop',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                ),
                ElevatedButton(
                  onPressed: () {
                    print('Travel button pressed');
                    // Implementasi logika untuk travel
                  },
                  child: Text(
                    'Travel',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                ),
                ElevatedButton(
                  onPressed: () {
                    print('Arsitektur button pressed');
                    // Implementasi logika untuk arsitektur
                  },
                  child: Text(
                    'Arsitektur',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                ),
                ElevatedButton(
                  onPressed: () {
                    print('Decor button pressed');
                    // Implementasi logika untuk decor
                  },
                  child: Text(
                    'Decor',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                ),
                ElevatedButton(
                  onPressed: () {
                    print('Art button pressed');
                    // Implementasi logika untuk art
                  },
                  child: Text(
                    'Art',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: _imageIndices.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemBuilder: (BuildContext context, int index) {
                Random _random = Random();
                Color _color = Color.fromRGBO(
                  _random.nextInt(256),
                  _random.nextInt(256),
                  _random.nextInt(256),
                  1,
                );

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(imageIndex: _imageIndices[index]),
                      ),
                    );
                  },
                  child: Container(
                    color: _color,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Image.network(
                            'https://picsum.photos/200/300?random=${_random.nextInt(100)}',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        selectedIconTheme: IconThemeData(color: Colors.green), // Ubah warna ikon terpilih menjadi hijau
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final int imageIndex;

  const DetailScreen({Key? key, required this.imageIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Image'),
      ),
      body: Center(
        child: Text('Detail Image $imageIndex'),
      ),
    );
  }
}
