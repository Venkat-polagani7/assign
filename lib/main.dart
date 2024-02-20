import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cached_network_images/CachedNetworkImage.dart';
import 'package:assignment_0/data_provider/DataProvider.dart';
import 'images/image_list.dart';

void main() {
  runApp(MyApp());
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => DataProvider(),
//       child: MaterialApp(
//         title: 'Shutterstock Images',
//         home: Scaffold(
//           appBar: AppBar(
//             title: Text('Shutterstock Images'),
//           ),
//           body: Column(
//             children: [
//               Expanded(
//                 child: ImageGrid(),
//               ),
//               Consumer<DataProvider>(
//                 builder: (ctx, dataProvider, _) => dataProvider.isLoading
//                     ? CircularProgressIndicator()
//                     : ElevatedButton(
//                   onPressed: () => dataProvider.fetchImages(),
//                   child: Text('Load More'),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => DataProvider(),
//       child: MaterialApp(
//         title: 'Shutterstock Images',
//         home: Scaffold(
//           appBar: AppBar(
//             title: Text('Shutterstock Images'),
//             actions: [
//               PopupMenuButton(
//                 onSelected: (imageType) {
//                   Provider.of<DataProvider>(context, listen: false)
//                       .fetchImages(imageType);
//                 },
//                 itemBuilder: (BuildContext context) {
//                   return [
//                     PopupMenuItem(
//                       value: 'preview',
//                       child: Text('Preview'),
//                     ),
//                     PopupMenuItem(
//                       value: 'small_thumb',
//                       child: Text('Small Thumb'),
//                     ),
//                     PopupMenuItem(
//                       value: 'large_thumb',
//                       child: Text('Large Thumb'),
//                     ),
//                     PopupMenuItem(
//                       value: 'mosaic',
//                       child: Text('Mosaic'),
//                     ),
//                     PopupMenuItem(
//                       value: 'preview_1000',
//                       child: Text('Preview 1000'),
//                     ),
//                     PopupMenuItem(
//                       value: 'preview_1500',
//                       child: Text('Preview 1500'),
//                     ),
//                     PopupMenuItem(
//                       value: 'huge_thumb',
//                       child: Text('Huge Thumb'),
//                     ),
//                   ];
//                 },
//               ),
//             ],
//           ),
//           body: Column(
//             children: [
//               Expanded(
//                 child: ImageGrid(),
//               ),
//               Consumer<DataProvider>(
//                 builder: (ctx, dataProvider, _) => dataProvider.isLoading
//                     ? CircularProgressIndicator()
//                     : ElevatedButton(
//                   onPressed: () => dataProvider.fetchImages(),
//                   child: Text('Load More'),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => DataProvider(),
//       child: MaterialApp(
//         title: 'Shutterstock Images',
//         home: Scaffold(
//           appBar: AppBar(
//             title: Text('Assignment',),
//             actions: [
//               Consumer<DataProvider>(
//                 builder: (context, dataProvider, _) => PopupMenuButton(
//                   onSelected: (imageType) {
//                     dataProvider.setImageType(imageType);
//                   },
//                   itemBuilder: (BuildContext context) {
//                     return [
//                       PopupMenuItem(
//                         value: 'preview',
//                         child: Text('Preview'),
//                       ),
//                       PopupMenuItem(
//                         value: 'small_thumb',
//                         child: Text('Small Thumb'),
//                       ),
//                       PopupMenuItem(
//                         value: 'large_thumb',
//                         child: Text('Large Thumb'),
//                       ),
//                       PopupMenuItem(
//                         value: 'mosaic',
//                         child: Text('Mosaic'),
//                       ),
//                       PopupMenuItem(
//                         value: 'preview_1000',
//                         child: Text('Preview 1000'),
//                       ),
//                       PopupMenuItem(
//                         value: 'preview_1500',
//                         child: Text('Preview 1500'),
//                       ),
//                       PopupMenuItem(
//                         value: 'huge_thumb',
//                         child: Text('Huge Thumb'),
//                       ),
//                     ];
//                   },
//                 ),
//               ),
//             ],
//           ),
//           body: Column(
//             children: [
//               Expanded(
//                 child: ImageGrid(),
//               ),
//               Consumer<DataProvider>(
//                 builder: (ctx, dataProvider, _) => dataProvider.isLoading
//                     ? CircularProgressIndicator()
//                     : ElevatedButton(
//                   onPressed: dataProvider.fetchImages,
//                   child: Text('Load More'),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DataProvider(),
      child: MaterialApp(
        title: 'Shutterstock Images',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Assignment'),
            actions: [
              Consumer<DataProvider>(
                builder: (context, dataProvider, _) => PopupMenuButton(
                  onSelected: (imageType) {
                    dataProvider.setImageType(imageType);
                  },
                  itemBuilder: (BuildContext context) {
                    return [
                      PopupMenuItem(
                        value: 'preview',
                        child: Text('Preview'),
                      ),
                      PopupMenuItem(
                        value: 'small_thumb',
                        child: Text('Small Thumb'),
                      ),
                      PopupMenuItem(
                        value: 'large_thumb',
                        child: Text('Large Thumb'),
                      ),
                      PopupMenuItem(
                        value: 'mosaic',
                        child: Text('Mosaic'),
                      ),
                      PopupMenuItem(
                        value: 'preview_1000',
                        child: Text('Preview 1000'),
                      ),
                      PopupMenuItem(
                        value: 'preview_1500',
                        child: Text('Preview 1500'),
                      ),
                      PopupMenuItem(
                        value: 'huge_thumb',
                        child: Text('Huge Thumb'),
                      ),
                    ];
                  },
                ),
              ),
            ],
          ),
          body: ImageList(),
        ),
      ),
    );
  }
}





