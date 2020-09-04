import 'package:flutter/material.dart';
import 'package:flutter_library_app/constants/color_constant.dart';
import 'package:flutter_library_app/models/book_model.dart';
import 'package:flutter_library_app/models/popularbook_model.dart';
import 'package:flutter_library_app/widgets/custom_tab_indicator.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../models/popularbook_model.dart';

class SelectedBookPage extends StatelessWidget {
  final Book book;

  SelectedBookPage({Key key, @required this.book})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        bottomNavigationBar: Container(
          margin: EdgeInsets.only(left: 25, right: 25, bottom: 25),
          height: 49,
          color: Colors.transparent,
          child: FlatButton(
            color: kMainColor,
            onPressed: (){},
            child: Text(
              "افزودن به کتابخانه",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: kWhiteColor,
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        body: SafeArea(
          child: Container(
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  backgroundColor: kMainColor,
                  expandedHeight: MediaQuery.of(context).size.height * 0.5,
                  flexibleSpace: Container(
                    color: Colors.blue,
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: Stack(
                      children: [

                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            margin: EdgeInsets.only(bottom: 62),
                            width: 172,
                            height: 225,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    populars[1].image),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
                    Padding(
                      padding: EdgeInsets.only(
                        top: 24,
                        right: 25,
                      ),
                      child: Text(
                        book.name,
                        style: TextStyle(
                            fontSize: 27,
                            color: kBlackColor,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 7,
                        right: 25,
                      ),
                      child: Text(
                        book.author,
                        style: TextStyle(
                          fontSize: 14,
                          color: kGreyColor,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 7,
                        right: 25,
                      ),
                      child: Text(
                        "کد کتاب: " + book.code.toString(),
                        style: TextStyle(
                          fontSize: 14,
                          color: kGreyColor,
                        ),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(
                              top: 7,
                              right: 25,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  book.price.toString(),
                                  style: TextStyle(
                                    fontSize: 32,
                                    color: kMainColor,
                                  ),
                                ),
                                SizedBox(
                                  width: 7,
                                ),
                                Text(
                                  "تومان",
                                  style: TextStyle(fontSize: 18, color: kMainColor),
                                ),
                              ],
                            )
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                              top: 7,
                              right: 35,
                            ),
                            child:
                                Text(
                                  book.borrow == true? "امانت گرفته شده":"موجود",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: book.borrow == true? Colors.red:Colors.green,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                        ),
                      ],
                    ),
                    Container(
                      height: 28,
                      margin: EdgeInsets.only(top: 23, bottom: 36),
                      padding: EdgeInsets.only(right: 25),
                      child: DefaultTabController(
                          length: 3,
                          child: TabBar(
                              labelPadding: EdgeInsets.all(0),
                              indicatorPadding: EdgeInsets.all(0),
                              isScrollable: true,
                              labelColor: kBlackColor,
                              unselectedLabelColor: kGreyColor,
                              labelStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "Dana"),
                              unselectedLabelStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "Dana"),
                              indicator: RoundedRectangleTabIndicator(
                                  weight: 2, width: 30, color: kBlackColor),
                              tabs: [
                                Tab(
                                    child: Directionality(
                                      child: Container(
                                        child: Text("توضیحات"),
                                        margin: EdgeInsets.only(left: 39),
                                      ),
                                      textDirection: TextDirection.rtl,
                                    )),
                                Tab(
                                  child: Container(
                                    child: Text("نظرات"),
                                    margin: EdgeInsets.only(left: 39),
                                  ),
                                ),
                                Tab(
                                  child: Container(
                                    child: Text("کتاب‌های مشابه"),
                                    margin: EdgeInsets.only(left: 39),
                                  ),
                                ),
                              ])),
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                          left: 25,
                          right: 25,
                          bottom: 25,
                        ),
                        child: Text(
                          book.description,
                          style: TextStyle(
                              fontSize: 12,
                              color: kGreyColor,
                              letterSpacing: 1.5,
                              height: 2),
                        ))
                  ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
