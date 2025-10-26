// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class T {
  T();

  static T? _current;

  static T get current {
    assert(
      _current != null,
      'No instance of T was loaded. Try to initialize the T delegate before accessing T.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<T> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = T();
      T._current = instance;

      return instance;
    });
  }

  static T of(BuildContext context) {
    final instance = T.maybeOf(context);
    assert(
      instance != null,
      'No instance of T present in the widget tree. Did you add T.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static T? maybeOf(BuildContext context) {
    return Localizations.of<T>(context, T);
  }

  /// `Sign in`
  String get signIn {
    return Intl.message('Sign in', name: 'signIn', desc: '', args: []);
  }

  /// `Sign up`
  String get signUp {
    return Intl.message('Sign up', name: 'signUp', desc: '', args: []);
  }

  /// `Create Account`
  String get createAccount {
    return Intl.message(
      'Create Account',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Tell us About yourself`
  String get tellUsAboutYourself {
    return Intl.message(
      'Tell us About yourself',
      name: 'tellUsAboutYourself',
      desc: '',
      args: [],
    );
  }

  /// `Email Address`
  String get emailAddress {
    return Intl.message(
      'Email Address',
      name: 'emailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Firstname`
  String get firstname {
    return Intl.message('Firstname', name: 'firstname', desc: '', args: []);
  }

  /// `Enter Email address`
  String get enterEmailAddress {
    return Intl.message(
      'Enter Email address',
      name: 'enterEmailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Who do you shop for ?`
  String get whoDoYouShopFor {
    return Intl.message(
      'Who do you shop for ?',
      name: 'whoDoYouShopFor',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Lastname`
  String get lastname {
    return Intl.message('Lastname', name: 'lastname', desc: '', args: []);
  }

  /// `Continue`
  String get continueText {
    return Intl.message('Continue', name: 'continueText', desc: '', args: []);
  }

  /// `Men`
  String get men {
    return Intl.message('Men', name: 'men', desc: '', args: []);
  }

  /// `Reset`
  String get reset {
    return Intl.message('Reset', name: 'reset', desc: '', args: []);
  }

  /// `Women`
  String get women {
    return Intl.message('Women', name: 'women', desc: '', args: []);
  }

  /// `Forgot Password ? Reset`
  String get forgotPasswordReset {
    return Intl.message(
      'Forgot Password ? Reset',
      name: 'forgotPasswordReset',
      desc: '',
      args: [],
    );
  }

  /// `How Old are you ?`
  String get howOldAreYou {
    return Intl.message(
      'How Old are you ?',
      name: 'howOldAreYou',
      desc: '',
      args: [],
    );
  }

  /// `We Sent you an Email to reset your password.`
  String get weSentYouEmail {
    return Intl.message(
      'We Sent you an Email to reset your password.',
      name: 'weSentYouEmail',
      desc: '',
      args: [],
    );
  }

  /// `Age Range`
  String get ageRange {
    return Intl.message('Age Range', name: 'ageRange', desc: '', args: []);
  }

  /// `Dont have an Account ? `
  String get dontHaveAccount {
    return Intl.message(
      'Dont have an Account ? ',
      name: 'dontHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Create One`
  String get createOne {
    return Intl.message('Create One', name: 'createOne', desc: '', args: []);
  }

  /// `Return to Login`
  String get returnToLogin {
    return Intl.message(
      'Return to Login',
      name: 'returnToLogin',
      desc: '',
      args: [],
    );
  }

  /// `Continue With Apple`
  String get continueWithApple {
    return Intl.message(
      'Continue With Apple',
      name: 'continueWithApple',
      desc: '',
      args: [],
    );
  }

  /// `Continue With Google`
  String get continueWithGoogle {
    return Intl.message(
      'Continue With Google',
      name: 'continueWithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Continue With Facebook`
  String get continueWithFacebook {
    return Intl.message(
      'Continue With Facebook',
      name: 'continueWithFacebook',
      desc: '',
      args: [],
    );
  }

  /// `Finish`
  String get finish {
    return Intl.message('Finish', name: 'finish', desc: '', args: []);
  }

  /// `Search`
  String get search {
    return Intl.message('Search', name: 'search', desc: '', args: []);
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Orders`
  String get orders {
    return Intl.message('Orders', name: 'orders', desc: '', args: []);
  }

  /// `Cart`
  String get cart {
    return Intl.message('Cart', name: 'cart', desc: '', args: []);
  }

  /// `Checkout`
  String get checkout {
    return Intl.message('Checkout', name: 'checkout', desc: '', args: []);
  }

  /// `Wishlist`
  String get wishlist {
    return Intl.message('Wishlist', name: 'wishlist', desc: '', args: []);
  }

  /// `Shop by Categories`
  String get shopByCategories {
    return Intl.message(
      'Shop by Categories',
      name: 'shopByCategories',
      desc: '',
      args: [],
    );
  }

  /// `See All`
  String get seeAll {
    return Intl.message('See All', name: 'seeAll', desc: '', args: []);
  }

  /// `Hoodies`
  String get hoodies {
    return Intl.message('Hoodies', name: 'hoodies', desc: '', args: []);
  }

  /// `Accessories`
  String get accessories {
    return Intl.message('Accessories', name: 'accessories', desc: '', args: []);
  }

  /// `Shorts`
  String get shorts {
    return Intl.message('Shorts', name: 'shorts', desc: '', args: []);
  }

  /// `Shoes`
  String get shoes {
    return Intl.message('Shoes', name: 'shoes', desc: '', args: []);
  }

  /// `Bags`
  String get bags {
    return Intl.message('Bags', name: 'bags', desc: '', args: []);
  }

  /// `Top Selling`
  String get topSelling {
    return Intl.message('Top Selling', name: 'topSelling', desc: '', args: []);
  }

  /// `New In`
  String get newIn {
    return Intl.message('New In', name: 'newIn', desc: '', args: []);
  }

  /// `Explore Categories`
  String get exploreCategories {
    return Intl.message(
      'Explore Categories',
      name: 'exploreCategories',
      desc: '',
      args: [],
    );
  }

  /// `Men's Fleece Pullover Hoodie`
  String get mensFleecePulloverHoodie {
    return Intl.message(
      'Men\'s Fleece Pullover Hoodie',
      name: 'mensFleecePulloverHoodie',
      desc: '',
      args: [],
    );
  }

  /// `Fleece Pullover Skate Hoodie`
  String get fleecePulloverSkateHoodie {
    return Intl.message(
      'Fleece Pullover Skate Hoodie',
      name: 'fleecePulloverSkateHoodie',
      desc: '',
      args: [],
    );
  }

  /// `Carl max Cardigan`
  String get carlMaxCardigan {
    return Intl.message(
      'Carl max Cardigan',
      name: 'carlMaxCardigan',
      desc: '',
      args: [],
    );
  }

  /// `Men's Harrington Jacket`
  String get mensHarringtonJacket {
    return Intl.message(
      'Men\'s Harrington Jacket',
      name: 'mensHarringtonJacket',
      desc: '',
      args: [],
    );
  }

  /// `Max Cirro Men's Slides`
  String get maxCirroMensSlides {
    return Intl.message(
      'Max Cirro Men\'s Slides',
      name: 'maxCirroMensSlides',
      desc: '',
      args: [],
    );
  }

  /// `Men's Coaches Jacket`
  String get mensCoachesJacket {
    return Intl.message(
      'Men\'s Coaches Jacket',
      name: 'mensCoachesJacket',
      desc: '',
      args: [],
    );
  }

  /// `Fleece Skate Hoodie`
  String get fleeceSkateHoodie {
    return Intl.message(
      'Fleece Skate Hoodie',
      name: 'fleeceSkateHoodie',
      desc: '',
      args: [],
    );
  }

  /// `Men's Ice-Dye Pullover Hoodie`
  String get mensIceDyePulloverHoodie {
    return Intl.message(
      'Men\'s Ice-Dye Pullover Hoodie',
      name: 'mensIceDyePulloverHoodie',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email`
  String get pleaseEnterValidEmail {
    return Intl.message(
      'Please enter a valid email',
      name: 'pleaseEnterValidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your password`
  String get pleaseEnterYourPassword {
    return Intl.message(
      'Please enter your password',
      name: 'pleaseEnterYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email address`
  String get pleaseEnterYourEmail {
    return Intl.message(
      'Please enter your email address',
      name: 'pleaseEnterYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email address`
  String get pleaseEnterValidEmailAddress {
    return Intl.message(
      'Please enter a valid email address',
      name: 'pleaseEnterValidEmailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Nike Unscripted`
  String get nikeUnscripted {
    return Intl.message(
      'Nike Unscripted',
      name: 'nikeUnscripted',
      desc: '',
      args: [],
    );
  }

  /// `Nike SB`
  String get nikeSB {
    return Intl.message('Nike SB', name: 'nikeSB', desc: '', args: []);
  }

  /// `Nike Windrunner`
  String get nikeWindrunner {
    return Intl.message(
      'Nike Windrunner',
      name: 'nikeWindrunner',
      desc: '',
      args: [],
    );
  }

  /// `Men's Monogram Hoodie`
  String get mensMonogramHoodie {
    return Intl.message(
      'Men\'s Monogram Hoodie',
      name: 'mensMonogramHoodie',
      desc: '',
      args: [],
    );
  }

  /// `Men's Pullover Basketball Hoodie`
  String get mensPulloverBasketballHoodie {
    return Intl.message(
      'Men\'s Pullover Basketball Hoodie',
      name: 'mensPulloverBasketballHoodie',
      desc: '',
      args: [],
    );
  }

  /// `Club Fleece Mens Jacket`
  String get clubFleeceMensJacket {
    return Intl.message(
      'Club Fleece Mens Jacket',
      name: 'clubFleeceMensJacket',
      desc: '',
      args: [],
    );
  }

  /// `Skate Jacket`
  String get skateJacket {
    return Intl.message(
      'Skate Jacket',
      name: 'skateJacket',
      desc: '',
      args: [],
    );
  }

  /// `Therma Fit Puffer Jacket`
  String get thermaFitPufferJacket {
    return Intl.message(
      'Therma Fit Puffer Jacket',
      name: 'thermaFitPufferJacket',
      desc: '',
      args: [],
    );
  }

  /// `Men's Workwear Jacket`
  String get mensWorkwearJacket {
    return Intl.message(
      'Men\'s Workwear Jacket',
      name: 'mensWorkwearJacket',
      desc: '',
      args: [],
    );
  }

  /// `Nike Fuel Pack`
  String get nikeFuelPack {
    return Intl.message(
      'Nike Fuel Pack',
      name: 'nikeFuelPack',
      desc: '',
      args: [],
    );
  }

  /// `Nike Show X Rush`
  String get nikeShowXRush {
    return Intl.message(
      'Nike Show X Rush',
      name: 'nikeShowXRush',
      desc: '',
      args: [],
    );
  }

  /// `Men's T-Shirt`
  String get mensTShirt {
    return Intl.message(
      'Men\'s T-Shirt',
      name: 'mensTShirt',
      desc: '',
      args: [],
    );
  }

  /// `Men's Skate T-Shirt`
  String get mensSkateTShirt {
    return Intl.message(
      'Men\'s Skate T-Shirt',
      name: 'mensSkateTShirt',
      desc: '',
      args: [],
    );
  }

  /// `Order`
  String get order {
    return Intl.message('Order', name: 'order', desc: '', args: []);
  }

  /// `Order Confirmed`
  String get orderConfirmed {
    return Intl.message(
      'Order Confirmed',
      name: 'orderConfirmed',
      desc: '',
      args: [],
    );
  }

  /// `Order Placed`
  String get orderPlaced {
    return Intl.message(
      'Order Placed',
      name: 'orderPlaced',
      desc: '',
      args: [],
    );
  }

  /// `Processing`
  String get processing {
    return Intl.message('Processing', name: 'processing', desc: '', args: []);
  }

  /// `Shipped`
  String get shipped {
    return Intl.message('Shipped', name: 'shipped', desc: '', args: []);
  }

  /// `Delivered`
  String get delivered {
    return Intl.message('Delivered', name: 'delivered', desc: '', args: []);
  }

  /// `Returned`
  String get returned {
    return Intl.message('Returned', name: 'returned', desc: '', args: []);
  }

  /// `Canceled`
  String get canceled {
    return Intl.message('Canceled', name: 'canceled', desc: '', args: []);
  }

  /// `No Notification yet`
  String get noNotificationYet {
    return Intl.message(
      'No Notification yet',
      name: 'noNotificationYet',
      desc: '',
      args: [],
    );
  }

  /// `No Orders yet`
  String get noOrdersYet {
    return Intl.message(
      'No Orders yet',
      name: 'noOrdersYet',
      desc: '',
      args: [],
    );
  }

  /// `Order Items`
  String get orderItems {
    return Intl.message('Order Items', name: 'orderItems', desc: '', args: []);
  }

  /// `Order Placed Successfully`
  String get orderPlacedSuccessfully {
    return Intl.message(
      'Order Placed Successfully',
      name: 'orderPlacedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `You will recieve an email confirmation`
  String get youWillReceiveEmail {
    return Intl.message(
      'You will recieve an email confirmation',
      name: 'youWillReceiveEmail',
      desc: '',
      args: [],
    );
  }

  /// `See Order details`
  String get seeOrderDetails {
    return Intl.message(
      'See Order details',
      name: 'seeOrderDetails',
      desc: '',
      args: [],
    );
  }

  /// `Sort by`
  String get sortBy {
    return Intl.message('Sort by', name: 'sortBy', desc: '', args: []);
  }

  /// `Gender`
  String get gender {
    return Intl.message('Gender', name: 'gender', desc: '', args: []);
  }

  /// `Deals`
  String get deals {
    return Intl.message('Deals', name: 'deals', desc: '', args: []);
  }

  /// `Price`
  String get price {
    return Intl.message('Price', name: 'price', desc: '', args: []);
  }

  /// `Recommended`
  String get recommended {
    return Intl.message('Recommended', name: 'recommended', desc: '', args: []);
  }

  /// `On sale`
  String get onSale {
    return Intl.message('On sale', name: 'onSale', desc: '', args: []);
  }

  /// `Newest`
  String get newest {
    return Intl.message('Newest', name: 'newest', desc: '', args: []);
  }

  /// `Free Shipping Eligible`
  String get freeShippingEligible {
    return Intl.message(
      'Free Shipping Eligible',
      name: 'freeShippingEligible',
      desc: '',
      args: [],
    );
  }

  /// `Min`
  String get min {
    return Intl.message('Min', name: 'min', desc: '', args: []);
  }

  /// `Max`
  String get max {
    return Intl.message('Max', name: 'max', desc: '', args: []);
  }

  /// `Lowest - Highest Price`
  String get lowestHighestPrice {
    return Intl.message(
      'Lowest - Highest Price',
      name: 'lowestHighestPrice',
      desc: '',
      args: [],
    );
  }

  /// `Highest - Lowest Price`
  String get highestLowestPrice {
    return Intl.message(
      'Highest - Lowest Price',
      name: 'highestLowestPrice',
      desc: '',
      args: [],
    );
  }

  /// `Clear`
  String get clear {
    return Intl.message('Clear', name: 'clear', desc: '', args: []);
  }

  /// `Results Found`
  String get resultsFound {
    return Intl.message(
      'Results Found',
      name: 'resultsFound',
      desc: '',
      args: [],
    );
  }

  /// `Sorry, we couldn't find any matching result for your Search.`
  String get noMatchingResults {
    return Intl.message(
      'Sorry, we couldn\'t find any matching result for your Search.',
      name: 'noMatchingResults',
      desc: '',
      args: [],
    );
  }

  /// `Size`
  String get size {
    return Intl.message('Size', name: 'size', desc: '', args: []);
  }

  /// `Color`
  String get color {
    return Intl.message('Color', name: 'color', desc: '', args: []);
  }

  /// `Quantity`
  String get quantity {
    return Intl.message('Quantity', name: 'quantity', desc: '', args: []);
  }

  /// `Add to Bag`
  String get addToBag {
    return Intl.message('Add to Bag', name: 'addToBag', desc: '', args: []);
  }

  /// `Remove All`
  String get removeAll {
    return Intl.message('Remove All', name: 'removeAll', desc: '', args: []);
  }

  /// `Your Cart is Empty`
  String get yourCartIsEmpty {
    return Intl.message(
      'Your Cart is Empty',
      name: 'yourCartIsEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Enter Coupon Code`
  String get enterCouponCode {
    return Intl.message(
      'Enter Coupon Code',
      name: 'enterCouponCode',
      desc: '',
      args: [],
    );
  }

  /// `Subtotal`
  String get subtotal {
    return Intl.message('Subtotal', name: 'subtotal', desc: '', args: []);
  }

  /// `Shipping Cost`
  String get shippingCost {
    return Intl.message(
      'Shipping Cost',
      name: 'shippingCost',
      desc: '',
      args: [],
    );
  }

  /// `Tax`
  String get tax {
    return Intl.message('Tax', name: 'tax', desc: '', args: []);
  }

  /// `Total`
  String get total {
    return Intl.message('Total', name: 'total', desc: '', args: []);
  }

  /// `Place Order`
  String get placeOrder {
    return Intl.message('Place Order', name: 'placeOrder', desc: '', args: []);
  }

  /// `S`
  String get sizeS {
    return Intl.message('S', name: 'sizeS', desc: '', args: []);
  }

  /// `M`
  String get sizeM {
    return Intl.message('M', name: 'sizeM', desc: '', args: []);
  }

  /// `L`
  String get sizeL {
    return Intl.message('L', name: 'sizeL', desc: '', args: []);
  }

  /// `XL`
  String get sizeXL {
    return Intl.message('XL', name: 'sizeXL', desc: '', args: []);
  }

  /// `2XL`
  String get size2XL {
    return Intl.message('2XL', name: 'size2XL', desc: '', args: []);
  }

  /// `Lemon`
  String get colorLemon {
    return Intl.message('Lemon', name: 'colorLemon', desc: '', args: []);
  }

  /// `Black`
  String get colorBlack {
    return Intl.message('Black', name: 'colorBlack', desc: '', args: []);
  }

  /// `Orange`
  String get colorOrange {
    return Intl.message('Orange', name: 'colorOrange', desc: '', args: []);
  }

  /// `Red`
  String get colorRed {
    return Intl.message('Red', name: 'colorRed', desc: '', args: []);
  }

  /// `Yellow`
  String get colorYellow {
    return Intl.message('Yellow', name: 'colorYellow', desc: '', args: []);
  }

  /// `Blue`
  String get colorBlue {
    return Intl.message('Blue', name: 'colorBlue', desc: '', args: []);
  }

  /// `Shipping Address`
  String get shippingAddress {
    return Intl.message(
      'Shipping Address',
      name: 'shippingAddress',
      desc: '',
      args: [],
    );
  }

  /// `Add Shipping Address`
  String get addShippingAddress {
    return Intl.message(
      'Add Shipping Address',
      name: 'addShippingAddress',
      desc: '',
      args: [],
    );
  }

  /// `Add Address`
  String get addAddress {
    return Intl.message('Add Address', name: 'addAddress', desc: '', args: []);
  }

  /// `Street Address`
  String get streetAddress {
    return Intl.message(
      'Street Address',
      name: 'streetAddress',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get city {
    return Intl.message('City', name: 'city', desc: '', args: []);
  }

  /// `State`
  String get state {
    return Intl.message('State', name: 'state', desc: '', args: []);
  }

  /// `Zip Code`
  String get zipCode {
    return Intl.message('Zip Code', name: 'zipCode', desc: '', args: []);
  }

  /// `Payment Method`
  String get paymentMethod {
    return Intl.message(
      'Payment Method',
      name: 'paymentMethod',
      desc: '',
      args: [],
    );
  }

  /// `Add Payment Method`
  String get addPaymentMethod {
    return Intl.message(
      'Add Payment Method',
      name: 'addPaymentMethod',
      desc: '',
      args: [],
    );
  }

  /// `Add Card`
  String get addCard {
    return Intl.message('Add Card', name: 'addCard', desc: '', args: []);
  }

  /// `Card Number`
  String get cardNumber {
    return Intl.message('Card Number', name: 'cardNumber', desc: '', args: []);
  }

  /// `Cardholder Name`
  String get cardholderName {
    return Intl.message(
      'Cardholder Name',
      name: 'cardholderName',
      desc: '',
      args: [],
    );
  }

  /// `CCV`
  String get ccv {
    return Intl.message('CCV', name: 'ccv', desc: '', args: []);
  }

  /// `Exp`
  String get exp {
    return Intl.message('Exp', name: 'exp', desc: '', args: []);
  }

  /// `My Favourites`
  String get myFavourites {
    return Intl.message(
      'My Favourites',
      name: 'myFavourites',
      desc: '',
      args: [],
    );
  }

  /// `My Favorite`
  String get myFavorite {
    return Intl.message('My Favorite', name: 'myFavorite', desc: '', args: []);
  }

  /// `Edit`
  String get edit {
    return Intl.message('Edit', name: 'edit', desc: '', args: []);
  }

  /// `Help`
  String get help {
    return Intl.message('Help', name: 'help', desc: '', args: []);
  }

  /// `Support`
  String get support {
    return Intl.message('Support', name: 'support', desc: '', args: []);
  }

  /// `Sign Out`
  String get signOut {
    return Intl.message('Sign Out', name: 'signOut', desc: '', args: []);
  }

  /// `Save`
  String get save {
    return Intl.message('Save', name: 'save', desc: '', args: []);
  }

  /// `Built for life and made to last, this full-zip corduroy jacket is part of our Nike Life collection. The spacious fit gives you plenty of room to layer underneath, while the soft corduroy keeps it casual and timeless.`
  String get productDescription {
    return Intl.message(
      'Built for life and made to last, this full-zip corduroy jacket is part of our Nike Life collection. The spacious fit gives you plenty of room to layer underneath, while the soft corduroy keeps it casual and timeless.',
      name: 'productDescription',
      desc: '',
      args: [],
    );
  }

  /// `Gucci transcribes its heritage, creativity, and innovation into a plenitude of collections. From staple items to distinctive accessories.`
  String get gucciDescription {
    return Intl.message(
      'Gucci transcribes its heritage, creativity, and innovation into a plenitude of collections. From staple items to distinctive accessories.',
      name: 'gucciDescription',
      desc: '',
      args: [],
    );
  }

  /// `Shipping & Returns`
  String get shippingReturns {
    return Intl.message(
      'Shipping & Returns',
      name: 'shippingReturns',
      desc: '',
      args: [],
    );
  }

  /// `Free standard shipping and free 60-day returns`
  String get freeShippingReturns {
    return Intl.message(
      'Free standard shipping and free 60-day returns',
      name: 'freeShippingReturns',
      desc: '',
      args: [],
    );
  }

  /// `Reviews`
  String get reviews {
    return Intl.message('Reviews', name: 'reviews', desc: '', args: []);
  }

  /// `Ratings`
  String get ratings {
    return Intl.message('Ratings', name: 'ratings', desc: '', args: []);
  }

  /// `days ago`
  String get daysAgo {
    return Intl.message('days ago', name: 'daysAgo', desc: '', args: []);
  }

  /// `At least 1 lowercase letter`
  String get passwordValidationLowercase {
    return Intl.message(
      'At least 1 lowercase letter',
      name: 'passwordValidationLowercase',
      desc: '',
      args: [],
    );
  }

  /// `At least 1 uppercase letter`
  String get passwordValidationUppercase {
    return Intl.message(
      'At least 1 uppercase letter',
      name: 'passwordValidationUppercase',
      desc: '',
      args: [],
    );
  }

  /// `At least 1 number`
  String get passwordValidationNumber {
    return Intl.message(
      'At least 1 number',
      name: 'passwordValidationNumber',
      desc: '',
      args: [],
    );
  }

  /// `At least 8 characters`
  String get passwordValidationMinLength {
    return Intl.message(
      'At least 8 characters',
      name: 'passwordValidationMinLength',
      desc: '',
      args: [],
    );
  }

  /// `At least 1 special character`
  String get passwordValidationSpecialCharacter {
    return Intl.message(
      'At least 1 special character',
      name: 'passwordValidationSpecialCharacter',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email address format`
  String get firebaseInvalidEmail {
    return Intl.message(
      'Invalid email address format',
      name: 'firebaseInvalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `This account has been disabled`
  String get firebaseUserDisabled {
    return Intl.message(
      'This account has been disabled',
      name: 'firebaseUserDisabled',
      desc: '',
      args: [],
    );
  }

  /// `No user found with this email`
  String get firebaseUserNotFound {
    return Intl.message(
      'No user found with this email',
      name: 'firebaseUserNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Incorrect password`
  String get firebaseWrongPassword {
    return Intl.message(
      'Incorrect password',
      name: 'firebaseWrongPassword',
      desc: '',
      args: [],
    );
  }

  /// `Email is already registered`
  String get firebaseEmailAlreadyInUse {
    return Intl.message(
      'Email is already registered',
      name: 'firebaseEmailAlreadyInUse',
      desc: '',
      args: [],
    );
  }

  /// `Password is too weak`
  String get firebaseWeakPassword {
    return Intl.message(
      'Password is too weak',
      name: 'firebaseWeakPassword',
      desc: '',
      args: [],
    );
  }

  /// `This operation is not allowed`
  String get firebaseOperationNotAllowed {
    return Intl.message(
      'This operation is not allowed',
      name: 'firebaseOperationNotAllowed',
      desc: '',
      args: [],
    );
  }

  /// `Too many attempts. Please try again later`
  String get firebaseTooManyRequests {
    return Intl.message(
      'Too many attempts. Please try again later',
      name: 'firebaseTooManyRequests',
      desc: '',
      args: [],
    );
  }

  /// `Network error. Please check your connection`
  String get firebaseNetworkRequestFailed {
    return Intl.message(
      'Network error. Please check your connection',
      name: 'firebaseNetworkRequestFailed',
      desc: '',
      args: [],
    );
  }

  /// `Please log in again to perform this action`
  String get firebaseRequiresRecentLogin {
    return Intl.message(
      'Please log in again to perform this action',
      name: 'firebaseRequiresRecentLogin',
      desc: '',
      args: [],
    );
  }

  /// `An account already exists with a different sign-in method`
  String get firebaseAccountExistsWithDifferentCredential {
    return Intl.message(
      'An account already exists with a different sign-in method',
      name: 'firebaseAccountExistsWithDifferentCredential',
      desc: '',
      args: [],
    );
  }

  /// `The provided credential is malformed or has expired`
  String get firebaseInvalidCredential {
    return Intl.message(
      'The provided credential is malformed or has expired',
      name: 'firebaseInvalidCredential',
      desc: '',
      args: [],
    );
  }

  /// `This credential is already associated with a different user`
  String get firebaseCredentialAlreadyInUse {
    return Intl.message(
      'This credential is already associated with a different user',
      name: 'firebaseCredentialAlreadyInUse',
      desc: '',
      args: [],
    );
  }

  /// `The supplied credentials do not match the currently signed in user`
  String get firebaseUserMismatch {
    return Intl.message(
      'The supplied credentials do not match the currently signed in user',
      name: 'firebaseUserMismatch',
      desc: '',
      args: [],
    );
  }

  /// `This provider is already linked to the user`
  String get firebaseProviderAlreadyLinked {
    return Intl.message(
      'This provider is already linked to the user',
      name: 'firebaseProviderAlreadyLinked',
      desc: '',
      args: [],
    );
  }

  /// `No such provider is linked to the user`
  String get firebaseNoSuchProvider {
    return Intl.message(
      'No such provider is linked to the user',
      name: 'firebaseNoSuchProvider',
      desc: '',
      args: [],
    );
  }

  /// `Popup has been blocked by the browser`
  String get firebasePopupBlocked {
    return Intl.message(
      'Popup has been blocked by the browser',
      name: 'firebasePopupBlocked',
      desc: '',
      args: [],
    );
  }

  /// `Popup closed before completing sign-in`
  String get firebasePopupClosedByUser {
    return Intl.message(
      'Popup closed before completing sign-in',
      name: 'firebasePopupClosedByUser',
      desc: '',
      args: [],
    );
  }

  /// `This domain is not authorized for OAuth operations`
  String get firebaseUnauthorizedDomain {
    return Intl.message(
      'This domain is not authorized for OAuth operations',
      name: 'firebaseUnauthorizedDomain',
      desc: '',
      args: [],
    );
  }

  /// `An internal error occurred, try again later`
  String get firebaseInternalError {
    return Intl.message(
      'An internal error occurred, try again later',
      name: 'firebaseInternalError',
      desc: '',
      args: [],
    );
  }

  /// `The operation timed out, please try again`
  String get firebaseTimeout {
    return Intl.message(
      'The operation timed out, please try again',
      name: 'firebaseTimeout',
      desc: '',
      args: [],
    );
  }

  /// `This app is not authorized to perform this operation`
  String get firebaseAppNotAuthorized {
    return Intl.message(
      'This app is not authorized to perform this operation',
      name: 'firebaseAppNotAuthorized',
      desc: '',
      args: [],
    );
  }

  /// `The SMS verification code is invalid`
  String get firebaseInvalidVerificationCode {
    return Intl.message(
      'The SMS verification code is invalid',
      name: 'firebaseInvalidVerificationCode',
      desc: '',
      args: [],
    );
  }

  /// `The SMS verification ID is invalid`
  String get firebaseInvalidVerificationId {
    return Intl.message(
      'The SMS verification ID is invalid',
      name: 'firebaseInvalidVerificationId',
      desc: '',
      args: [],
    );
  }

  /// `Your session has expired, please try again`
  String get firebaseSessionExpired {
    return Intl.message(
      'Your session has expired, please try again',
      name: 'firebaseSessionExpired',
      desc: '',
      args: [],
    );
  }

  /// `Request quota exceeded, try again later`
  String get firebaseQuotaExceeded {
    return Intl.message(
      'Request quota exceeded, try again later',
      name: 'firebaseQuotaExceeded',
      desc: '',
      args: [],
    );
  }

  /// `Authentication failed`
  String get firebaseAuthFailed {
    return Intl.message(
      'Authentication failed',
      name: 'firebaseAuthFailed',
      desc: '',
      args: [],
    );
  }

  /// `An unexpected error occurred`
  String get unexpectedError {
    return Intl.message(
      'An unexpected error occurred',
      name: 'unexpectedError',
      desc: '',
      args: [],
    );
  }

  /// `Sign out failed`
  String get signOutFailed {
    return Intl.message(
      'Sign out failed',
      name: 'signOutFailed',
      desc: '',
      args: [],
    );
  }

  /// `Failed to send reset email`
  String get failedToSendResetEmail {
    return Intl.message(
      'Failed to send reset email',
      name: 'failedToSendResetEmail',
      desc: '',
      args: [],
    );
  }

  /// `Failed to send verification email`
  String get failedToSendVerificationEmail {
    return Intl.message(
      'Failed to send verification email',
      name: 'failedToSendVerificationEmail',
      desc: '',
      args: [],
    );
  }

  /// `Facebook login was cancelled by the user`
  String get facebookLoginCancelled {
    return Intl.message(
      'Facebook login was cancelled by the user',
      name: 'facebookLoginCancelled',
      desc: '',
      args: [],
    );
  }

  /// `Facebook login failed`
  String get facebookLoginFailed {
    return Intl.message(
      'Facebook login failed',
      name: 'facebookLoginFailed',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get ok {
    return Intl.message('Ok', name: 'ok', desc: '', args: []);
  }

  /// `Error`
  String get error {
    return Intl.message('Error', name: 'error', desc: '', args: []);
  }

  /// `Categories`
  String get categories {
    return Intl.message('Categories', name: 'categories', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<T> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<T> load(Locale locale) => T.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
