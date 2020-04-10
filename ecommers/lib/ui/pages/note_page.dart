import 'package:flutter/material.dart' hide BackButton;

import 'package:ecommers/ui/decorations/dimens/index.dart';
import 'package:ecommers/ui/decorations/index.dart';
import 'package:ecommers/ui/widgets/index.dart';
import 'package:ecommers/core/models/data_models/index.dart';

class NotePage extends StatelessWidget {
  static const double _toolbarExpandedHeight = 250.0;
  final Note model;

  const NotePage({
    this.model,
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context)
        .textTheme
        .bodyText1
        .copyWith(fontWeight: FontWeight.w700);
    final descriptionStyle = Theme.of(context).textTheme.bodyText1;

    return Container(
      color: BrandingColors.pageBackground,
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            leading: const BackButton(),
            expandedHeight: _toolbarExpandedHeight,
            flexibleSpace: FlexibleSpaceBar(
              title: Container(
                color: Colors.white.withOpacity(0.3),
                padding: EdgeInsets.symmetric(horizontal: Insets.x2),
                child: Text(
                  model.title,
                  style: titleStyle,
                ),
              ),
              centerTitle: true,
              background: CachedImage(
                imagePath: model.imageUrl,
                boxFit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(Dimens.pagePadding),
              child: Text(
                model.description,
                style: descriptionStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
