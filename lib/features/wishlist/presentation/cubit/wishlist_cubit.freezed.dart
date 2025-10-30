// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wishlist_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WishlistState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WishlistState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WishlistState()';
}


}

/// @nodoc
class $WishlistStateCopyWith<$Res>  {
$WishlistStateCopyWith(WishlistState _, $Res Function(WishlistState) __);
}


/// Adds pattern-matching-related methods to [WishlistState].
extension WishlistStatePatterns on WishlistState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Updated value)?  updated,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Updated() when updated != null:
return updated(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Updated value)  updated,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Updated():
return updated(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Updated value)?  updated,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Updated() when updated != null:
return updated(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( List<ProductsResponseModel> wishlistItems)?  updated,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Updated() when updated != null:
return updated(_that.wishlistItems);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( List<ProductsResponseModel> wishlistItems)  updated,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Updated():
return updated(_that.wishlistItems);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( List<ProductsResponseModel> wishlistItems)?  updated,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Updated() when updated != null:
return updated(_that.wishlistItems);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements WishlistState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WishlistState.initial()';
}


}




/// @nodoc


class _Updated implements WishlistState {
  const _Updated({required final  List<ProductsResponseModel> wishlistItems}): _wishlistItems = wishlistItems;
  

 final  List<ProductsResponseModel> _wishlistItems;
 List<ProductsResponseModel> get wishlistItems {
  if (_wishlistItems is EqualUnmodifiableListView) return _wishlistItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_wishlistItems);
}


/// Create a copy of WishlistState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdatedCopyWith<_Updated> get copyWith => __$UpdatedCopyWithImpl<_Updated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Updated&&const DeepCollectionEquality().equals(other._wishlistItems, _wishlistItems));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_wishlistItems));

@override
String toString() {
  return 'WishlistState.updated(wishlistItems: $wishlistItems)';
}


}

/// @nodoc
abstract mixin class _$UpdatedCopyWith<$Res> implements $WishlistStateCopyWith<$Res> {
  factory _$UpdatedCopyWith(_Updated value, $Res Function(_Updated) _then) = __$UpdatedCopyWithImpl;
@useResult
$Res call({
 List<ProductsResponseModel> wishlistItems
});




}
/// @nodoc
class __$UpdatedCopyWithImpl<$Res>
    implements _$UpdatedCopyWith<$Res> {
  __$UpdatedCopyWithImpl(this._self, this._then);

  final _Updated _self;
  final $Res Function(_Updated) _then;

/// Create a copy of WishlistState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? wishlistItems = null,}) {
  return _then(_Updated(
wishlistItems: null == wishlistItems ? _self._wishlistItems : wishlistItems // ignore: cast_nullable_to_non_nullable
as List<ProductsResponseModel>,
  ));
}


}

// dart format on
