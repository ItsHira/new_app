import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/provider_function.dart';

class Mapdata extends StatefulWidget {
  final String endPoint;
  const Mapdata({super.key, required this.endPoint});

  @override
  State<Mapdata> createState() => _MapdataState();
}

class _MapdataState extends State<Mapdata> {
  @override
  void initState() {
    super.initState();
    final data = Provider.of<ProviderFuntion>(context, listen: false);
    data.getData(widget.endPoint);
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<ProviderFuntion>(context, listen: true);

    return Expanded(
      child: Card(
        child: data.isloading == false
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    ...List.generate(
                      data.artical!.length,
                      (index) => ListTile(
                        leading: CachedNetworkImage(
                          imageUrl: data.artical?[index].urlToImage ?? '',
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                        title: Text(
                          data.artical?[index].title ?? '',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(data.artical?[index].description ?? ''),
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
