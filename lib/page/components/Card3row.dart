import 'package:betta_fish/page/detail/detailproduct.dart';
import 'package:flutter/material.dart';

class Card3Row extends StatefulWidget {
  final data;
  int i;
  Card3Row({required this.data, required this.i});
  @override
  _Card3RowState createState() => _Card3RowState();
}

class _Card3RowState extends State<Card3Row> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailProduck(
                    data: widget.data,
                  )),
        );
      },
      child: Padding(
        padding: EdgeInsets.only(top: 30, bottom: 0, left: 40, right: 0),
        child: Container(
          width: 230,
          height: 450,
          decoration: BoxDecoration(
            color: widget.i % 1 == 0
                ? Color(0xFFC0A3FF)
                : Color.fromARGB(120, 249, 132, 49),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
              topLeft: Radius.circular(300),
              topRight: Radius.circular(0),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 300,
                height: 250,
                decoration: BoxDecoration(
                  color: Color(0x00C0A3FF),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(widget.data.fotoBarang),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-0.7, -0.2),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: Text(
                    widget.data.kategori,
                    style: TextStyle(
                      fontFamily: 'Marko One',
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-0.55, -0.6),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 25, 0, 0),
                  child: Text(
                    widget.data.namaBarang,
                    style: TextStyle(
                      fontFamily: 'Roboto Condensed',
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
