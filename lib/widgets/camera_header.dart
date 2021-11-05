import 'package:flutter/material.dart';

class CameraHeader extends StatelessWidget {
  CameraHeader(this.title, {this.onBackPressed});
  final String title;
  final void Function() onBackPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row( //Row
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // const SizedBox(
          //   height: 100.0,
          //   width: 100.0,
          // ),
          //
          // Align(
          //   alignment: Alignment.topLeft,
          //   child: Ink(
          //       child: IconButton(
          //         constraints: const BoxConstraints(maxHeight: 70),
          //         icon: const Icon(Icons.arrow_back_ios_rounded),
          //         color: Colors.white,
          //         iconSize: 20.0,
          //         onPressed: () {
          //           Navigator.pushNamed(context, '/contactBook');
          //         },
          //       ),
          //       decoration: const ShapeDecoration(
          //         color: Color.fromARGB(255, 34, 34, 59),
          //         shape: CircleBorder(),
          //
          //       )),
          //
          // ),
          //
          //
          // Ink(
          //     child: IconButton(
          //       constraints: const BoxConstraints(maxHeight: 70),
          //       icon: const Icon(Icons.arrow_back_ios_rounded),
          //       color: Colors.white,
          //       iconSize: 20.0,
          //       onPressed: () {
          //         Navigator.pushNamed(context, '/home');
          //       },
          //     ),
          //     decoration: const ShapeDecoration(
          //       color: Color.fromARGB(255, 34, 34, 59),
          //       shape: CircleBorder(),
          //
          //     )),

          InkWell(
            onTap: onBackPressed,
            child: Container(
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 34, 34, 59),
                borderRadius: BorderRadius.circular(10),
              ),
              height: 50,
              width: 50,
              child: Center(child: Icon(Icons.arrow_back_ios_rounded)),
            ),
          ),

          Text(
            title,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            width: 90,
          )
        ],
      ),
      height: 150,
       decoration: BoxDecoration(
         gradient: LinearGradient(
           begin: Alignment.topCenter,
           end: Alignment.bottomCenter,
           colors: <Color>[Colors.black, Colors.transparent],
         ),
       ),
    );
  }
}
