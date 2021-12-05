// import 'package:flutter/material.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';

// // 此版本依托于0.6.0版本如果需要使用,请安装替换该版本

// class SliderController extends StatefulWidget {
//   SliderController({Key? key}) : super(key: key);

//   @override
//   _SliderControllerState createState() => _SliderControllerState();
// }

// class _SliderControllerState extends State<SliderController> {
//   late final SlidableController slidableController;
//   Animation<double>? _rotationAnimation;

//   final List<_HomeItem> items = List.generate(
//     50,
//     (i) => _HomeItem(
//       i,
//       'Tile n°$i ashui hiuasd asd kasd asdkh asdh asdkj asdkj asdas askj asd',
//     ),
//   );

//   @protected
//   void initState() {
//     slidableController = SlidableController(
//       onSlideAnimationChanged: handleSlideAnimationChanged,
//     );
//     super.initState();
//   }

//   void handleSlideAnimationChanged(Animation<double>? slideAnimation) {
//     setState(() {
//       _rotationAnimation = slideAnimation;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('右滑显示删除图标'),
//       ),
//       body: Center(
//         child: OrientationBuilder(
//           builder: (context, orientation) => _buildList(
//             context,
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildList(BuildContext context) {
//     return ListView.builder(
//       itemBuilder: (context, index) {
//         return _getSlidableWithLists(context, index);
//       },
//       itemCount: items.length,
//     );
//   }

//   Widget _getSlidableWithLists(BuildContext context, int index) {
//     final _HomeItem item = items[index];
//     return Slidable(
//       key: Key(item.title),
//       controller: slidableController,
//       dismissal: SlidableDismissal(
//         child: SlidableDrawerDismissal(),
//         onDismissed: (actionType) {
//           _showSnackBar(
//             context,
//             'Real Delete',
//           );
//           setState(() {
//             items.removeAt(index);
//           });
//         },
//       ),
//       actionPane: _getActionPane(item.index)!,
//       actionExtentRatio: 0.25,
//       secondaryActions: <Widget>[
//         IconSlideAction(
//           caption: 'More',
//           color: Colors.grey.shade200,
//           icon: Icons.more_horiz,
//           onTap: () => _showSnackBar(context, 'More'),
//           closeOnTap: false,
//         ),
//         IconSlideAction(
//           caption: 'Delete',
//           color: Colors.red,
//           icon: Icons.delete,
//           onTap: () => _showSnackBar(context, 'Delete'),
//         ),
//       ],
//       child: VerticalListItem(items[index]),
//     );
//   }

//   static Widget? _getActionPane(int index) {
//     return SlidableBehindActionPane();
//   }

//   void _showSnackBar(BuildContext context, String text) {
//     ScaffoldMessenger.of(context)
//       ..hideCurrentSnackBar()
//       ..showSnackBar(SnackBar(content: Text(text)));
//     // 上面的级联操作相当于下面的代码
//     // var newtest = ScaffoldMessenger.of(context);
//     // newtest.hideCurrentSnackBar();
//     // newtest.showSnackBar(SnackBar(content: Text(text)));
//   }
// }

// class VerticalListItem extends StatelessWidget {
//   final _HomeItem item;
//   VerticalListItem(this.item);
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         return Slidable.of(context)?.close();
//       },
//       child: Container(
//         color: Colors.white,
//         child: ListTile(
//           leading: CircleAvatar(
//             child: Text('${item.index}'),
//             foregroundColor: Colors.white,
//           ),
//           title: Text(item.title),
//         ),
//       ),
//     );
//   }
// }

// class _HomeItem {
//   const _HomeItem(
//     this.index,
//     this.title,
//   );

//   final int index;
//   final String title;
// }
