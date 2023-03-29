// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:ms_ecommerce_app/core/helpers/logger.dart';

class Product with ChangeNotifier {
  final String? createdAt;
  final String productId;
  final String productTitle;
  final String productDescription;
  final double productPrice;
  final String productImage;
  final String productCategory;
  final String productBrand;
  final int productQuantity;
  final bool isFavorite;
  final bool isPopular;

  Product({
    required this.productId,
    this.createdAt,
    required this.productTitle,
    required this.productBrand,
    required this.productDescription,
    required this.productImage,
    required this.isFavorite,
    required this.isPopular,
    required this.productPrice,
    required this.productCategory,
    required this.productQuantity,
  });

  @override
  String toString() {
    return 'Product(createdAt: $createdAt, productId: $productId, productTitle: $productTitle, productDescription: $productDescription, productPrice: $productPrice, productImage: $productImage, productCategory: $productCategory, productBrand: $productBrand, productQuantity: $productQuantity, isFavorite: $isFavorite, isPopular: $isPopular)';
  }
}

class ProductProvider with ChangeNotifier {
  // List<Product> _products = [
  //   Product(
  //       id: 'Samsung1',
  //       title: 'Samsung Galaxy S9',
  //       description:
  //           'Samsung Galaxy S9 G960U 64GB Unlocked GSM 4G LTE Phone w/ 12MP Camera - Midnight Black',
  //       price: 50.99,
  //       imageUrl:
  //           'https://images-na.ssl-images-amazon.com/images/I/81%2Bh9mpyQmL._AC_SL1500_.jpg',
  //       brand: 'Samsung',
  //       productCategoryName: 'Phones',
  //       quantity: 65,
  //       isFavorite: false,
  //       isPopular: true),
  //   Product(
  //       id: 'Samsung Galaxy A10s',
  //       title: 'Samsung Galaxy A10s',
  //       description:
  //           'Samsung Galaxy A10s A107M - 32GB, 6.2" HD+ Infinity-V Display, 13MP+2MP Dual Rear +8MP Front Cameras, GSM Unlocked Smartphone - Blue.',
  //       price: 50.99,
  //       imageUrl:
  //           'https://images-na.ssl-images-amazon.com/images/I/51ME-ADMjRL._AC_SL1000_.jpg',
  //       brand: 'Samsung ',
  //       productCategoryName: 'Phones',
  //       quantity: 1002,
  //       isFavorite: false,
  //       isPopular: false),
  //   Product(
  //       id: 'Samsung Galaxy A51',
  //       title: 'Samsung Galaxy A51',
  //       description:
  //           'Samsung Galaxy A51 (128GB, 4GB) 6.5", 48MP Quad Camera, Dual SIM GSM Unlocked A515F/DS- Global 4G LTE International Model - Prism Crush Blue.',
  //       price: 50.99,
  //       imageUrl:
  //           'https://images-na.ssl-images-amazon.com/images/I/61HFJwSDQ4L._AC_SL1000_.jpg',
  //       brand: 'Samsung',
  //       productCategoryName: 'Phones',
  //       quantity: 6423,
  //       isFavorite: false,
  //       isPopular: true),
  //   Product(
  //       id: 'Apple MacBook Air',
  //       title: 'Apple MacBook Air',
  //       description:
  //           'Apple MacBook Air 13.3" with Retina Display, 1.1GHz Quad-Core Intel Core i5, 16GB Memory, 256GB SSD, Space Gray (Early 2020)',
  //       price: 1220.99,
  //       imageUrl:
  //           'https://images-na.ssl-images-amazon.com/images/I/61wLbRLshAL._AC_SL1200_.jpg',
  //       brand: 'Apple',
  //       productCategoryName: 'Laptops',
  //       quantity: 815,
  //       isFavorite: false,
  //       isPopular: true),
  //   Product(
  //       id: 'Apple MacBook Progag',
  //       title: 'Apple MacBook Pro',
  //       description:
  //           'Apple MacBook Pro MF839LL/A 13.3in Laptop, Intel Core i5 2.7 GHz, 8GB Ram, 128GB SSD ',
  //       price: 700.89,
  //       imageUrl:
  //           'https://images-na.ssl-images-amazon.com/images/I/315CQ1KmlwL._AC_.jpg',
  //       brand: 'Apple',
  //       productCategoryName: 'Laptops',
  //       quantity: 815,
  //       isFavorite: false,
  //       isPopular: false),
  //   Product(
  //       id: 'Apple MacBook Air',
  //       title: 'Apple MacBook Air',
  //       description:
  //           'Apple MacBook Air 13.3" with Retina Display, 1.1GHz Quad-Core Intel Core i5, 8GB Memory, 256GB SSD, Silver (Early 2020)',
  //       price: 780.99,
  //       imageUrl:
  //           'https://images-na.ssl-images-amazon.com/images/I/61QRQHn0jJL._AC_SL1200_.jpg',
  //       brand: 'Apple',
  //       productCategoryName: 'Laptops',
  //       quantity: 4455,
  //       isFavorite: false,
  //       isPopular: true),
  //   Product(
  //       id: 'Apple 16 MacBook Pro',
  //       title: 'Apple 16 MacBook Pro',
  //       description:
  //           'Apple 16 MacBook Pro with Touch Bar, 9th-Gen 8-Core Intel i9 2.3GHz, 16GB RAM, 1TB SSD, AMD Radeon Pro 5500M 8GB, Space Gray, Late 2019 Z0Y0005J7 / Z0Y00006M',
  //       price: 800.99,
  //       imageUrl:
  //           'https://images-na.ssl-images-amazon.com/images/I/61qNHbx9LDL._AC_SL1200_.jpg',
  //       brand: 'Apple',
  //       productCategoryName: 'Laptops',
  //       quantity: 885,
  //       isFavorite: false,
  //       isPopular: false),
  //   Product(
  //       id: 'Sofa Setttt',
  //       title: 'Sofa Set',
  //       description: 'Beverly Fine Funiture Sectional Sofa Set, 91A Black ',
  //       price: 650.99,
  //       imageUrl:
  //           'https://images-na.ssl-images-amazon.com/images/I/71P-p2sj6eL._AC_SL1500_.jpg',
  //       brand: 'No brand',
  //       productCategoryName: 'Furniture',
  //       quantity: 91,
  //       isFavorite: false,
  //       isPopular: true),
  //   Product(
  //       id: 'Furniture Classroom with Teacher\'s',
  //       title: 'Furniture Classroom with Teacher\'s',
  //       description:
  //           'L.O.L. Surprise! Furniture Classroom with Teacher\'s Pet & 10+ Surprises',
  //       price: 120.99,
  //       imageUrl:
  //           'https://images-na.ssl-images-amazon.com/images/I/71xytsyiHzL._AC_SL1500_.jpg',
  //       brand: 'No brand',
  //       productCategoryName: 'Furniture',
  //       quantity: 815,
  //       isFavorite: false,
  //       isPopular: false),
  //   Product(
  //       id: 'Sofa Couch for Two People',
  //       title: 'Sofa Couch for Two People',
  //       description:
  //           'Serta Copenhagen Sofa Couch for Two People, Pillowed Back Cushions and Rounded Arms, Durable Modern Upholstered Fabric, 61" Loveseat, Brown',
  //       price: 1220.99,
  //       imageUrl:
  //           'https://images-na.ssl-images-amazon.com/images/I/81sBT3voCPL._AC_SL1500_.jpg',
  //       brand: 'No brand',
  //       productCategoryName: 'Furniture',
  //       quantity: 8100,
  //       isFavorite: false,
  //       isPopular: true),
  //   Product(
  //       id: 'Delta Children Plastic Toddler Bed',
  //       title: 'Delta Children Plastic Toddler Bed',
  //       description:
  //           'Delta Children Plastic Toddler Bed, Disney Princess + Delta Children Twinkle Galaxy Dual Sided Recycled Fiber Core Toddler Mattress (Bundle)',
  //       price: 127.99,
  //       imageUrl:
  //           'https://images-na.ssl-images-amazon.com/images/I/71Rj3InxQlL._SL1500_.jpg',
  //       brand: 'No brand',
  //       productCategoryName: 'Furniture',
  //       quantity: 9145,
  //       isFavorite: false,
  //       isPopular: false),
  //   Product(
  //       id: 'Outdoor Patio ',
  //       title: 'Outdoor Patio ',
  //       description:
  //           'Recaceik 3 Pieces Outdoor Patio Furniture Sets Rattan Chair Wicker Set, with Cushions and Tempered Glass Tabletop, Outdoor Indoor Use Backyard Porch Garden-(Brown)',
  //       price: 1224.88,
  //       imageUrl:
  //           'https://images-na.ssl-images-amazon.com/images/I/81KabJxRvDL._AC_SL1500_.jpg',
  //       brand: 'No brand',
  //       productCategoryName: 'Furniture',
  //       quantity: 25,
  //       isFavorite: false,
  //       isPopular: true),
  //   Product(
  //       id: 'Flash Furniture Nantucket 6 Piece',
  //       title: 'Flash Furniture Nantucket 6 Piece',
  //       description:
  //           'Flash Furniture Nantucket 6 Piece Black Patio Garden Set with Table, Umbrella and 4 Folding Chairs',
  //       price: 1220.99,
  //       imageUrl:
  //           'https://images-na.ssl-images-amazon.com/images/I/81khjDZg5xL._AC_SL1500_.jpg',
  //       brand: 'No brand',
  //       productCategoryName: 'Furniture',
  //       quantity: 651,
  //       isFavorite: false,
  //       isPopular: false),
  //   Product(
  //       id: 'Homall 4 Pieces Patio Outdoor Furniture Sets',
  //       title: 'Homall 4 Pieces Patio Outdoor Furniture Sets',
  //       description:
  //           'Homall 4 Pieces Patio Outdoor Furniture Sets, All Weather PE Rattan Wicker Sectional Sofa Modern Manual Conversation Sets with Cushions and Glass Table for Lawn Backyard Garden Poolside（Beige）',
  //       price: 1220.99,
  //       imageUrl:
  //           'https://images-na.ssl-images-amazon.com/images/I/716-fllmUCL._AC_SL1500_.jpg',
  //       brand: 'No brand',
  //       productCategoryName: 'Furniture',
  //       quantity: 594,
  //       isFavorite: false,
  //       isPopular: true),
  //   Product(
  //       id: 'Ashley Furniture Signature Design',
  //       title: 'Ashley Furniture Signature Design',
  //       description:
  //           'Ashley Furniture Signature Design - Dolante Upholstered Bed - Queen Size - Complete Bed Set in a Box - Contemporary Style Checker - Gray',
  //       price: 300.99,
  //       imageUrl:
  //           'https://images-na.ssl-images-amazon.com/images/I/71QxxtRFFkL._AC_SL1232_.jpg',
  //       brand: 'No brand',
  //       productCategoryName: 'Furniture',
  //       quantity: 78,
  //       isFavorite: false,
  //       isPopular: false),
  //   Product(
  //       id: 'Apple Watch Series 3',
  //       title: 'Apple Watch Series 3',
  //       description:
  //           'Apple Watch Series 3 (GPS, 38mm) - Silver Aluminum Case with White Sport Band',
  //       price: 100.99,
  //       imageUrl:
  //           'https://images-na.ssl-images-amazon.com/images/I/71vCuRn4CkL._AC_SL1500_.jpg',
  //       brand: 'Apple',
  //       productCategoryName: 'Watches',
  //       quantity: 156,
  //       isFavorite: false,
  //       isPopular: true),
  //   Product(
  //       id: 'Garmin Forerunner 45S',
  //       title: 'Garmin Forerunner 45S',
  //       description:
  //           'Garmin Forerunner 45S, 39mm Easy-to-use GPS Running Watch with Coach Free Training Plan Support, Purple',
  //       price: 86.99,
  //       imageUrl:
  //           'https://images-na.ssl-images-amazon.com/images/I/51EWl3XsiYL._AC_SL1000_.jpg',
  //       brand: 'No brand',
  //       productCategoryName: 'Watches',
  //       quantity: 142,
  //       isFavorite: false,
  //       isPopular: false),
  //   Product(
  //       id: 'Samsung Galaxy Watch Active 2',
  //       title: 'Samsung Galaxy Watch Active 2',
  //       description:
  //           'Samsung Galaxy Watch Active 2 (40mm, GPS, Bluetooth) Smart Watch with Advanced Health Monitoring, Fitness Tracking , and Long Lasting Battery - Silver (US Version)',
  //       price: 300.99,
  //       imageUrl:
  //           'https://images-na.ssl-images-amazon.com/images/I/51bSW9gjoaL._AC_SL1024_.jpg',
  //       brand: 'Samsung',
  //       productCategoryName: 'Watches',
  //       quantity: 167,
  //       isFavorite: false,
  //       isPopular: false),
  //   Product(
  //       id: 'Garmin vivoactive 4S',
  //       title: 'Garmin vivoactive 4S',
  //       description:
  //           'Garmin vivoactive 4S, Smaller-Sized GPS Smartwatch, Features Music, Body Energy Monitoring, Animated Workouts, Pulse Ox Sensors, Rose Gold with White Band',
  //       price: 40.99,
  //       imageUrl:
  //           'https://images-na.ssl-images-amazon.com/images/I/51r2LCE3FLL._AC_SL1000_.jpg',
  //       brand: 'No brand',
  //       productCategoryName: 'Watches',
  //       quantity: 659,
  //       isFavorite: false,
  //       isPopular: false),
  //   Product(
  //       id: 'Patek Philippe World',
  //       title: 'Patek Philippe World',
  //       description: 'Patek Philippe World Time Men\'s Watch Model 5131/1P-001',
  //       price: 20.99,
  //       imageUrl:
  //           'https://images-na.ssl-images-amazon.com/images/I/61MVdCYfbOL._AC_UX679_.jpg',
  //       brand: 'No brand',
  //       productCategoryName: 'Watches',
  //       quantity: 98,
  //       isFavorite: false,
  //       isPopular: false),
  //   Product(
  //       id: 'Bell & Ross Men',
  //       title: 'Bell & Ross Men',
  //       description:
  //           'Bell & Ross Men\'s BR-MNUTTOURB-PG Minuteur\' Black Carbon Fiber Dial 18K Rose Gold Tourbillon Watch',
  //       price: 33.99,
  //       imageUrl:
  //           'https://images-na.ssl-images-amazon.com/images/I/91M50AHRTKL._AC_UX569_.jpg',
  //       brand: 'No brand',
  //       productCategoryName: 'Watches',
  //       quantity: 951,
  //       isFavorite: false,
  //       isPopular: false),
  //   Product(
  //       id: 'New Apple Watch Series',
  //       title: 'New Apple Watch Series',
  //       description:
  //           'New Apple Watch Series 6 (GPS, 40mm) - Blue Aluminum Case with Deep Navy Sport Band ',
  //       price: 400.99,
  //       imageUrl:
  //           'https://images-na.ssl-images-amazon.com/images/I/71bf9IpGjtL._AC_SL1500_.jpg',
  //       brand: 'Apple',
  //       productCategoryName: 'Watches',
  //       quantity: 951,
  //       isFavorite: false,
  //       isPopular: false),
  //   Product(
  //       id: 'New Apple Watch SE',
  //       title: 'New Apple Watch SE',
  //       description:
  //           'New Apple Watch SE (GPS, 40mm) - Gold Aluminum Case with Pink Sand Sport Band',
  //       price: 200.99,
  //       imageUrl:
  //           'https://images-na.ssl-images-amazon.com/images/I/71JtUMDeBBL._AC_SL1500_.jpg',
  //       brand: 'Apple',
  //       productCategoryName: 'Watches',
  //       quantity: 951,
  //       isFavorite: false,
  //       isPopular: false),
  //   Product(
  //       id: 'YAMAY Smart Watch 2020 Ver',
  //       title: 'YAMAY Smart Watch 2020 Ver',
  //       description:
  //           'YAMAY Smart Watch 2020 Ver. Watches for Men Women Fitness Tracker Blood Pressure Monitor Blood Oxygen Meter Heart Rate Monitor IP68 Waterproof, Smartwatch Compatible with iPhone Samsung Android Phones',
  //       price: 183.99,
  //       imageUrl:
  //           'https://images-na.ssl-images-amazon.com/images/I/61gCtkVYb5L._AC_SL1000_.jpg',
  //       brand: 'Apple',
  //       productCategoryName: 'Watches',
  //       quantity: 56,
  //       isFavorite: false,
  //       isPopular: true),
  //   Product(
  //       id: 'Samsung Galaxy Watch Active 23',
  //       title: 'Samsung Galaxy Watch Active ',
  //       description:
  //           'Samsung Galaxy Watch Active (40MM, GPS, Bluetooth) Smart Watch with Fitness Tracking, and Sleep Analysis - Rose Gold  (US Version)',
  //       price: 150.99,
  //       imageUrl:
  //           'https://images-na.ssl-images-amazon.com/images/I/61n1c2vnPJL._AC_SL1500_.jpg',
  //       brand: 'Samsung',
  //       productCategoryName: 'Watches',
  //       quantity: 78,
  //       isFavorite: false,
  //       isPopular: true),
  //   Product(
  //       id: 'Samsung Galaxy Watch 3',
  //       title: 'Samsung Galaxy Watch 3',
  //       description:
  //           'Samsung Galaxy Watch 3 (41mm, GPS, Bluetooth) Smart Watch with Advanced Health monitoring, Fitness Tracking , and Long lasting Battery - Mystic Silver (US Version)',
  //       price: 184.99,
  //       imageUrl:
  //           'https://images-na.ssl-images-amazon.com/images/I/81Iu41zFPwL._AC_SL1500_.jpg',
  //       brand: 'Samsung',
  //       productCategoryName: 'Watches',
  //       quantity: 9598,
  //       isFavorite: false,
  //       isPopular: true),
  //   Product(
  //       id: 'Samsung Galaxy Watch Active2 ',
  //       title: 'Samsung Galaxy Watch Active2 ',
  //       description:
  //           'Samsung Galaxy Watch Active2 (Silicon Strap + Aluminum Bezel) Bluetooth - International (Aqua Black, R820-44mm)',
  //       price: 120.99,
  //       imageUrl:
  //           'https://images-na.ssl-images-amazon.com/images/I/518qjbbuGZL._AC_SL1000_.jpg',
  //       brand: 'Samsung',
  //       productCategoryName: 'Watches',
  //       quantity: 951,
  //       isFavorite: false,
  //       isPopular: false),
  //   Product(
  //       id: 'Huawei Watch 2 Sport Smartwatch',
  //       title: 'Huawei Watch 2 Sport Smartwatch',
  //       description:
  //           'Huawei Watch 2 Sport Smartwatch - Ceramic Bezel - Carbon Black Strap (US Warranty)',
  //       price: 180.99,
  //       imageUrl:
  //           'https://images-na.ssl-images-amazon.com/images/I/71yPa1g4gWL._AC_SL1500_.jpg',
  //       brand: 'Huawei',
  //       productCategoryName: 'Watches',
  //       quantity: 951,
  //       isFavorite: false,
  //       isPopular: true),
  // ];
  final List<Product> _localProducts = [
    Product(
        productId: 'Samsung1',
        productTitle: 'Samsung Galaxy S9',
        productDescription:
            'Samsung Galaxy S9 G960U 64GB Unlocked GSM 4G LTE Phone w/ 12MP Camera - Midnight Black',
        productPrice: 50.99,
        productImage:
            'https://images-na.ssl-images-amazon.com/images/I/81%2Bh9mpyQmL._AC_SL1500_.jpg',
        productBrand: 'Samsung',
        productCategory: 'Phones',
        productQuantity: 65,
        isFavorite: false,
        isPopular: true),
    Product(
        productId: 'Samsung Galaxy A10s',
        productTitle: 'Samsung Galaxy A10s',
        productDescription:
            'Samsung Galaxy A10s A107M - 32GB, 6.2" HD+ Infinity-V Display, 13MP+2MP Dual Rear +8MP Front Cameras, GSM Unlocked Smartphone - Blue.',
        productPrice: 50.99,
        productImage:
            'https://images-na.ssl-images-amazon.com/images/I/51ME-ADMjRL._AC_SL1000_.jpg',
        productBrand: 'Samsung ',
        productCategory: 'Phones',
        productQuantity: 1002,
        isFavorite: false,
        isPopular: false),
    Product(
        productId: 'Samsung Galaxy A51',
        productTitle: 'Samsung Galaxy A51',
        productDescription:
            'Samsung Galaxy A51 (128GB, 4GB) 6.5", 48MP Quad Camera, Dual SIM GSM Unlocked A515F/DS- Global 4G LTE International Model - Prism Crush Blue.',
        productPrice: 50.99,
        productImage:
            'https://images-na.ssl-images-amazon.com/images/I/61HFJwSDQ4L._AC_SL1000_.jpg',
        productBrand: 'Samsung',
        productCategory: 'Phones',
        productQuantity: 6423,
        isFavorite: false,
        isPopular: true),
    Product(
        productId: 'Apple MacBook Air',
        productTitle: 'Apple MacBook Air',
        productDescription:
            'Apple MacBook Air 13.3" with Retina Display, 1.1GHz Quad-Core Intel Core i5, 16GB Memory, 256GB SSD, Space Gray (Early 2020)',
        productPrice: 1220.99,
        productImage:
            'https://images-na.ssl-images-amazon.com/images/I/61wLbRLshAL._AC_SL1200_.jpg',
        productBrand: 'Apple',
        productCategory: 'Laptops',
        productQuantity: 815,
        isFavorite: false,
        isPopular: true),
    Product(
        productId: 'Apple MacBook Progag',
        productTitle: 'Apple MacBook Pro',
        productDescription:
            'Apple MacBook Pro MF839LL/A 13.3in Laptop, Intel Core i5 2.7 GHz, 8GB Ram, 128GB SSD ',
        productPrice: 700.89,
        productImage:
            'https://images-na.ssl-images-amazon.com/images/I/315CQ1KmlwL._AC_.jpg',
        productBrand: 'Apple',
        productCategory: 'Laptops',
        productQuantity: 815,
        isFavorite: false,
        isPopular: false),
    Product(
        productId: 'Apple MacBook Air',
        productTitle: 'Apple MacBook Air',
        productDescription:
            'Apple MacBook Air 13.3" with Retina Display, 1.1GHz Quad-Core Intel Core i5, 8GB Memory, 256GB SSD, Silver (Early 2020)',
        productPrice: 780.99,
        productImage:
            'https://images-na.ssl-images-amazon.com/images/I/61QRQHn0jJL._AC_SL1200_.jpg',
        productBrand: 'Apple',
        productCategory: 'Laptops',
        productQuantity: 4455,
        isFavorite: false,
        isPopular: true),
    Product(
        productId: 'Apple 16 MacBook Pro',
        productTitle: 'Apple 16 MacBook Pro',
        productDescription:
            'Apple 16 MacBook Pro with Touch Bar, 9th-Gen 8-Core Intel i9 2.3GHz, 16GB RAM, 1TB SSD, AMD Radeon Pro 5500M 8GB, Space Gray, Late 2019 Z0Y0005J7 / Z0Y00006M',
        productPrice: 800.99,
        productImage:
            'https://images-na.ssl-images-amazon.com/images/I/61qNHbx9LDL._AC_SL1200_.jpg',
        productBrand: 'Apple',
        productCategory: 'Laptops',
        productQuantity: 885,
        isFavorite: false,
        isPopular: false),
    Product(
        productId: 'Sofa Setttt',
        productTitle: 'Sofa Set',
        productDescription:
            'Beverly Fine Funiture Sectional Sofa Set, 91A Black ',
        productPrice: 650.99,
        productImage:
            'https://images-na.ssl-images-amazon.com/images/I/71P-p2sj6eL._AC_SL1500_.jpg',
        productBrand: 'No brand',
        productCategory: 'Furniture',
        productQuantity: 91,
        isFavorite: false,
        isPopular: true),
    Product(
        productId: 'Furniture Classroom with Teacher\'s',
        productTitle: 'Furniture Classroom with Teacher\'s',
        productDescription:
            'L.O.L. Surprise! Furniture Classroom with Teacher\'s Pet & 10+ Surprises',
        productPrice: 120.99,
        productImage:
            'https://images-na.ssl-images-amazon.com/images/I/71xytsyiHzL._AC_SL1500_.jpg',
        productBrand: 'No brand',
        productCategory: 'Furniture',
        productQuantity: 815,
        isFavorite: false,
        isPopular: false),
    Product(
        productId: 'Sofa Couch for Two People',
        productTitle: 'Sofa Couch for Two People',
        productDescription:
            'Serta Copenhagen Sofa Couch for Two People, Pillowed Back Cushions and Rounded Arms, Durable Modern Upholstered Fabric, 61" Loveseat, Brown',
        productPrice: 1220.99,
        productImage:
            'https://images-na.ssl-images-amazon.com/images/I/81sBT3voCPL._AC_SL1500_.jpg',
        productBrand: 'No brand',
        productCategory: 'Furniture',
        productQuantity: 8100,
        isFavorite: false,
        isPopular: true),
    Product(
        productId: 'Delta Children Plastic Toddler Bed',
        productTitle: 'Delta Children Plastic Toddler Bed',
        productDescription:
            'Delta Children Plastic Toddler Bed, Disney Princess + Delta Children Twinkle Galaxy Dual Sided Recycled Fiber Core Toddler Mattress (Bundle)',
        productPrice: 127.99,
        productImage:
            'https://images-na.ssl-images-amazon.com/images/I/71Rj3InxQlL._SL1500_.jpg',
        productBrand: 'No brand',
        productCategory: 'Furniture',
        productQuantity: 9145,
        isFavorite: false,
        isPopular: false),
    Product(
        productId: 'Outdoor Patio ',
        productTitle: 'Outdoor Patio ',
        productDescription:
            'Recaceik 3 Pieces Outdoor Patio Furniture Sets Rattan Chair Wicker Set, with Cushions and Tempered Glass Tabletop, Outdoor Indoor Use Backyard Porch Garden-(Brown)',
        productPrice: 1224.88,
        productImage:
            'https://images-na.ssl-images-amazon.com/images/I/81KabJxRvDL._AC_SL1500_.jpg',
        productBrand: 'No brand',
        productCategory: 'Furniture',
        productQuantity: 25,
        isFavorite: false,
        isPopular: true),
    Product(
        productId: 'Flash Furniture Nantucket 6 Piece',
        productTitle: 'Flash Furniture Nantucket 6 Piece',
        productDescription:
            'Flash Furniture Nantucket 6 Piece Black Patio Garden Set with Table, Umbrella and 4 Folding Chairs',
        productPrice: 1220.99,
        productImage:
            'https://images-na.ssl-images-amazon.com/images/I/81khjDZg5xL._AC_SL1500_.jpg',
        productBrand: 'No brand',
        productCategory: 'Furniture',
        productQuantity: 651,
        isFavorite: false,
        isPopular: false),
    Product(
        productId: 'Homall 4 Pieces Patio Outdoor Furniture Sets',
        productTitle: 'Homall 4 Pieces Patio Outdoor Furniture Sets',
        productDescription:
            'Homall 4 Pieces Patio Outdoor Furniture Sets, All Weather PE Rattan Wicker Sectional Sofa Modern Manual Conversation Sets with Cushions and Glass Table for Lawn Backyard Garden Poolside（Beige）',
        productPrice: 1220.99,
        productImage:
            'https://images-na.ssl-images-amazon.com/images/I/716-fllmUCL._AC_SL1500_.jpg',
        productBrand: 'No brand',
        productCategory: 'Furniture',
        productQuantity: 594,
        isFavorite: false,
        isPopular: true),
    Product(
        productId: 'Ashley Furniture Signature Design',
        productTitle: 'Ashley Furniture Signature Design',
        productDescription:
            'Ashley Furniture Signature Design - Dolante Upholstered Bed - Queen Size - Complete Bed Set in a Box - Contemporary Style Checker - Gray',
        productPrice: 300.99,
        productImage:
            'https://images-na.ssl-images-amazon.com/images/I/71QxxtRFFkL._AC_SL1232_.jpg',
        productBrand: 'No brand',
        productCategory: 'Furniture',
        productQuantity: 78,
        isFavorite: false,
        isPopular: false),
    Product(
        productId: 'Apple Watch Series 3',
        productTitle: 'Apple Watch Series 3',
        productDescription:
            'Apple Watch Series 3 (GPS, 38mm) - Silver Aluminum Case with White Sport Band',
        productPrice: 100.99,
        productImage:
            'https://images-na.ssl-images-amazon.com/images/I/71vCuRn4CkL._AC_SL1500_.jpg',
        productBrand: 'Apple',
        productCategory: 'Watches',
        productQuantity: 156,
        isFavorite: false,
        isPopular: true),
    Product(
        productId: 'Garmin Forerunner 45S',
        productTitle: 'Garmin Forerunner 45S',
        productDescription:
            'Garmin Forerunner 45S, 39mm Easy-to-use GPS Running Watch with Coach Free Training Plan Support, Purple',
        productPrice: 86.99,
        productImage:
            'https://images-na.ssl-images-amazon.com/images/I/51EWl3XsiYL._AC_SL1000_.jpg',
        productBrand: 'No brand',
        productCategory: 'Watches',
        productQuantity: 142,
        isFavorite: false,
        isPopular: false),
    Product(
        productId: 'Samsung Galaxy Watch Active 2',
        productTitle: 'Samsung Galaxy Watch Active 2',
        productDescription:
            'Samsung Galaxy Watch Active 2 (40mm, GPS, Bluetooth) Smart Watch with Advanced Health Monitoring, Fitness Tracking , and Long Lasting Battery - Silver (US Version)',
        productPrice: 300.99,
        productImage:
            'https://images-na.ssl-images-amazon.com/images/I/51bSW9gjoaL._AC_SL1024_.jpg',
        productBrand: 'Samsung',
        productCategory: 'Watches',
        productQuantity: 167,
        isFavorite: false,
        isPopular: false),
    Product(
        productId: 'Garmin vivoactive 4S',
        productTitle: 'Garmin vivoactive 4S',
        productDescription:
            'Garmin vivoactive 4S, Smaller-Sized GPS Smartwatch, Features Music, Body Energy Monitoring, Animated Workouts, Pulse Ox Sensors, Rose Gold with White Band',
        productPrice: 40.99,
        productImage:
            'https://images-na.ssl-images-amazon.com/images/I/51r2LCE3FLL._AC_SL1000_.jpg',
        productBrand: 'No brand',
        productCategory: 'Watches',
        productQuantity: 659,
        isFavorite: false,
        isPopular: false),
    Product(
        productId: 'Patek Philippe World',
        productTitle: 'Patek Philippe World',
        productDescription:
            'Patek Philippe World Time Men\'s Watch Model 5131/1P-001',
        productPrice: 20.99,
        productImage:
            'https://images-na.ssl-images-amazon.com/images/I/61MVdCYfbOL._AC_UX679_.jpg',
        productBrand: 'No brand',
        productCategory: 'Watches',
        productQuantity: 98,
        isFavorite: false,
        isPopular: false),
    Product(
        productId: 'Bell & Ross Men',
        productTitle: 'Bell & Ross Men',
        productDescription:
            'Bell & Ross Men\'s BR-MNUTTOURB-PG Minuteur\' Black Carbon Fiber Dial 18K Rose Gold Tourbillon Watch',
        productPrice: 33.99,
        productImage:
            'https://images-na.ssl-images-amazon.com/images/I/91M50AHRTKL._AC_UX569_.jpg',
        productBrand: 'No brand',
        productCategory: 'Watches',
        productQuantity: 951,
        isFavorite: false,
        isPopular: false),
    Product(
        productId: 'New Apple Watch Series',
        productTitle: 'New Apple Watch Series',
        productDescription:
            'New Apple Watch Series 6 (GPS, 40mm) - Blue Aluminum Case with Deep Navy Sport Band ',
        productPrice: 400.99,
        productImage:
            'https://images-na.ssl-images-amazon.com/images/I/71bf9IpGjtL._AC_SL1500_.jpg',
        productBrand: 'Apple',
        productCategory: 'Watches',
        productQuantity: 951,
        isFavorite: false,
        isPopular: false),
    Product(
        productId: 'New Apple Watch SE',
        productTitle: 'New Apple Watch SE',
        productDescription:
            'New Apple Watch SE (GPS, 40mm) - Gold Aluminum Case with Pink Sand Sport Band',
        productPrice: 200.99,
        productImage:
            'https://images-na.ssl-images-amazon.com/images/I/71JtUMDeBBL._AC_SL1500_.jpg',
        productBrand: 'Apple',
        productCategory: 'Watches',
        productQuantity: 951,
        isFavorite: false,
        isPopular: false),
    Product(
        productId: 'YAMAY Smart Watch 2020 Ver',
        productTitle: 'YAMAY Smart Watch 2020 Ver',
        productDescription:
            'YAMAY Smart Watch 2020 Ver. Watches for Men Women Fitness Tracker Blood Pressure Monitor Blood Oxygen Meter Heart Rate Monitor IP68 Waterproof, Smartwatch Compatible with iPhone Samsung Android Phones',
        productPrice: 183.99,
        productImage:
            'https://images-na.ssl-images-amazon.com/images/I/61gCtkVYb5L._AC_SL1000_.jpg',
        productBrand: 'Apple',
        productCategory: 'Watches',
        productQuantity: 56,
        isFavorite: false,
        isPopular: true),
    Product(
        productId: 'Samsung Galaxy Watch Active 23',
        productTitle: 'Samsung Galaxy Watch Active ',
        productDescription:
            'Samsung Galaxy Watch Active (40MM, GPS, Bluetooth) Smart Watch with Fitness Tracking, and Sleep Analysis - Rose Gold  (US Version)',
        productPrice: 150.99,
        productImage:
            'https://images-na.ssl-images-amazon.com/images/I/61n1c2vnPJL._AC_SL1500_.jpg',
        productBrand: 'Samsung',
        productCategory: 'Watches',
        productQuantity: 78,
        isFavorite: false,
        isPopular: true),
    Product(
        productId: 'Samsung Galaxy Watch 3',
        productTitle: 'Samsung Galaxy Watch 3',
        productDescription:
            'Samsung Galaxy Watch 3 (41mm, GPS, Bluetooth) Smart Watch with Advanced Health monitoring, Fitness Tracking , and Long lasting Battery - Mystic Silver (US Version)',
        productPrice: 184.99,
        productImage:
            'https://images-na.ssl-images-amazon.com/images/I/81Iu41zFPwL._AC_SL1500_.jpg',
        productBrand: 'Samsung',
        productCategory: 'Watches',
        productQuantity: 9598,
        isFavorite: false,
        isPopular: true),
    Product(
        productId: 'Samsung Galaxy Watch Active2 ',
        productTitle: 'Samsung Galaxy Watch Active2 ',
        productDescription:
            'Samsung Galaxy Watch Active2 (Silicon Strap + Aluminum Bezel) Bluetooth - International (Aqua Black, R820-44mm)',
        productPrice: 120.99,
        productImage:
            'https://images-na.ssl-images-amazon.com/images/I/518qjbbuGZL._AC_SL1000_.jpg',
        productBrand: 'Samsung',
        productCategory: 'Watches',
        productQuantity: 951,
        isFavorite: false,
        isPopular: false),
    Product(
        productId: 'Huawei Watch 2 Sport Smartwatch',
        productTitle: 'Huawei Watch 2 Sport Smartwatch',
        productDescription:
            'Huawei Watch 2 Sport Smartwatch - Ceramic Bezel - Carbon Black Strap (US Warranty)',
        productPrice: 180.99,
        productImage:
            'https://images-na.ssl-images-amazon.com/images/I/71yPa1g4gWL._AC_SL1500_.jpg',
        productBrand: 'Huawei',
        productCategory: 'Watches',
        productQuantity: 951,
        isFavorite: false,
        isPopular: true),
  ];

  List<Product> _products = [];
  // final List<Product> _localProducts = [];

  Future<void> fetchProducts() async {
    await FirebaseFirestore.instance
        .collection('products')
        .get()
        .then((QuerySnapshot productSnapshot) {
      _products = [];
      for (var element in productSnapshot.docs) {
        // var parseDatee = DateTime.parse(element['createdAt']);
        _products.insert(
          0,
          Product(
            createdAt: element.get('createdAt').toString(),
            productId: element.get('productId'),
            productTitle: element.get('productTitle'),
            productBrand: element.get('productBrand'),
            productDescription: element.get('productDescription'),
            productImage: element.get('productImage'),
            productPrice: double.parse(element.get('productPrice')),
            productCategory: element.get('productCategory'),
            productQuantity: int.parse(element.get('productQuantity')),
            isFavorite: element.get('isFavorite'),
            isPopular: element.get('isPopular'),
          ),
        );
        // _products.sort((a, b) => a.createdAt!.compareTo(b.createdAt!));
      }
    });
  }

  Future<void> fetchAddToCartProducts(String uid) async {
    await FirebaseFirestore.instance
        .collection('addToCarts')
        .doc(uid)
        .collection('productLists')
        .get()
        .then((QuerySnapshot productSnapshot) {
      _products = [];
      for (var element in productSnapshot.docs) {
        // var parseDatee = DateTime.parse(element['createdAt']);
        _products.insert(
          0,
          Product(
            createdAt: element.get('createdAt').toString(),
            productId: element.get('productId'),
            productTitle: element.get('productTitle'),
            productBrand: element.get('productBrand'),
            productDescription: element.get('productDescription'),
            productImage: element.get('productImage'),
            productPrice: double.parse(element.get('productPrice')),
            productCategory: element.get('productCategory'),
            productQuantity: int.parse(element.get('productQuantity')),
            isFavorite: element.get('isFavorite'),
            isPopular: element.get('isPopular'),
          ),
        );
        // _products.sort((a, b) => a.createdAt!.compareTo(b.createdAt!));
      }
    });
  }

  List<Product> products() => _products;
  List<Product> localProducts() => _localProducts;
  List<Product> addTocartProduct() => _products;

  List<Product> getByCatName(String catName) {
    List<Product> catList = _products
        .where(
          (element) =>
              element.productCategory.toLowerCase() == catName.toLowerCase(),
        )
        .toList();
    return catList;
  }

  List<Product> getByBrandName(String brandName) {
    List<Product> catList = _products
        .where((element) =>
            element.productBrand.toLowerCase() == brandName.toLowerCase())
        .toList();
    return catList;
  }

  List<Product> get popularProducts {
    // return _products.where((element) => element.isPopular).toList();
    return _products.where((element) => element.isPopular).toList();
    //  for(var product in _products) {

    //  }
  }

  Product getById(String prodId) {
    return _products.firstWhere((element) => element.productId == prodId);
  }

  List<Product> getBySearch(String search) {
    List<Product> prodList = _products
        .where((element) =>
            element.productTitle.toLowerCase().contains(search.toLowerCase()))
        .toList();
    notifyListeners();
    return prodList;
  }
}
