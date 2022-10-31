import 'package:betta_fish/page/detail/detailproduct.dart';
import 'package:flutter/material.dart';

class CardRow extends StatefulWidget {
  final data;
  int i;
  CardRow({required this.data, required this.i});
  @override
  _CardRowState createState() => _CardRowState();
}

class _CardRowState extends State<CardRow> {
  @override
  Widget build(BuildContext context) {
    if (widget.i % 2 == 0) {
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
        child: Container(
          width: 230,
          height: 450,
          decoration: BoxDecoration(
            color: Color(0xFFC0A3FF),
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
      );
    } else {
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
        child: Container(
          width: 230,
          height: 400,
          decoration: BoxDecoration(
            color: Color.fromARGB(120, 249, 132, 49),
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
      );
    }
  }
}
