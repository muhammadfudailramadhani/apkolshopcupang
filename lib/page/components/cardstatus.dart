import 'package:flutter/material.dart';

class Cardstatus extends StatefulWidget {
  final data;
  Cardstatus({required this.data});
  @override
  _CardstatusState createState() => _CardstatusState();
}

class _CardstatusState extends State<Cardstatus> {
  void setStateIfMounted(f) {
    if (mounted) setState(f);
  }

  String status = "";
  @override
  Widget build(BuildContext context) {
    setStateIfMounted(() {
      widget.data.map((val) {
        status = val.statusPemesanan;
      }).toList();
    });
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(120, 0, 0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: AlignmentDirectional(-0.65, 0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 70, 0, 0),
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0xFF0066FF),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(22, 10, 20, 0),
                      child: Text(
                        '1',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                'Pesanan\ndibuat',
                style: TextStyle(
                  color: status == "Pesanan dibuat"
                      ? Color(0xFF56EA11)
                      : Colors.black,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(100, 0, 0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: AlignmentDirectional(-0.65, 0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 70, 0, 0),
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0xFF0066FF),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(22, 10, 20, 0),
                      child: Text(
                        '2',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                'Pesanan\ndiproses',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: status == "Pesanan dipacking"
                      ? Color(0xFF56EA11)
                      : Colors.black,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(100, 0, 0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: AlignmentDirectional(-0.65, 0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 70, 0, 0),
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0xFF0066FF),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(22, 10, 20, 0),
                      child: Text(
                        '3',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                'Pesanan\ndikirim',
                style: TextStyle(
                  color: status == "Pesanan dikirim"
                      ? Color(0xFF56EA11)
                      : Colors.black,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
