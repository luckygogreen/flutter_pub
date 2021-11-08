import 'package:flutter/material.dart';
import '../data/temp.dart';

class DeleteMapInList extends StatefulWidget {
  DeleteMapInList({Key? key}) : super(key: key);

  @override
  _DeleteMapInListState createState() => _DeleteMapInListState();
}

class _DeleteMapInListState extends State<DeleteMapInList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('删除列表中的指定字典'),
      ),
      body: HomeBody(),
    );
  }
}

class HomeBody extends StatefulWidget {
  HomeBody({Key? key}) : super(key: key);

  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  List items = List.from(tempList);
  final List originalItems = List.from(tempList);
  List itemsSimple = List.from(tempListSimple);
  final List originalItemsSimple = List.from(tempListSimple);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: ListView.builder(
                  itemBuilder: _getOriginalItem,
                  itemCount: originalItems.length,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: _getItem,
                  itemCount: items.length,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: ListView.builder(
                  itemBuilder: _getOriginalItemSimple,
                  itemCount: originalItemsSimple.length,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: _getItemSimple,
                  itemCount: itemsSimple.length,
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 380.0),
          child: TextButton.icon(
            onPressed: () {
              setState(() {
                if (itemsSimple.isNotEmpty) {
                  itemsSimple.removeAt(0);
                } else {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('没有数据可删了')));
                }
                if (items.isNotEmpty) {
                  items.removeAt(0);
                } else {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('没有数据可删了')));
                }
              });
            },
            icon: Icon(
              Icons.delete,
              size: 50.0,
            ),
            label: Text('Delete', style: TextStyle(fontSize: 35.0)),
          ),
        )
      ],
    );
  }

  Widget _getItem(BuildContext context, int index) {
    return Text(
      items[index]['name'],
      style: TextStyle(
        fontSize: 25.0,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _getOriginalItem(BuildContext context, int index) {
    return Text(
      originalItems[index]['name'],
      style: TextStyle(
        fontSize: 25.0,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _getItemSimple(BuildContext context, int index) {
    return Text(
      itemsSimple[index].toString(),
      style: TextStyle(
        fontSize: 25.0,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _getOriginalItemSimple(BuildContext context, int index) {
    return Text(
      originalItemsSimple[index].toString(),
      style: TextStyle(
        fontSize: 25.0,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
