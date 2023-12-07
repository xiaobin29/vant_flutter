import 'package:flutter/material.dart';
import 'package:vant_flutter/theme/style.dart';
import 'package:vant_flutter/widgets/tag.dart';
import 'package:vant_flutter/widgets/price.dart';

class NCard extends StatelessWidget {
  // 左侧图片
  final Image image;
  // 标题
  final String? title;
  // 描述
  final String? desc;
  // 图片角标
  final String? tag;
  // 商品数量
  final int? num;
  // 商品价格
  final double? price;
  // 商品划线原价
  final double? originPrice;
  // 内容是否垂直居中
  final bool centered;
  // 货币符号
  final String currency;
  // 点击时触发
  final Function()? onClick;
  // 自定义标题内容
  final Widget? customTitle;
  // 自定义描述
  final Widget? customDesc;
  // 自定义数量
  final Widget? customNum;
  // 自定义价格
  final Widget? customPrice;
  // 自定义商品原价
  final Widget? customOriginPrice;
  // 自定义图片
  final Widget? customThumb;
  // 自定义图片角标
  final Widget? customTag;
  // 自定义描述下方标签区域
  final Widget? customTags;
  // 自定义 footer
  final Widget? customFooter;

  const NCard(
      {Key? key,
      required this.image,
      this.title,
      this.desc,
      this.tag,
      this.num,
      this.price,
      this.originPrice,
      this.centered = false,
      this.currency = "¥",
      this.onClick,
      this.customTitle,
      this.customDesc,
      this.customNum,
      this.customPrice,
      this.customOriginPrice,
      this.customThumb,
      this.customTag,
      this.customTags,
      this.customFooter})
      : super(key: key);

  Widget buildThumb() {
    return Stack(
      children: <Widget>[
        customThumb ??
            Container(
              width: Style.cardThumbSize,
              height: Style.cardThumbSize,
              margin: EdgeInsets.only(right: Style.intervalMd),
              child: image,
            ),
        customTag ??
            (tag != null
                ? Positioned(
                    left: 0,
                    top: 0,
                    child: Tag(color: Colors.red, mark: true, text: "$tag"),
                  )
                : Container())
      ],
    );
  }

  Widget buildContent() {
    return Expanded(
      child: Container(
        height: Style.cardThumbSize,
        child: Stack(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: centered
                  ? CrossAxisAlignment.center
                  : CrossAxisAlignment.start,
              children: <Widget>[
                customTitle ??
                    Text(title!,
                        style: TextStyle(
                            fontSize: Style.cardFontSize,
                            fontWeight: FontWeight.bold)),
                customDesc ??
                    Text(desc!,
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: Style.cardFontSize,
                            color: Style.cardDescColor)),
                SizedBox(height: Style.intervalSm),
                customTags ?? Container()
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.ideographic,
                    children: <Widget>[
                      customPrice ?? Price(value: price, currency: currency),
                      SizedBox(width: Style.intervalSm),
                      customOriginPrice ??
                          (originPrice != null
                              ? Text(
                                  "$currency${originPrice!.toStringAsFixed(2)}",
                                  style: TextStyle(
                                      color: Style.cardOriginPriceColor,
                                      fontSize: Style.cardOriginPriceFontSize,
                                      decoration: TextDecoration.lineThrough))
                              : Container())
                    ],
                  ),
                  customNum ??
                      Text("x$num",
                          style: TextStyle(
                              fontSize: Style.cardFontSize,
                              color: Style.cardNumColor))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onClick != null) onClick!();
      },
      child: Container(
        color: Style.cardBackgroundColor,
        padding: Style.cardPadding,
        child: Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[buildThumb(), buildContent()],
            ),
            customFooter ?? Container(),
          ],
        ),
      ),
    );
  }
}
