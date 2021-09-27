
import 'package:flutter/material.dart';
import 'package:getwidget/components/accordion/gf_accordion.dart';
import 'package:getwidget/components/appbar/gf_appbar.dart';
import 'package:getwidget/components/typography/gf_typography.dart';

class loaderPage extends StatefulWidget {
  @override
  _loaderPageState createState() => _loaderPageState();
}

class _loaderPageState extends State<loaderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GFAppBar(
          title: Text('Foire aux questions', style: TextStyle(fontSize: 18),),
          centerTitle: true,
          automaticallyImplyLeading: true,
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(left: 10, right: 10, top: 20, ),
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: ScrollPhysics(),
            children: <Widget>[
              GFAccordion(
                  title: 'GF Accordion',
                  content: 'GetFlutter is an open source library that comes with  pre-build 1000+ UI components.',
                  collapsedIcon: Icon(Icons.add),
                  expandedIcon: Icon(Icons.minimize)
              ),
              SizedBox(
                height: 40,
              ),
              GFAccordion(
                  title: 'GF Accordion',
                  content: 'GetFlutter is an open source library that comes with  pre-build 1000+ UI components.',
                  collapsedIcon: Icon(Icons.add),
                  expandedIcon: Icon(Icons.minimize)
              ),
              SizedBox(
                height: 40,
              ),
              GFAccordion(
                  title: 'GF Accordion',
                  content: 'GetFlutter is an open source library that comes with  pre-build 1000+ UI components.',
                  collapsedIcon: Icon(Icons.add),
                  expandedIcon: Icon(Icons.minimize)
              ),
              SizedBox(
                height: 40,
              ),
              GFAccordion(
                  title: 'GF Accordion',
                  content: 'GetFlutter is an open source library that comes with  pre-build 1000+ UI components.',
                  collapsedIcon: Icon(Icons.add),
                  expandedIcon: Icon(Icons.minimize)
              ),
              SizedBox(
                height: 40,
              ),
              GFAccordion(
                  title: 'GF Accordion',
                  content: 'GetFlutter is an open source library that comes with  pre-build 1000+ UI components.',
                  collapsedIcon: Icon(Icons.add),
                  expandedIcon: Icon(Icons.minimize)
              ),
              SizedBox(
                height: 40,
              ),
              GFAccordion(
                  title: 'GF Accordion',
                  content: 'GetFlutter is an open source library that comes with  pre-build 1000+ UI components.',
                  collapsedIcon: Icon(Icons.add),
                  expandedIcon: Icon(Icons.minimize)
              ),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        )
    );
  }
}