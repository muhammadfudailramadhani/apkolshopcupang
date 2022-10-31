// //   // Widget _rekomendasiBuilder(Rekomendasi data, width) {
// //   //   return Padding(
// //   //     padding: EdgeInsets.only(top: 20, bottom: 0, left: 0, right: 0),
// //   //     child: Container(
// //   //       height: width / 1.4,
// //   //       width: MediaQuery.of(context).size.width,
// //   //       child: ListView(
// //   //         shrinkWrap: true,
// //   //         scrollDirection: Axis.horizontal,
// //   //         children: data.data.asMap().entries.map(
// //   //             (data) //untuk mengambil data dari data.value yang ada di RekomendasiModel dan menampilkan datanya dalam bentuk listview dengan menggunakan map dan entries
// //   //             {
// //   //           return CardRow(
// //   //             data: data
// //   //                 .value, //data diambil dari data.value yang ada di RekomendasiModel dan menampilkan data dari data.value yang ada di RekomendasiModel yang ada di api_service.dart Rekomendasi dan mengirimkan ke model RekomendasiModel
// //   //             i: data
// //   //                 .key, //data diambil dari data.key yang ada di RekomendasiModel untuk mengambil index dari data yang ada di RekomendasiModel dan mengirimkan ke CardRow
// //   //           );
// //   //         }).toList(),
// //   //       ),
// //   //     ),
// //   //   );
// //   // }


// //   child: ElevatedButton(
// //             style: ElevatedButton.styleFrom(
// //                 primary: Color.fromARGB(187, 206, 119, 26),
// //                 shape: RoundedRectangleBorder(
// //                     borderRadius: BorderRadius.circular(40))),
// //             onPressed: () {
// //               Navigator.of(context).push(MaterialPageRoute(
// //                   builder: (context) => Category(
// //                         data: text,
// //                       )));
// //             },
// //             child: Text(
// //               text,
// //               style: TextStyle(fontSize: 20),
// //             ))



// // //  CarouselSlider(
// // //             options: CarouselOptions(
// // //               height: width / 1.4,
// // //               autoPlay: true,
// // //               aspectRatio: 16 / 9,
// // //               viewportFraction: 0.3 * 1.5,
// // //               initialPage: 1,
// // //               enableInfiniteScroll: true,
// // //               reverse: false,
// // //               autoPlayInterval: Duration(seconds: 4),
// // //               autoPlayAnimationDuration: Duration(milliseconds: 800),
// // //               autoPlayCurve: Curves.fastOutSlowIn,
// // //             ),
// // //             items: data.data.asMap().entries.map((data) {
// // //               return Row(
// // //                 children: [
// // //                   Card2Row(
// // //                     data: data.value,
// // //                     i: data.key,
// // //                   ), //datanya diambil dari data.value yang ada di PopularModel
// // //                   Card3Row(
// // //                     data: data.value,
// // //                     i: data.key,
// // //                   ),
// // //                 ],
// // //               );
// // //             }).toList(),
// // //           ),
// FutureBuilder(
//                         builder: (context, AsyncSnapshot snapshot) {
//                           if (snapshot.connectionState != ConnectionState.done)
//                             return Center(
//                               child: CircularProgressIndicator(),
//                             );
//                           if (snapshot.hasError)
//                             return Center(
//                               child: Text('Ada Error Banh'),
//                             );
//                           if (snapshot.hasData)
//                             return _rekomendasiBuilder(snapshot.data);
//                           return Center(
//                             child: Text('kosong'),
//                           );
//                         },
//                         future: prod,
//                       ),


// Widget _rekomendasiBuilder(Empty data) {
//     // ignore: avoid_print
//     // data.data.where((element)=>element.idKate.co);
//     return Wrap(
//       children: data.data.map((data) {
//         return Card1(
//           data: data,
//         );
//       }).toList(),
//     );
//   }