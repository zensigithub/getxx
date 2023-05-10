part of 'mydemo_bloc.dart';

@immutable
abstract class MydemoEvent {}


 class IntialEvent  extends MydemoEvent {

  int i;
  IntialEvent( this.i);


 }

class Increment extends MydemoEvent {

}
class Decreent extends MydemoEvent {

}