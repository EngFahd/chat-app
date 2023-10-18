part of 'chat_p_cubit.dart';

@immutable
sealed class ChatPState {}

final class ChatPInitial extends ChatPState {}

final class ChatSuccess extends ChatPState {
  List<Massages> massagesList = [];
  ChatSuccess({required this.massagesList});
}
