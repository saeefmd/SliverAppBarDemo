import 'package:flutter/material.dart';
import 'package:sliver_appbar_demo/demo_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SliversHome(),
    );
  }
}

class SliversHome extends StatelessWidget {

  static double width;
  static double height;

  @override
  Widget build(BuildContext context) {

    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            backgroundColor: Colors.black,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset('assets/image.jpg', fit: BoxFit.cover,),
              title: Text('Sliver App Bar'),
            ),
            leading: Icon(
              Icons.arrow_back,
              size: 20,
              color: Colors.white,
            ),
            actions: [
              InkWell(
                onTap: () {},
                child: Icon(
                  Icons.settings,
                  size: 20,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 12,),
            ],
          ),
          _buildBody(),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return SliverToBoxAdapter(
      child: GridView.builder(
        scrollDirection: Axis.vertical,
        primary: false,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.8
        ),
        itemCount: 20,
        itemBuilder: (context, index) => Container(color: Colors.green, margin: EdgeInsets.all(5),),
      ),
    );
  }

  Widget _appBarSpace() {
    return SafeArea(
      child: Container(
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: InkWell(
                onTap: () {},
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Colors.red,
                      size: 25,
                    ),
                    SizedBox(height: 2,),
                    Text(
                      'Dhaka',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                margin: EdgeInsets.fromLTRB(10, 15, 20, 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey[200],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Icon(
                        Icons.search,
                        color: Colors.grey,
                        size: 16,
                      ),
                    ),
                    Expanded(
                      flex: 10,
                      child: SizedBox(
                        child: TextField(
                          autofocus: false,
                          textAlignVertical: TextAlignVertical.center,
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                          decoration: InputDecoration(
                              hintText: "Search Here",
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                              )
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.mic,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.notifications,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



