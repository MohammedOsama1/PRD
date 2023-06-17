import 'package:flutter/material.dart';
import 'package:prd/controller/ex_file.dart';
import 'package:prd/controller/provider.dart';
import 'package:prd/view/widgets/item_details.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _searchController = TextEditingController();

    void _performSearch() async {
      final provider = Provider.of<HomeProvider>(context, listen: false);
      provider.setLoading(true);

      await Future.delayed(const Duration(milliseconds: 1000));

      final searchText = _searchController.text.toLowerCase();
      final filteredList = bloc.item.where((element) => element.productTitle!.toLowerCase().contains(searchText),).toList();

      provider.setFilteredData(filteredList);
      provider.setLoading(false);
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: KColor,
        title: TextField(
          controller: _searchController,
          style: const TextStyle(color: Colors.white),
          cursorColor: Colors.white,
          decoration: const InputDecoration(
            hintText: 'Search...',
            hintStyle: TextStyle(color: Colors.white54),
            border: InputBorder.none,
          ),
          onChanged: (_) => _performSearch(),
        ),
      ),
      body: Builder(
        builder: (context) {
          final provider = Provider.of<HomeProvider>(context);
          return provider.isLoading
              ?  Center(
            child: CircularProgressIndicator(color: KColor),
          )
              : ListView.builder(
            
            itemCount: provider.filteredData.length,
            itemBuilder: (context, index) => ListTile(
              title: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>ItemDetails(item: provider.filteredData[index],)));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '-  ${provider.filteredData[index].productTitle!}',
                    maxLines: 1,
                    style:  TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
