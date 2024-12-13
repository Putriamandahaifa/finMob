import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:wisata_mobile_5/materimodulscreens/utama.dart';
import 'package:wisata_mobile_5/models/destination_model.dart';

class Detail extends StatefulWidget {
  final TravelDestination destination;
  const Detail({super.key, required this.destination});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  PageController pageController = PageController();
  int pageView = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.white,
       automaticallyImplyLeading: false, 
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
           Padding(
  padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
  child: Container(
    height: 450,
    width: 335,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15.0),  // Border radius pada container
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.5),
          offset: Offset(0, 6),
          blurRadius: 4,
          spreadRadius: 4,
        )
      ],
    ),
    child: Stack( // Stack memastikan elemen berada di atas gambar
      children: [

        PageView(
          controller: pageController,
          onPageChanged: (value) {
            setState(() {
              pageView = value;
            });
          },
          children: List.generate(
            widget.destination.image!.length,
            (index) => ClipRRect( // Membungkus gambar dengan ClipRRect untuk border radius
              borderRadius: BorderRadius.circular(15.0), // Border radius pada gambar
              child: Image.asset(
                widget.destination.image![index],
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        // Semua elemen UI berada di atas gambar
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Spacer(),
            GestureDetector(
              child: Container(

                margin: const EdgeInsets.only(right: 10, bottom: 10),
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.white),
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: AssetImage(
                      widget.destination.image!.length - 1 != pageView
                          ? widget.destination.image![pageView + 1]
                          : widget.destination.image![0],
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          bottom: 10,
          left: 10,
          right: 10,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.0), // Border radius pada teks
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                height: 75,
                width: 224,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Nama wisata
                    Text(
                      widget.destination.name,
                      style: TextStyle(
                        height: 2,
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_pin,
                          color: const Color.fromARGB(255, 224, 223, 223),
                          size: 20.0,
                        ),
                        SizedBox(width: 4.0),
                        Text(
                          widget.destination.location,
                          style: TextStyle(
                            height: 1.5,
                            color: const Color.fromARGB(255, 224, 223, 223),
                            fontSize: 10.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        // Tombol Kembali
        Positioned(
          top: 10,
          left: 10,
          child: GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomePege(username: 'Kevin')),
              );
            },
            child: CircleAvatar(
              radius: 20.0,
              backgroundColor: Colors.black.withOpacity(0.3),
              child: Icon(
                Icons.arrow_back_ios_new_outlined,
                color: Colors.white,
              ),
            ),
          ),
        ),
        // Bookmark
       Positioned(
  top: 10,
  right: 10,
  child: GestureDetector(
    onTap: () {
      setState(() {
        widget.destination.isBookmarked = !widget.destination.isBookmarked; // Toggle status
      });
    },
    child: CircleAvatar(
      radius: 20.0,
      backgroundColor: Colors.black.withOpacity(0.3),
      child: Icon(
        widget.destination.isBookmarked
            ? Icons.bookmark  // Bookmark aktif
            : Icons.bookmark_outline_rounded, // Bookmark tidak aktif
        color: Colors.white,
      ),
    ),
  ),
),

      ],
    ),
  ),
),



            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),

              //TULISAN DESKIPSI

              child: Column(
                textDirection: TextDirection.ltr,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //overview
                  Row(
                    children: [
                      Text(
                        'Overview',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Text(
                        'Detail',
                        style: TextStyle(
                          color: const Color.fromARGB(255, 116, 115, 115),
                        ),
                      )
                    ],
                  ),

                  // DESKRIPSI WISATA

                  SizedBox(height: 30.0),
                  Text(
                    widget.destination.description,
                    style: TextStyle(
                      color: const Color.fromARGB(255, 116, 115, 115),
                    ),
                  ),

                  SizedBox(height: 30.0),
                  Text(
                    'Fasilitas',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.0),

                  //FASILITAS WISATA
                  Text(
                    widget.destination.fasility,
                    style: TextStyle(
                      color: const Color.fromARGB(255, 116, 115, 115),
                    ),
                  ),

                  SizedBox(height: 30.0),
                  Text(
                    'WAHANA',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.0),

                  //WAHANA WISATA
                  Text(
                    widget.destination.wahana,
                    style: TextStyle(
                      color: const Color.fromARGB(255, 116, 115, 115),
                    ),
                  ),

                  SizedBox(height: 30.0),
                  Text(
                    'Jam Operasional & Tiket',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.0),

                  //BIAYA TIKET TARIF WISATA JAM OPERASIONAL
                  Text(
                   widget.destination.jam_dan_tiket,
                    style: TextStyle(
                      color: const Color.fromARGB(255, 116, 115, 115),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Keindahan' + widget.destination.name,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 10.0),
                ],
              ),
            ),
            Padding(
  padding: const EdgeInsets.all(10.0),
  child: Container(
    height: 600, // Adjust height as needed
    child: GridView.builder(
      itemCount: widget.destination.image!.length, // Menyesuaikan dengan jumlah gambar yang ada di destinasi
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Jumlah kolom grid
        crossAxisSpacing: 10.0, // Spacing antar kolom
        mainAxisSpacing: 10.0, // Spacing antar baris
      ),
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), // Menambahkan border radius
            image: DecorationImage(
              image: AssetImage(widget.destination.image![index]), // Mengambil gambar berdasarkan index
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    ),
  ),
),
            SizedBox(height: 50.0),
          ],
        ),
      ),
    );
  }
}