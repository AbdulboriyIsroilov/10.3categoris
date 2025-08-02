import 'package:categories_page/feature/page/categories/widget/manegers/my_scaffold_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'bottom_item.dart';

class RecipeAppBarBottom extends StatelessWidget
    implements PreferredSizeWidget {
  const RecipeAppBarBottom({
    super.key,
    required this.selectedIndex,
  });

  final int selectedIndex;

  @override
  Size get preferredSize => Size(double.infinity, 25.h);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>MyscaffoldViewModul(),
      builder: (context, child) {
        return Consumer<MyscaffoldViewModul>(
          builder: (context, vm, child) {
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 39.w, vertical: 7.h),
                child: Row(
                  spacing: 19.w,
                  children: List.generate(
                    vm.mycategoris.length,
                    (index) => BottomItem(
                      id: vm.mycategoris[index]['id'],
                      title: vm.mycategoris[index]['title'],
                      isSelected: vm.mycategoris[index]['id'] == selectedIndex,
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
