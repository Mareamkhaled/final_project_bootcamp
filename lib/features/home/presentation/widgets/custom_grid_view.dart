import 'package:final_project_bootcamp/features/home/presentation/widgets/product_item.dart';
// import 'package:final_project_bootcamp/main%20screen/presentation/widgets/card_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../../core/resources/app_colors.dart';
import '../../data/models/clothes_model.dart';
import '../../logic/cubit/products_cubit.dart';

class CustomGridView extends StatefulWidget {
  const CustomGridView({
    super.key,
  });

  @override
  State<CustomGridView> createState() => _CustomGridViewState();
}

class _CustomGridViewState extends State<CustomGridView> {
  late List<ProductItem> allProducts;
 late List<ProductItem> searchedForCharacters;
  final searchTextController = TextEditingController();
  bool isSearching = false;

  // late Future<List<ProductItem>> products;

  @override
  void initState() {
    super.initState();
   BlocProvider.of<ProductsCubit>(context).getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return buildBlocWidget();
    
  }


  Widget buildBlocWidget() {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsLoaded) {
          allProducts = (state).products;
          return buildLoadedListWidgets();
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.myBlack,
            ),
          );
        }
      },
    );
  }

  Widget buildLoadedListWidgets() {
    return SingleChildScrollView(
      child: Container(
              color: AppColors.myWhite,
        
        child: Column(
          children: [buildCharactersList()],
        ),
      ),
    );
  }

  Widget buildCharactersList() {
    return  GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              // padding: EdgeInsets.zero,
              itemCount: searchTextController.text.isEmpty
                  ? allProducts.length
                  : searchedForCharacters.length,
              itemBuilder: (context, index) {
                return ProductItemm(
                  product: searchTextController.text.isEmpty
                      ? allProducts[index]
                      : searchedForCharacters[index],
                );
              },
            );
    
  }


  List<Widget> buildAppBarAction() {
    if (isSearching) {
      return [
        IconButton(
          onPressed: () {
            clearSearch();
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.clear,
            color: AppColors.myBlack,
          ),
        )
      ];
    } else {
      return [
        IconButton(
          onPressed: startSearch,
          icon: const Icon(
            Icons.search,
            color: AppColors.myBlack,
          ),
        )
      ];
    }
  }
  void startSearch() {
    //! act as i go to another screen to show back arrow
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: stopSearching));
    setState(() {
      //! to convert the icon from search to x
      isSearching = true;
    });
  }
  void stopSearching() {
    clearSearch();
    setState(() {
      isSearching = false;
    });
  }

  void clearSearch() {
    setState(() {
      searchTextController.clear();
    });
  }

   void addSearchedForItemsToSearchList(String searchCharacter) {
    searchedForCharacters = allProducts
        .where((character) =>
            character.title!.toLowerCase().startsWith(searchCharacter))
        .toList();
    // return searchCharacter;
    setState(() {});
  }
}
