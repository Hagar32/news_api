import 'package:flutter/material.dart';
import 'package:news_api/data/models/news_model.dart';
import 'package:news_api/data/remote_ds.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ArticleModel? _article;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text('News API'),
    centerTitle: true,
    backgroundColor: Colors.purple[100],
    ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_article != null) ...[
              Image.network(

                _article!.imageUrl,
                width: 300,
                height: 300,

              ),
              SizedBox(height: 20),
              Center(child: Text(  _article!.title,textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),)),
              SizedBox(height: 10),
              Center(child: Text(       _article!.description,textAlign: TextAlign.center,)),
            ],
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                _article = await NewsDataSourceImpl().fetchRandomArticle();
                setState(() {});
              },
              child: Text('Fetch Another Article'),
              clipBehavior: Clip.hardEdge,
            ),
          ],
        ),
      ),
    );
  }
}
