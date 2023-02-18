import 'package:flutter/material.dart';
import 'package:maxway_branches/core/theme/app_colors.dart';
import 'package:maxway_branches/pages/ui/branch_item.dart';
import 'package:maxway_branches/pages/ui/shimmer_item.dart';
import 'package:provider/provider.dart';

import '../data/data_model.dart';
import 'main_provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    List<Branch>? branches = context.watch<MainProvider>().branchList;
    context.read<MainProvider>().getBranches();
    return Scaffold(
      backgroundColor: AppColors.color3,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: AppColors.mainColor,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: const Text(
                  "Filiallar",
                  style: TextStyle(color: Colors.white),
                ),
                background: Image.network(
                  "http://myday.uz/images/social_photo/31881.jpg",
                  fit: BoxFit.cover,
                )),
            expandedHeight: 240.0,
            leading: const Icon(
              Icons.map,
              color: Colors.white,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return branches != null
                    ? BranchItem(
                        () {},
                        branches[index],
                      )
                    : const ShimmerItem();
              },
              childCount: branches == null ? 15 : branches.length,
            ),
          ),
        ],
      ),
    );
  }
}
