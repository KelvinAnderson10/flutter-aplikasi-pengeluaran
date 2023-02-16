import 'package:course_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print(size);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading:  IconButton(
          icon: const Icon(Icons.menu),
          onPressed: (){},
        ),
        title: const Text("Overview", style: TextStyle(fontWeight: FontWeight.w600),),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.more_vert),
            tooltip: 'Opsi lainnya',
            onPressed: () {
              // handle the press
            },
          )
        ],
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: size.height * 0.25,
            child: Stack(
              children: [
                Container(
                  height: size.height * 0.25 - size.height * 0.07 ,
                  decoration: const BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(36),
                      bottomRight: Radius.circular(36)
                    )
                    ),
                ),
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.018, left: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text("Selamat Datang,", style: GoogleFonts.rubik(textStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: size.height * 0.022))),
                    const SizedBox(height: 6),
                    Text("Kelvin Anderson", style: GoogleFonts.rubik(textStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: size.height * 0.028))),
                  ],),
                  
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    alignment: Alignment.center,
                    height: size.height * 0.14,
                    margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 5),
                          blurRadius: 5,
                          color: kPrimaryColor.withOpacity(0.3)
                        )
                      ]
                    ),
                    child: Row(

                      ),
                    ),
                  )
              ],
            ),
          )
        ],
      ),

    );
  }
}