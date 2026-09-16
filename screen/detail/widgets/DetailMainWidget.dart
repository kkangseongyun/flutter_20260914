import 'package:flutter/material.dart';
import '../dto/ProductDto.dart';

import 'ProductCard.dart';


class DetailMainWidget extends StatelessWidget {

  final List<ProductDto> datas = [
    ProductDto('assets/images/item1.jpg', '스위스/이탈리아 9일', '터키항공 잔여석31 가이드동행'),
    ProductDto('assets/images/item2.jpg', '서유럽 4국 9일', '아시아나항공 잔여석25 가이드동행'),
    ProductDto('assets/images/item3.jpg', '스위스 일주 9일', '대한항공 잔여석19 가이드동행'),
    ProductDto('assets/images/item1.jpg', '스위스/이탈리아 9일', '터키항공 잔여석31 가이드동행'),
    ProductDto('assets/images/item2.jpg', '서유럽 4국 9일', '아시아나항공 잔여석25 가이드동행'),
    ProductDto('assets/images/item3.jpg', '스위스 일주 9일', '대한항공 잔여석19 가이드동행'),
    ProductDto('assets/images/item1.jpg', '스위스/이탈리아 9일', '터키항공 잔여석31 가이드동행'),
    ProductDto('assets/images/item2.jpg', '서유럽 4국 9일', '아시아나항공 잔여석25 가이드동행'),
    ProductDto('assets/images/item3.jpg', '스위스 일주 9일', '대한항공 잔여석19 가이드동행'),
    ProductDto('assets/images/item1.jpg', '스위스/이탈리아 9일', '터키항공 잔여석31 가이드동행'),
    ProductDto('assets/images/item2.jpg', '서유럽 4국 9일', '아시아나항공 잔여석25 가이드동행'),
    ProductDto('assets/images/item3.jpg', '스위스 일주 9일', '대한항공 잔여석19 가이드동행'),
    ProductDto('assets/images/item1.jpg', '스위스/이탈리아 9일', '터키항공 잔여석31 가이드동행'),
    ProductDto('assets/images/item2.jpg', '서유럽 4국 9일', '아시아나항공 잔여석25 가이드동행'),
    ProductDto('assets/images/item3.jpg', '스위스 일주 9일', '대한항공 잔여석19 가이드동행'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: datas.length,
      itemBuilder: (context, index) {
        return ProductCard(product: datas[index]);
      },
    );
  }
}